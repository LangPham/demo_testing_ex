defmodule Portfolio.Factory.ProjectFactory do
  alias Portfolio.Contents.Project

  defmacro __using__(__opts) do
    quote do
      def project_factory do
        title = Faker.Lorem.sentence()
        slug = Slug.slugify(title)
        %Project{
          title: title,
          summary: Faker.Lorem.paragraph(2),
          body: Faker.Lorem.paragraph(5),
          photo: Faker.Avatar.image_url(),
          slug: slug
        }
      end

      def project_with_tags_factory do
        title = Faker.Lorem.sentence()
        slug = Slug.slugify(title)
        count_tag = Enum.random(1..3)
        tags = build_list(count_tag, :tag)
        %Project{
          title: title,
          summary: Faker.Lorem.paragraph(2),
          body: Faker.Lorem.paragraph(5),
          photo: Faker.Avatar.image_url(),
          slug: slug,
          tags: tags
        }
      end
    end
  end
end
