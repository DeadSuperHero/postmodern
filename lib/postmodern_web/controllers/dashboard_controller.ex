defmodule PostmodernWeb.DashboardController do
  use PostmodernWeb, :controller

  alias Postmodern.Stream
  alias Postmodern.Stream.Dashboard
  alias Postmodern.Stories
  alias Postmodern.Stories.Article


  def index(conn, _params) do
    articles = Stories.list_articles()
    render(conn, "index.html", articles: articles)
  end

  def show(conn, %{"id" => id}) do
    article = Stories.get_article!(id)
    articles = Stories.list_articles()
    render(conn, "_article.html", article: article)
  end

end
