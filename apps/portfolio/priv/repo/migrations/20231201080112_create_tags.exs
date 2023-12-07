defmodule Portfolio.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :id, :string, primary_key: true
      add :name, :string
    end
  end
end
