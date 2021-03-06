defmodule Nookinc.MixProject do
  use Mix.Project

  def project do
    [
      app: :nookinc,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Nookinc.Application, []}
    ]
  end

  defp deps do
    [
      {:nostrum, "~> 0.4.1"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
