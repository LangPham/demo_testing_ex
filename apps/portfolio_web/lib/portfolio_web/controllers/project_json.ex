defmodule PortfolioWeb.ProjectJSON do
  alias Portfolio.Contents.Project

  @doc """
  Renders a list of projects.
  """
  def index(%{projects: projects}) do
    %{data: for(project <- projects, do: data(project))}
  end

  @doc """
  Renders a single project.
  """
  def show(%{project: project}) do
    %{data: data(project)}
  end

  def show_slug(%{project: project}) do
    data(project)
  end

  defp data(%Project{} = project) do
    %{
      id: project.id,
      title: project.title,
      summary: project.summary,
      body: project.body,
      photo: project.photo,
      slug: project.slug,
      tags: project.tags
    }
  end
end
