defmodule CodeSnippetGenerator.Twitter.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :author, :string
    field :lang, :string
    field :media, {:array, :string}
    field :sent_on, :utc_datetime
    field :text, :string
    field :tweet_id, :string
    field :twitter_user_id, :string

    has_one :snippet, CodeSnippetGenerator.Generator.Snippet

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:twitter_user_id, :author, :sent_on, :tweet_id, :lang, :text, :media])
    |> validate_required([:twitter_user_id, :author, :tweet_id, :lang, :text, :media])
  end
end
