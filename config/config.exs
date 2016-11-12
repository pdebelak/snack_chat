# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :snack_chat,
  ecto_repos: [SnackChat.Repo]

# Configures the endpoint
config :snack_chat, SnackChat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SGk5I/5IISGiZ4Bor+5Jrysd6spjKSSNnSlsMVK7tgu2D/d+SdGjo+mNxvjxKoKt",
  render_errors: [view: SnackChat.ErrorView, accepts: ~w(json)],
  pubsub: [name: SnackChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
