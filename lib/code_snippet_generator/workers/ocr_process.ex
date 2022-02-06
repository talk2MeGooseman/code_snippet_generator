defmodule CodeSnippetGenerator.Workers.OcrProcess do
  use Oban.Worker, queue: :default

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

  def analyze(record) do
    image = List.first(record.media)

    case Azure.analyze_and_read_results(image) do
      {:ok, ocr_response} ->
        CodeSnippetGenerator.Twitter.update_tweet(record, %{
          result: ocr_response,
          status: :success
        })

        :ok

      {:error, message} ->
        IO.puts("Error happended during OCR Request")

        CodeSnippetGenerator.Twitter.update_tweet(record, %{
          status: :error,
          result: %{message: message}
        })

        :ok
    end
  end
end
