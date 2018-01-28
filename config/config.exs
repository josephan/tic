# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :tic,
  ecto_repos: [Tic.Repo]

# Configures the endpoint
config :tic, TicWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vtP1kh19xVrDiXFLHafgPmsysHAC6K0FUPk2Fdny8c5Rc73rdFl9BsXzcHT2W7Y5",
  render_errors: [view: TicWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tic.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
