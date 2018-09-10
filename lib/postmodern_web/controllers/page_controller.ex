defmodule PostmodernWeb.PageController do
  use PostmodernWeb, :controller

  alias Postmodern.Auth
  alias Postmodern.Auth.User
  alias Postmodern.Auth.Guardian
  alias Postmodern.Stories
  alias Postmodern.Stories.Article

  def index(conn, _params) do
    articles = Stories.list_articles()
    render(conn, "index.html", articles: articles)
  end
end
