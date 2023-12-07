defmodule Portfolio.Factory.UserFactory do
  alias Portfolio.Accounts.User

  defmacro __using__(__opts) do
    quote do
      def user_factory do
        %User{
          name: Faker.Person.name(),
          email: Faker.Internet.email()
        }
      end
    end
  end
end
