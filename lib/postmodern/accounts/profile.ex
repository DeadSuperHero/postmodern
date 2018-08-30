defmodule Postmodern.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset


  schema "profiles" do
    field :avatar, :string
    field :description, :string
    field :display_name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:username, :display_name, :description, :avatar])
    |> validate_required([:username, :display_name, :description, :avatar])
  end
end
