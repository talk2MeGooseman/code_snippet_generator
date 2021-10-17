defmodule CodeSnippetGenerator.Repo do
  use Ecto.Repo,
    otp_app: :code_snippet_generator,
    adapter: Ecto.Adapters.Postgres
end
