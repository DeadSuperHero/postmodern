defmodule Postmodern.Repo.Migrations.CreateDashboards do
  use Ecto.Migration

  def change do
    create table(:dashboards) do

      timestamps()
    end

  end
end
