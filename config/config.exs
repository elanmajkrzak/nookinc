import Config

config :nostrum,
  token: "NjkwNDU0NjYxMzE2MjE0Nzg1.XnRq_A.dc-faQg1rq-unK7R7DlRWumdrw8",
  num_shards: :auto

config :nookinc,
  ecto_repos: [Nookinc.Repo]

config :nookinc, Nookinc.Repo,
  database: "nookinc",
  username: "postgres",
  password: "darksteel",
  hostname: "localhost",
  port: "5433"
