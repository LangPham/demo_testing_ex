import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :portfolio, Portfolio.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  # database: "portfolio_test#{System.get_env("MIX_TEST_PARTITION")}",
  database: "portfolio_ex_test",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :portfolio_web, PortfolioWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "zhwT6hRObaVuUB1CT9tB9THUfmN/07exPTFPVvG03YgD+YFs/euuZefb4TY02IjW",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
