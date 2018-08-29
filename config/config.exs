# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :postmodern,
  ecto_repos: [Postmodern.Repo]

# Configures the endpoint
config :postmodern, PostmodernWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fBt/IdA2AYHZ+7H464XYAtRqcy7KCCcoghvf+/4jznVCCzcycMHrywBRPvUrSQXG",
  render_errors: [view: PostmodernWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Postmodern.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Guaridan, which is used for auth
config :postmodern, Postmodern.Guardian,
       issuer: "Postmodern",
       secret_key: "uC1+kp5yCWK82YnFhRK3W6+KtQjc4JuYqWSGaSMBct4OVlAAM7/+9AGpsvT+hFVz"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
