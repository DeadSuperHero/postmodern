defmodule PostmodernWeb.PageController do
  use PostmodernWeb, :controller

  alias Postmodern.Auth
  alias Postmodern.Auth.User
  alias Postmodern.Auth.Guardian

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
