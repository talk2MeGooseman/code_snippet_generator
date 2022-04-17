defmodule CodeSnippetGenerator.Workers.OcrProcess do
  use Oban.Worker, queue: :default

  alias CodeSnippetGenerator.Generator

  # %{id: 1} |> CodeSnippetGenerator.Workers.OcrProcess.new(schedule_in: 5) |> Oban.insert()

  @impl Oban.Worker
  def perform(%Oban.Job{args: %{"id" => id} = _args}) do
    case CodeSnippetGenerator.Twitter.get_tweet(id) do
      nil ->
        IO.puts("Tweet not found")
        :ok

      record ->
        analyze(record)
    end

    :ok
  end

  def analyze(tweet) do
    image = List.first(tweet.media)
    {:ok, snippet} = Generator.create_snippet(%{ tweet_id: tweet.id })

    case Azure.analyze_and_read_results(image) do
      {:ok, ocr_response} ->
        code = lines_of_code(ocr_response)

        language = case Serverless.guess_language(code) do
          {:ok, response} -> Map.get(response, "language")
          {:error, _} -> "unknown"
        end

        Generator.update_snippet(snippet, %{
          result: ocr_response,
          language: language,
          status: :success
        })

        :ok

      {:error, message} ->
        IO.puts("Error happended during OCR Request")

        Generator.update_snippet(snippet, %{
          status: :error,
          result: %{message: message}
        })

        :ok
    end
  end

  def lines_of_code(result) do
    get_in(result, ["analyzeResult", "readResults"])
    |> List.first()
    |> get_in(["lines"])
    |> Enum.map(fn line -> get_in(line, ["text"]) end)
    |> Enum.join(" ")
  end
end
