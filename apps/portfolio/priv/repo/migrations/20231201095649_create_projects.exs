defmodule Portfolio.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :summary, :text
      add :body, :text
      add :photo, :string
      add :slug, :string

      timestamps()
    end
  end
end
