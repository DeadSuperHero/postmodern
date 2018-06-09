defmodule Postmodern.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Postmodern.Accounts.User
  alias Comeonin.Bcrypt

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :encrypted_password])
    |> unique_constraint(:username)
    |> validate_required([:username, :encrypted_password])
    |> update_change(:encrypted_password, &Bcrypt.hashpwsalt/1)
  end
end
