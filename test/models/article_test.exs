defmodule Postmodern.ArticleTest do
  use Postmodern.ModelCase

  alias Postmodern.Article

  @valid_attrs %{body: "some body", published: true, title: "some title"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
