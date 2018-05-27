defmodule Postmodern.Article do
  use Postmodern.Web, :model

  schema "articles" do
    field :title, :string
    field :body, :string
    field :published, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :published])
    |> validate_required([:title, :body, :published])
  end
end
