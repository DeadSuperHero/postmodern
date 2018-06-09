defmodule Postmodern.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

  schema "users" do
    field :username, :string
    field :email, :string
    field :encrypted_password, :string

    timestamps()

    # Virtual Fields
    field :password_confirmation, :string, virtual: true
  end

  @required_fields ~w(username email encrypted_password password_confirmation)
  @optional_fields ~w()

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> hash_password
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :encrypted_password, :password_confirmation])
    |> unique_constraint(:username)
    |> validate_required([:username, :email, :password_confirmation])
    |> hash_password
  end

    defp hash_password(changeset) do
      if encrypted_password = get_change(changeset, :encrypted_password) do
      changeset
      |> put_change(:encrypted_password, hashpwsalt(encrypted_password))
    else
      changeset
    end
  end
end
