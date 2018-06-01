defmodule Postmodern.Repo.Migrations.CreateArticles do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :title, :string
      add :body, :text
      add :published, :boolean, default: false, null: false

      timestamps()
    end

  end
end
