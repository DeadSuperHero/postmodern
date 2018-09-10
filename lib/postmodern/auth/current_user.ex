defmodule Postmodern.CurrentUser do
  import Plug.Conn
  import Guardian.Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    conn
     |> assign(:current_user, Guardian.Plug.current_resource(conn))
  end

  def logged_in?(conn) do
    Guardian.Plug.authenticated?(conn)
  end

end
