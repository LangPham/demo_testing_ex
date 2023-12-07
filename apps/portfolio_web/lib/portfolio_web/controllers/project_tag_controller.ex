defmodule PortfolioWeb.ProjectTagController do
  use PortfolioWeb, :controller

  alias Portfolio.Contents
  alias Portfolio.Contents.ProjectTag

  action_fallback PortfolioWeb.FallbackController

  def index(conn, _params) do
    project_tag = Contents.list_project_tag()
    render(conn, :index, project_tag: project_tag)
  end

  def create(conn, %{"project_tag" => project_tag_params}) do
    with {:ok, %ProjectTag{} = project_tag} <- Contents.create_project_tag(project_tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/project_tag/#{project_tag}")
      |> render(:show, project_tag: project_tag)
    end
  end

  def show(conn, %{"id" => id}) do
    project_tag = Contents.get_project_tag!(id)
    render(conn, :show, project_tag: project_tag)
  end

  def update(conn, %{"id" => id, "project_tag" => project_tag_params}) do
    project_tag = Contents.get_project_tag!(id)

    with {:ok, %ProjectTag{} = project_tag} <- Contents.update_project_tag(project_tag, project_tag_params) do
      render(conn, :show, project_tag: project_tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    project_tag = Contents.get_project_tag!(id)

    with {:ok, %ProjectTag{}} <- Contents.delete_project_tag(project_tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
