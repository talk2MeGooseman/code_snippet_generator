defmodule CodeSnippetGenerator.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CodeSnippetGenerator.Repo,
      # Start the Telemetry supervisor
      CodeSnippetGeneratorWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CodeSnippetGenerator.PubSub},
      # Start the Endpoint (http/https)
      CodeSnippetGeneratorWeb.Endpoint,
      # Start a worker by calling: CodeSnippetGenerator.Worker.start_link(arg)
      # {CodeSnippetGenerator.Worker, arg}
      {Oban, oban_config()}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CodeSnippetGenerator.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CodeSnippetGeneratorWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  # Conditionally disable queues or plugins here.
  defp oban_config do
    Application.fetch_env!(:code_snippet_generator, Oban)
  end
end
