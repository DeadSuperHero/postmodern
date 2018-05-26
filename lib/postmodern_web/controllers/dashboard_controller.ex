defmodule PostmodernWeb.DashboardController do
  use PostmodernWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
