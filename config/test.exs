import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :code_snippet_generator, CodeSnippetGenerator.Repo,
  username: "postgres",
  password: "postgres",
  database: "code_snippet_generator_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :code_snippet_generator, CodeSnippetGeneratorWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "N6yw/fWN1nwivDXZPw49aWOMBEGK/UnTgM88s7tfHLLFlu/dLObTFh/1N9/M2wO3",
  server: false

# In test we don't send emails.
config :code_snippet_generator, CodeSnippetGenerator.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

config :code_snippet_generator, azure_cognitive_client: Azure.MockCognitive

config :my_app, Oban, queues: false, plugins: false
