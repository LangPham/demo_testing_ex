# ExUnit.start()

Faker.start()
Bureaucrat.start(
  writer: Bureaucrat.ApiBlueprintWriter,
  default_path: "docs/apib.apib",
  paths: [],
  titles: [],
  env_var: "DOC",
  json_library: Jason
)

ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])


Ecto.Adapters.SQL.Sandbox.mode(Portfolio.Repo, :manual)
