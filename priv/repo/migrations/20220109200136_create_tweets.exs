defmodule CodeSnippetGenerator.Repo.Migrations.CreateTweets do
  use Ecto.Migration
  @disable_ddl_transaction true
  @disable_migration_lock true

  def change do
    StatusEnum.create_type

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

    create index("tweets", [:tweet_id], unique: true, concurrently: true)
  end
end
