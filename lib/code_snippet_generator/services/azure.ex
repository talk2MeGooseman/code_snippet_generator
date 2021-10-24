defmodule Azure do
  def api_client,
    do: Application.get_env(:code_snippet_generator, :azure_cognitive_client)

    @spec read_analyze(String.t()) :: any()
    def read_analyze(image_url) do
      api_client().read_analyze(image_url)
    end
end
