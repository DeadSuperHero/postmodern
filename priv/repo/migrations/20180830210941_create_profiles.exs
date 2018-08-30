defmodule Postmodern.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :username, :string
      add :display_name, :string
      add :description, :string
      add :avatar, :string

      timestamps()
    end

  end
end
