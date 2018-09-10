defmodule PostmodernWeb.UserController do
  use PostmodernWeb, :controller

  alias Postmodern.Auth
  alias Postmodern.Auth.User
  alias Postmodern.Stories
  alias Postmodern.Stories.Article

  def index(conn, _params) do
    articles = Stories.list_articles()
    users = Auth.list_users()
    render(conn, "index.html", users: users, articles: articles)
  end

  def new(conn, _params) do
    articles = Stories.list_articles()
    changeset = Auth.change_user(%User{})
    render(conn, "new.html", changeset: changeset, articles: articles)
  end

  def create(conn, %{"user" => user_params}) do
    case Auth.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    articles = Stories.list_articles()
    user = Auth.get_user!(id)
    render(conn, "show.html", user: user, articles: articles)
  end

  def edit(conn, %{"id" => id}) do
    articles = Stories.list_articles()
    user = Auth.get_user!(id)
    changeset = Auth.change_user(user)
    render(conn, "edit.html", user: user, changeset: changeset, articles: articles)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Auth.get_user!(id)

    case Auth.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    {:ok, _user} = Auth.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: user_path(conn, :index))
  end
end
