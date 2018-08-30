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
  secret_key_base: "5r6dq/lhFnnF8BklIIu7eERCmQNjvQNpAEoZ01lH4Nk1FtVn6jxWaQMa4KfJRZqh",
  render_errors: [view: PostmodernWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Postmodern.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Configures Guardian for Auth

config :postmodern, Postmodern.Auth.Guardian,
  issuer: "postmodern", #App Name
  secret_key: "B723l1dRIqLHe5qcHAAn8Ik1wgJVYlNNQXb9Ozx9XwbVvgXyzNQM7TPxhMkoqRlT"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
