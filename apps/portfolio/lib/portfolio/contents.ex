defmodule Portfolio.Contents do
  @moduledoc """
  The Contents context.
  """

  import Ecto.Query, warn: false
  alias Portfolio.Repo

  alias Portfolio.Contents.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    Repo.delete(tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{data: %Tag{}}

  """
  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end

  alias Portfolio.Contents.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Project
    |> Repo.all()
    |> Repo.preload(:tags)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id) do
    Repo.get!(Project, id)
    |> Repo.preload(:tags)
  end

  def get_project_slug!(slug) do
    Repo.get_by!(Project, slug: slug)
    |> Repo.preload(:tags)
  end

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{data: %Project{}}

  """
  def change_project(%Project{} = project, attrs \\ %{}) do
    Project.changeset(project, attrs)
  end

  alias Portfolio.Contents.ProjectTag

  @doc """
  Returns the list of project_tag.

  ## Examples

      iex> list_project_tag()
      [%ProjectTag{}, ...]

  """
  def list_project_tag do
    Repo.all(ProjectTag)
  end

  @doc """
  Gets a single project_tag.

  Raises `Ecto.NoResultsError` if the Project tag does not exist.

  ## Examples

      iex> get_project_tag!(123)
      %ProjectTag{}

      iex> get_project_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_tag!(id), do: Repo.get!(ProjectTag, id)

  @doc """
  Creates a project_tag.

  ## Examples

      iex> create_project_tag(%{field: value})
      {:ok, %ProjectTag{}}

      iex> create_project_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_tag(attrs \\ %{}) do
    %ProjectTag{}
    |> ProjectTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_tag.

  ## Examples

      iex> update_project_tag(project_tag, %{field: new_value})
      {:ok, %ProjectTag{}}

      iex> update_project_tag(project_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_tag(%ProjectTag{} = project_tag, attrs) do
    project_tag
    |> ProjectTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_tag.

  ## Examples

      iex> delete_project_tag(project_tag)
      {:ok, %ProjectTag{}}

      iex> delete_project_tag(project_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_tag(%ProjectTag{} = project_tag) do
    Repo.delete(project_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_tag changes.

  ## Examples

      iex> change_project_tag(project_tag)
      %Ecto.Changeset{data: %ProjectTag{}}

  """
  def change_project_tag(%ProjectTag{} = project_tag, attrs \\ %{}) do
    ProjectTag.changeset(project_tag, attrs)
  end
end
