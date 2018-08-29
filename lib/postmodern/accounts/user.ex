defmodule Postmodern.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Postmodern.Accounts.User
  alias Comeonin.Bcrypt
  @derive {Phoenix.Param, key: :username}

  defimpl Phoenix.Param, for: Postmodern.Accounts.User do
  def to_param(%{username: username}) do
    "#{(username)}"
  end
end

  schema "users" do
    field :username, :string
    field :display_name, :string
    field :email, :string
    field :encrypted_password, :string
    field :description, :string
    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :display_name, :encrypted_password, :email, :description])
    |> unique_constraint(:username)
    |> validate_required([:username, :encrypted_password])
    |> update_change(:encrypted_password, &Bcrypt.hashpwsalt/1)
  end
end
