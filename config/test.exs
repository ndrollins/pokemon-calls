import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :poke_call, PokeCall.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "poke_call_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :poke_call, PokeCallWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "+sI7obPl8FxhOTqQv/LWFUJPnlRDka2Y3vOhK8QLIlpvzBzk9nm1LT1GUE2G8FHi",
  server: false

# In test we don't send emails.
config :poke_call, PokeCall.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# config/test.exs
# Use mock adapter for all clients
config :tesla, adapter: Tesla.Mock
# or only for one
config :tesla, PokeCall, adapter: Tesla.Mock
