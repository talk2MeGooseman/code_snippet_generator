defmodule CodeSnippetGenerator.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :twitter_user_id, :string
      add :author, :string
      add :sent_on, :utc_datetime
      add :tweet_id, :string
      add :lang, :string
      add :text, :string
      add :media, {:array, :string}

      timestamps()
    end
  end
end
