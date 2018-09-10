defmodule PostmodernWeb.ArticleController do
  use PostmodernWeb, :controller

  alias Postmodern.Stories
  alias Postmodern.Stories.Article
  plug :assign_user


  def index(conn, _params) do
    articles = Stories.list_articles()
    render(conn, "index.html", articles: articles)
  end

  def new(conn, _params) do
    articles = Stories.list_articles()
    changeset = Stories.change_article(%Article{})
    render(conn, "new.html", changeset: changeset, articles: articles)
  end

  def create(conn, %{"article" => article_params}) do
    case Stories.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: article_path(conn, :show, article))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Stories.get_article!(id)
    articles = Stories.list_articles()
    render(conn, "show.html", article: article, articles: articles)
  end

  def edit(conn, %{"id" => id}) do
    article = Stories.get_article!(id)
    articles = Stories.list_articles()
    changeset = Stories.change_article(article)
    render(conn, "edit.html", article: article, articles: articles, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Stories.get_article!(id)
    articles = Stories.list_articles()

    case Stories.update_article(article, article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: article_path(conn, :show, article))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", article: article, changeset: changeset)
    end
  end

  defp assign_user(conn, _opts) do
    case conn.params do
      %{"user_id" => user_id} ->
        user = Repo.get(Postmodern.User, user_id)
        assign(conn, :user, user)
        _ ->
        conn
      end
  end

  def delete(conn, %{"id" => id}) do
    article = Stories.get_article!(id)
    {:ok, _article} = Stories.delete_article(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: article_path(conn, :index))
  end
end
