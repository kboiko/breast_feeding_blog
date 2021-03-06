# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :breast_feeding_blog,
  ecto_repos: [BreastFeedingBlog.Repo]

# Configures the endpoint
config :breast_feeding_blog, BreastFeedingBlogWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "92dPuDwekmcua6XsMD2pSKTRQk4vmRHJQt12L0RIkD/0vVCN7o9yR4AP+Tu/Dy36",
  render_errors: [view: BreastFeedingBlogWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: BreastFeedingBlog.PubSub,
  live_view: [signing_salt: "ce+x0DuQ"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
