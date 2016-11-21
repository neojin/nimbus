# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :nimbus,
  ecto_repos: [Nimbus.Repo]

# Configures the endpoint
config :nimbus, Nimbus.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Vr3RgYt6VUd0xssvJpQ3/UpQdXNgOF4v0iTVZZX1oC01TTPCtgL7XqCzdpkwFhBh",
  render_errors: [view: Nimbus.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nimbus.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :nimbus, github_base_url: "https://github.com/neojin/nimbus/blob/master/"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
