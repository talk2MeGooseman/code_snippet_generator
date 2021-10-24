defmodule HttpBase do
  @moduledoc false

  alias HttpParser

  def get(url, query_params \\ %{}, headers) do
    url
    |> build_url(query_params)
    |> HTTPoison.get(headers)
    |> HttpParser.parse()
  end

  def post(url, headers, body \\ %{}) do
    json_body = Jason.encode!(body)

    url
    |> build_url()
    |> HTTPoison.post(json_body, headers)
    |> HttpParser.parse()
  end

  def patch(url, headers, body \\ %{}) do
    json_body = Jason.encode!(body)

    url
    |> build_url()
    |> HTTPoison.patch(json_body, headers)
    |> HttpParser.parse()
  end

  defp build_url(url, query_params \\ %{}) do
    query_params = process_params(query_params)

    "#{url}?#{URI.encode_query(query_params)}"
  end

  defp process_params(params) do
    %{}
    |> Map.merge(params)
    |> Map.delete(:__struct__)
  end
end
