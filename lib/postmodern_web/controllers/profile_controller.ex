defmodule PostmodernWeb.ProfileController do
  use PostmodernWeb, :controller

  alias Postmodern.Accounts
  alias Postmodern.Accounts.Profile

  def index(conn, _params) do
    profiles = Accounts.list_profiles()
    render(conn, "index.html", profiles: profiles)
  end

  def new(conn, _params) do
    changeset = Accounts.change_profile(%Profile{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"profile" => profile_params}) do
    case Accounts.create_profile(profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile created successfully.")
        |> redirect(to: profile_path(conn, :show, profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    profile = Accounts.get_profile!(id)
    render(conn, "show.html", profile: profile)
  end

  def edit(conn, %{"id" => id}) do
    profile = Accounts.get_profile!(id)
    changeset = Accounts.change_profile(profile)
    render(conn, "edit.html", profile: profile, changeset: changeset)
  end

  def update(conn, %{"id" => id, "profile" => profile_params}) do
    profile = Accounts.get_profile!(id)

    case Accounts.update_profile(profile, profile_params) do
      {:ok, profile} ->
        conn
        |> put_flash(:info, "Profile updated successfully.")
        |> redirect(to: profile_path(conn, :show, profile))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", profile: profile, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile = Accounts.get_profile!(id)
    {:ok, _profile} = Accounts.delete_profile(profile)

    conn
    |> put_flash(:info, "Profile deleted successfully.")
    |> redirect(to: profile_path(conn, :index))
  end
end
