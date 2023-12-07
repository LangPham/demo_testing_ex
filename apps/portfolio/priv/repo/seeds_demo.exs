import Portfolio.Factory
alias Portfolio.Repo
alias Portfolio.Accounts.User
alias Portfolio.Contents.Project

{:ok, _} = Application.ensure_all_started(:ex_machina)
Faker.start()

# Insert user
if Repo.aggregate(User, :count, :id) == 0 do
  Repo.insert!(%User{name: "LangPham", email: "phamxuanlang@gmail.com"})
end

# Insert project
if Repo.aggregate(Project, :count, :id) == 0 do
  insert_list(10, :project_with_tags)
end
