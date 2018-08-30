defmodule PostmodernWeb.Router do
  use PostmodernWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Postmodern.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", PostmodernWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController
    get "/sign_up", UserController, :new
    get "/sign_in", SessionController, :index
    post "/sign_in", SessionController, :login
    post "/sign_out", SessionController, :logout
    resources "/articles", ArticleController
  end

  # Definitely logged in scope
  scope "/", PostmodernWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/secret", SessionController, :secret
  end

  # Other scopes may use custom stacks.
  # scope "/api", PostmodernWeb do
  #   pipe_through :api
  # end
end
