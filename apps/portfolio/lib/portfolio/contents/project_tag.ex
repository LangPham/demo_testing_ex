defmodule Portfolio.Contents.ProjectTag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Portfolio.Contents.Project
  alias Portfolio.Contents.Tag

  @primary_key false
  schema "project_tag" do
    belongs_to(:project, Project, primary_key: true)
    belongs_to(:tag, Tag, primary_key: true, type: :string)
    timestamps()
  end

  @doc false
  def changeset(project_tag, attrs) do
    project_tag
    |> cast(attrs, [:project_id, :tag_id])
    |> validate_required([:project_id, :tag_id])
  end
end
