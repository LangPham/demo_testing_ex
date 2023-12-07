# NOTE

1. `mix phx.new portfolio --umbrella --adapter bandit --no-assets --no-dashboard --no-html --no-live --no-mailer`
2. `mix ecto.create`
3. Create page_controller
4. Create user `mix phx.gen.json Accounts User users name:string email:stirng:unique`
5. Test user
6. Add ex_machina, faker to portfolio
7. `mkdir ./apps/portfolio/test/support/factory`
8. Add user_factory.ex in dir factory
9. Add factory.ex
10. Import factory into data_case
11. Add Faker.start() in to test_helper.exs

12. `mix phx.gen.json Contents Tag tags name:string`
13. `mix phx.gen.json Contents Project projects title:string summary:string body:string photo:string slug:string`
14. `mix phx.gen.json Contents ProjectTag project_tag project_id:references:projects tag_id:references:tags`

15. Add project_factory.ex in dir factory
16. import Portfolio.Factory to conn_case
17. import Bureaucrat.Helpers to conn_case
18. DOC=1 mix test
19. aglio -i apib.apib -o api.html
20. `https://tfwdev.docs.apiary.io/`
