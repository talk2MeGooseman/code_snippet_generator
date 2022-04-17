defmodule CodeSnippetGenerator.Generator.Snippet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "snippets" do
    field :result, :map
    field :language, :string
    field :status, StatusEnum, default: :not_started
    belongs_to :tweet, CodeSnippetGenerator.Twitter.Tweet

    timestamps()
  end

  @doc false
  def changeset(snippet, attrs) do
    snippet
    |> cast(attrs, [:status, :result, :tweet_id, :language])
    |> validate_required([:status, :tweet_id])
    |> unique_constraint([:tweet_id])
  end
end
