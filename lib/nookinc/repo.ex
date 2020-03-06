defmodule Nookinc.Repo do
  use Ecto.Repo,
    otp_app: :nookinc,
    adapter: Ecto.Adapters.Postgres
end
