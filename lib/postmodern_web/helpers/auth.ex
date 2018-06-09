defmodule PostmodernWeb.Helpers.Auth do

  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !!Postmodern.Repo.get(Postmodern.Accounts.User, user_id)
  end

end
