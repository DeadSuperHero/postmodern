defmodule PostmodernWeb.DashboardController do
  use PostmodernWeb, :controller

  alias Postmodern.Stream
  alias Postmodern.Stream.Dashboard
  alias Postmodern.Stories
  alias Postmodern.Stories.Article
  alias Postmodern.Auth
  alias Postmodern.Auth.User
  alias Postmodern.Auth.Guardian


  def index(conn, _params) do
    current_user = Guardian.Plug.current_resource(conn)
    articles = Stories.list_articles()
    render(conn, "index.html", articles: articles, current_user: current_user)
  end

  def show(conn, %{"id" => id}) do
    article = Stories.get_article!(id)
    articles = Stories.list_articles()
    render(conn, "_article.html", article: article)
  end

end
