defmodule Postmodern.Repo.Migrations.ArticlesAddDescriptionColumn do
  use Ecto.Migration

  def change do
    alter table("articles") do
      add :description, :text
    end
  end
end
