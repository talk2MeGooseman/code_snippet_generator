defmodule CodeSnippetGenerator.Generator.Snippet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "snippets" do
    field :result, :map
    field :status, StatusEnum, default: :not_started
    belongs_to :tweet, CodeSnippetGenerator.Twitter.Tweet

    timestamps()
  end

  @doc false
  def changeset(snippet, attrs) do
    snippet
    |> cast(attrs, [:status, :result, :tweet_id])
    |> validate_required([:status, :tweet_id])
  end
end
