defmodule Postmodern.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :password_digest, :string
    field :username, :string

    timestamps()

    # Virtual Fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :password_confirmation])
    |> validate_required([:username, :email, :password_confirmation])
    |> hash_password
  end

  defp hash_password(changeset) do
    changeset
    |> put_change(:password_digest, "ABCDE")
  end

end
