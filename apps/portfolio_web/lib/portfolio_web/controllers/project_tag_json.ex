defmodule PortfolioWeb.ProjectTagJSON do
  alias Portfolio.Contents.ProjectTag

  @doc """
  Renders a list of project_tag.
  """
  def index(%{project_tag: project_tag}) do
    %{data: for(project_tag <- project_tag, do: data(project_tag))}
  end

  @doc """
  Renders a single project_tag.
  """
  def show(%{project_tag: project_tag}) do
    %{data: data(project_tag)}
  end

  defp data(%ProjectTag{} = _project_tag) do
    %{
    }
  end
end
