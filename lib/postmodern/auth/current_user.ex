defmodule Postmodern.CurrentUser do
  import Plug.Conn
  import Guardian.Plug

  def init(opts), do: opts

  def call(conn, _opts) do
    current_user = current_resource(conn)
    assign(conn, :current_user, current_user)
  end

  def logged_in?(conn) do
    Guardian.Plug.authenticated?(conn)
  end

end
