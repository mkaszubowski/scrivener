use Mix.Config

config :scrivener, Scrivener.Repo,
  adapter: EctoOne.Adapters.Postgres,
  pool: EctoOne.Adapters.SQL.Sandbox,
  database: "scrivener_test",
  username: System.get_env("SCRIVENER_DB_USER") || System.get_env("USER")

config :logger, :console,
  level: :error
