defmodule PostmodernWeb.Router do
  use PostmodernWeb, :router
  use Plug.ErrorHandler
  use Sentry.Plug

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

  scope "/", PostmodernWeb do
    pipe_through :browser # Use the default browser stack
    get "/dashboard", DashboardController, :index
    get "/first_time", FirstTimeController, :index
    get "/", PageController, :index
    resources "/articles", ArticleController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PostmodernWeb do
  #   pipe_through :api
  # end
end
