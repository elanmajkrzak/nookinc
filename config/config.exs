import Config

config :nostrum,
  token:  System.get_env("BOT_TOKEN") || "NjkwNDU0NjYxMzE2MjE0Nzg1.XnRq_A.dc-faQg1rq-unK7R7DlRWumdrw8",
  num_shards: :auto

config :nookinc,
  ecto_repos: [Nookinc.Repo]

config :nookinc, Nookinc.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  database: "3135d75b-421f-4cf2-85a4-55ceb4e1d00e"
  ssl: false,
  pool_size: 2 # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1) connections where n is the number of app replicas.
