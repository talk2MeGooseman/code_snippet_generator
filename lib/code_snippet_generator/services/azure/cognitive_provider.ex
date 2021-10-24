defmodule Azure.CognitiveProvider do
  @callback read_analyze(String.t()) :: any()
end
