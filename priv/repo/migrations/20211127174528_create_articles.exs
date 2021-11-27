defmodule BreastFeedingBlog.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :content, :text
      add :time, :utc_datetime
      add :id, :uuid

      timestamps()
    end

  end
end
