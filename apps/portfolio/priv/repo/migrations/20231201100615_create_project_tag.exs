defmodule Portfolio.Repo.Migrations.CreateProjectTag do
  use Ecto.Migration

  def change do
    create table(:project_tag, primary_key: false) do
      add :project_id, references(:projects, on_delete: :nothing), primary_key: true
      add :tag_id, references(:tags, type: :string, on_delete: :nothing), primary_key: true

      timestamps()
    end

    create index(:project_tag, [:project_id])
    create index(:project_tag, [:tag_id])
  end
end
