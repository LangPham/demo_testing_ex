defmodule Portfolio.Contents.Project do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias Portfolio.Contents.ProjectTag
  alias Portfolio.Repo
  alias Portfolio.Contents.Tag

  schema "projects" do
    field :title, :string
    field :body, :string
    field :summary, :string
    field :photo, :string
    field :slug, :string

    many_to_many :tags, Tag,
      join_through: ProjectTag,
      on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:title, :summary, :body, :photo, :slug])
    |> validate_required([:title, :summary, :body, :photo, :slug])
    |> put_assoc(:tags, parse_tags(attrs))
  end

  defp parse_tags(attrs) when attrs != %{} do
    tags = attrs["tags"]

    if not is_nil(tags) do
      String.split(tags, [","], trim: true)
      |> Enum.map(fn tag -> String.trim(tag) end)
      |> insert_and_get_all()
    else
      []
    end
  end

  defp parse_tags(_attrs), do: []

  defp insert_and_get_all([]) do
    []
  end

  defp insert_and_get_all(names) do
    maps =
      Enum.map(
        names,
        &%{
          name: &1,
          id: Slug.slugify(String.downcase(&1))
        }
      )

    Repo.insert_all(
      Tag,
      maps,
      on_conflict: :nothing
    )

    Repo.all(from t in Portfolio.Contents.Tag, where: t.name in ^names)
  end
end
