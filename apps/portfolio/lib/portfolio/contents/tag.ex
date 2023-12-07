defmodule Portfolio.Contents.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name]}
  @primary_key {:id, :string, []}
  schema "tags" do
    field :name, :string
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> put_slug_id()
  end

  defp put_slug_id(%Ecto.Changeset{valid?: true, changes: %{name: name}} = changeset) do
    case changeset.data.id do
      nil -> change(changeset, id: Slug.slugify(String.downcase(name)))
      _ -> changeset
    end
  end

  defp put_slug_id(changeset), do: changeset
end
