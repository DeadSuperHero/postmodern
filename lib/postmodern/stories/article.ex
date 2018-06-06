defmodule Postmodern.Stories.Article do
  use Ecto.Schema
  import Ecto.Changeset


  schema "articles" do
    field :body, :string
    field :published, :boolean, default: false
    field :title, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body, :description, :published])
    |> validate_required([:title, :body, :description, :published])
  end
end
