defmodule Serverless.Api do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://snippet-guesslang.azurewebsites.net/api/" <> url
  end

  def process_response_body("" = body), do: body

  def process_response_body(body) do
    Jason.decode!(body)
  end

  def process_request_headers(headers \\ []) do
    headers ++ [
      {"Content-Type", "application/json"},
    ]
  end

  def process_request_body(body), do: Jason.encode!(body)

end
