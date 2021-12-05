defmodule Azure do
  def api_client,
    do: Application.get_env(:code_snippet_generator, :azure_cognitive_client)

  @spec read_analyze(String.t()) :: any()
  def read_analyze(image_url) do
    with {:ok, response} <- api_client().post("/read/analyze", %{ url: image_url }),
          202 <- Map.get(response, :status_code) do
        response
        |> Map.get(:headers)
        |> Enum.find(fn ({ header, _value}) -> header == "Operation-Location" end)
        |> then(fn ({ _header, value }) -> {:ok, value} end)
    else
      _ ->
        {:error, "Failed to read image"}
    end
  end

  @spec read_results(String.t()) :: any()
  def read_results(results_url) do
    path = Azure.Cognitive.parse_operation_location(results_url)

    with {:ok, response} <- api_client().get(path),
          200 <- Map.get(response, :status_code) do

      {:ok, Map.get(response, :body)}
    else
      _ ->
        {:error, "Failed to read image"}
    end
  end

  def analyze_and_read_results(image_url) do
    with {:ok, operation_url} <- read_analyze(image_url),
      {:ok, results} <- read_results(operation_url) do
        # Check status notStarted: The operation has not started.
        # running: The operation is being processed.
        # failed: The operation has failed.
        # succeeded: The operation has succeeded.
        {:ok, results}
    else
      _ ->
        {:error, "Failed to read image"}
    end
  end
end
