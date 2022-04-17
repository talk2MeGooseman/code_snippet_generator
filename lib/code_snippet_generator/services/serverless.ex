defmodule Serverless do
  def guess_language(source_code) do
    code = System.get_env("GUESSLANG_CODE")

    with {:ok, response} <- Serverless.Api.post("guesslang?code=" <> code, %{code: source_code}),
         200 <- Map.get(response, :status_code) do
      {:ok, Map.get(response, :body)}
    else
      _ ->
        {:error, "Failed to guess the language"}
    end
  end
end
