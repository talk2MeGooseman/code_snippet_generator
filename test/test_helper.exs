{:ok, _} = Application.ensure_all_started(:ex_machina)
ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(CodeSnippetGenerator.Repo, :manual)

# Mocks services out using their provider
Mox.defmock(Azure.MockCognitive, for: Azure.CognitiveProvider)
