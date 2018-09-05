defmodule PostmodernWeb.LayoutView do
  use PostmodernWeb, :view
  alias Postmodern.ArticleView

  def current_user(conn) do
    Plug.Conn.get_session(conn, :current_user)
  end

end
