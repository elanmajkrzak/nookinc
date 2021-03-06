import Config

config :nostrum,
  # The token of your bot as a string
  token: System.get_env("BOT_TOKEN"),
  # The number of shards you want to run your bot under, or :auto.
  num_shards: :auto

config :nookinc,
  ecto_repos: [Nookinc.Repo]

config :nookinc, Nookinc.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  database: "3135d75b-421f-4cf2-85a4-55ceb4e1d00e"
  ssl: false,
  pool_size: 2 # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1) connections where n is the number of app replicas.
