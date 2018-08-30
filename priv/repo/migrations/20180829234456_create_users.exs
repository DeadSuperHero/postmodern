defmodule Postmodern.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :display_name, :string
      add :username, :string
      add :email, :string
      add :password, :string

      timestamps()
    end

  end
end
