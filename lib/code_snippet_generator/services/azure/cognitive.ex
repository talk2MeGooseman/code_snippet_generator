defmodule Azure.Cognitive do
  use HTTPoison.Base

  def parse_operation_location(url) do
    "https://westus.api.cognitive.microsoft.com/vision/v3.2" <> path = url
    path
  end

  def process_request_url(url) do
    "https://westus.api.cognitive.microsoft.com/vision/v3.2" <> url
  end

  def process_response_body("" = body), do: body

  def process_response_body(body) do
    Jason.decode!(body)
  end

  def process_request_headers(headers \\ []) do
    headers ++ [
      {"Content-Type", "application/json"},
      {"Ocp-Apim-Subscription-Key", System.get_env("COGNITIVE_COMPUTER_VISION_SERVICE_KEY")}
    ]
  end

  def process_request_body(body), do: Jason.encode!(body)

end
