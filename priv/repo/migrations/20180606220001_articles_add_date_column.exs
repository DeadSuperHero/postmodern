defmodule Postmodern.Repo.Migrations.ArticlesAddDateColumn do
  use Ecto.Migration

  def change do
    alter table("articles") do
      add :date_published, :date
    end
  end
end
