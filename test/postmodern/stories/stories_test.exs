defmodule Postmodern.StoriesTest do
  use Postmodern.DataCase

  alias Postmodern.Stories

  describe "articles" do
    alias Postmodern.Stories.Article

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def article_fixture(attrs \\ %{}) do
      {:ok, article} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stories.create_article()

      article
    end

    test "list_articles/0 returns all articles" do
      article = article_fixture()
      assert Stories.list_articles() == [article]
    end

    test "get_article!/1 returns the article with given id" do
      article = article_fixture()
      assert Stories.get_article!(article.id) == article
    end

    test "create_article/1 with valid data creates a article" do
      assert {:ok, %Article{} = article} = Stories.create_article(@valid_attrs)
      assert article.body == "some body"
      assert article.title == "some title"
    end

    test "create_article/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_article(@invalid_attrs)
    end

    test "update_article/2 with valid data updates the article" do
      article = article_fixture()
      assert {:ok, article} = Stories.update_article(article, @update_attrs)
      assert %Article{} = article
      assert article.body == "some updated body"
      assert article.title == "some updated title"
    end

    test "update_article/2 with invalid data returns error changeset" do
      article = article_fixture()
      assert {:error, %Ecto.Changeset{}} = Stories.update_article(article, @invalid_attrs)
      assert article == Stories.get_article!(article.id)
    end

    test "delete_article/1 deletes the article" do
      article = article_fixture()
      assert {:ok, %Article{}} = Stories.delete_article(article)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_article!(article.id) end
    end

    test "change_article/1 returns a article changeset" do
      article = article_fixture()
      assert %Ecto.Changeset{} = Stories.change_article(article)
    end
  end
end
