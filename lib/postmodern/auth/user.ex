defmodule Postmodern.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Bcrypt


  schema "users" do
    field :display_name, :string
    field :email, :string
    field :password, :string
    field :username, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:display_name, :username, :email, :password, :description])
    |> validate_required([:display_name, :username, :email, :password])
    |> put_pass_hash()
  end


  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
   %{password: password}} = changeset) do
     change(changeset, password: Bcrypt.hashpwsalt(password))
   end
   defp put_pass_hash(changeset), do: changeset
end
