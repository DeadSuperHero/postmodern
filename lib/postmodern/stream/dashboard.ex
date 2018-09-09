defmodule Postmodern.Stream.Dashboard do
  use Ecto.Schema
  import Ecto.Changeset


  schema "dashboards" do

    timestamps()
  end

  @doc false
  def changeset(dashboard, attrs) do
    dashboard
    |> cast(attrs, [])
    |> validate_required([])
  end
end
