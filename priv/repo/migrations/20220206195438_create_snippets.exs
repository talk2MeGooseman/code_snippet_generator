defmodule CodeSnippetGenerator.Repo.Migrations.CreateSnippets do
  use Ecto.Migration
  @disable_ddl_transaction true
  @disable_migration_lock true

  def change do
    create table(:snippets) do
      add :status, StatusEnum.type()
      add :result, :map
      add :tweet_id, references(:tweets, on_delete: :nothing)

      timestamps()
    end

    create index(:snippets, [:tweet_id], unique: true)
  end
end
