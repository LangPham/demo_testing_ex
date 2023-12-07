defmodule PortfolioWeb.ProjectController do
  use PortfolioWeb, :controller

  alias Portfolio.Contents
  alias Portfolio.Contents.Project

  action_fallback PortfolioWeb.FallbackController

  def index(conn, _params) do
    projects = Contents.list_projects()
    render(conn, :index, projects: projects)
  end

  def create(conn, %{"project" => project_params}) do
    with {:ok, %Project{} = project} <- Contents.create_project(project_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/projects/#{project}")
      |> render(:show, project: project)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Contents.get_project!(id)
    render(conn, :show, project: project)
  end

  def show_slug(conn, %{"slug" => slug}) do
    project = Contents.get_project_slug!(slug)
    render(conn, :show_slug, project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Contents.get_project!(id)

    with {:ok, %Project{} = project} <- Contents.update_project(project, project_params) do
      render(conn, :show, project: project)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Contents.get_project!(id)

    with {:ok, %Project{}} <- Contents.delete_project(project) do
      send_resp(conn, :no_content, "")
    end
  end
end
