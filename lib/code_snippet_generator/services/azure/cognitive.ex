defmodule Azure.Cognitive do
  import HttpBase

  @behaviour Azure.CognitiveProvider

  @impl Azure.CognitiveProvider
  def read_analyze(target_image_url) do
    headers = [
      {"Content-Type", "application/json"},
      {"Ocp-Apim-Subscription-Key", System.get_env("COGNITIVE_COMPUTER_VISION_SERVICE_KEY")}
    ]

    body = %{url: target_image_url}

    post("https://westus.api.cognitive.microsoft.com/vision/v3.2/read/analyze", headers, body)
  end
end
