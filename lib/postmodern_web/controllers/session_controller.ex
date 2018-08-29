defmodule PostmodernWeb.SessionController do
  use PostmodernWeb, :controller
  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]
  alias Postmodern.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => auth_params}) do
    user = Accounts.get_by_username(auth_params["username"])
    case Comeonin.Bcrypt.check_pass(user, auth_params["password"])  do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Signed in successfully")
        |> redirect(to: article_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "There was a problem with your username/password")
        |> render("new.html")
    end
  end

  defp login(conn, user) do
    conn
    |> Guardian.Plug.sign_in(user)
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:current_user_id)
    |> put_flash(:info, "Signed out successfully")
    |> redirect(to: article_path(conn, :index))
  end
end
