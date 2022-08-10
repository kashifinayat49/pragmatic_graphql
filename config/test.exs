import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :getaways, Getaways.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "getaways_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :getaways, GetawaysWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "Eh9Da1YchTjSmvGlI/GXySq6xlrtY7onh+6X7D+rh1fB2a2ti1O3K0w+fYloUie7",
  server: false

# In test we don't send emails.
config :getaways, Getaways.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
