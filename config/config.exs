import Config

config :nostrum,
  # The token of your bot as a string
  token: System.get_env("BOT_TOKEN"),
  # The number of shards you want to run your bot under, or :auto.
  num_shards: :auto

config :nookinc,
  ecto_repos: [Nookinc.Repo]

config :nookinc, Nookinc.Repo,
  database: "nookinc",
  username: System.get_env("DB_USER"),
  password: System.get_env("DB_PASS"),
  hostname: System.get_env("DB_HOST"),
  port: System.get_env("DB_PORT")
