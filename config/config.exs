import Config

config :nostrum,
  # The token of your bot as a string
  token: System.get_env("BOT_TOKEN") || "NjgyNDMxMzk3NTI4NjAwNjM5.Xlnd5A.VZ5Lk4NtZYdvrEyx_yeqfnXP34w",
  # The number of shards you want to run your bot under, or :auto.
  num_shards: :auto

config :nookinc,
  ecto_repos: [Nookinc.Repo]

  config :nookinc, Nookinc.Repo,
    adapter: Ecto.Adapters.Postgres,
    url: System.get_env("DATABASE_URL") || "ecto://postgres:darksteel@localhost:5433/nookinc",
    ssl: false,
    pool_size: 2 # Free tier db only allows 4 connections. Rolling deploys need pool_size*(n+1) connections where n is the number of app replicas.
