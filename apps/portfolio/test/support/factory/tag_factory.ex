defmodule Portfolio.Factory.TagFactory do
  alias Portfolio.Contents.Tag

  defmacro __using__(__opts) do
    quote do
      def tag_factory do
        name = Faker.Food.ingredient()
        id = Slug.slugify(name)
        %Tag{
          id: id,
          name: name,
        }
      end
    end
  end
end
