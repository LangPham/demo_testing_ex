defmodule PortfolioWeb.ProjectControllerTest do
  use PortfolioWeb.ConnCase

  import Portfolio.ContentsFixtures
  alias Portfolio.Contents.ProjectTag
  alias Portfolio.Repo
  alias Portfolio.Contents.Project

  @create_attrs %{
    title: "some title",
    body: "some body",
    summary: "some summary",
    photo: "some photo",
    slug: "some slug"
  }
  @update_attrs %{
    title: "some updated title",
    body: "some updated body",
    summary: "some updated summary",
    photo: "some updated photo",
    slug: "some updated slug",
    tags: "New, New tag"
  }
  @invalid_attrs %{title: nil, body: nil, summary: nil, photo: nil, slug: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all projects", %{conn: conn} do
      list_project_tag = insert_list(5, :project_tag)
      # tags = insert_list(5, :tag)
      # project_tag
      conn =
        get(conn, ~p"/api/projects")
        |> doc(description: "List all project", operation_id: "list_project")

      res = json_response(conn, 200)["data"]
      assert length(res) == 5
    end
  end

  describe "get project with slug" do
    setup do
      %{project: project} = insert(:project_tag)
      [project: project]
    end

    test "renders project when data is valid", %{
      conn: conn,
      project: %Project{slug: slug} = project
    } do
      conn = get(conn, ~p"/api/projects/slug/#{slug}")
      |> doc(description: "Get project by slug", operation_id: "get_project_by_slug")
      res = json_response(conn, 200)

      assert project.id == res["id"]
      assert project.slug == res["slug"]
    end

    test "renders errors when data is invalid", %{conn: conn, project: project} do
      conn =
        put(conn, ~p"/api/projects/#{project}", project: @invalid_attrs)
        |> doc(description: "Update project fail", operation_id: "update_project_fail")

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "create project" do
    test "renders project when data is valid", %{conn: conn} do
      create_attrs = %{
        title: "some title",
        body: "some body",
        summary: "some summary",
        photo: "some photo",
        slug: "some slug",
        tags: "Backend, Frontend"
      }

      conn =
        post(conn, ~p"/api/projects", project: create_attrs)
        |> doc(description: "Create project", operation_id: "create_project")

      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/projects/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some body",
               "photo" => "some photo",
               "slug" => "some slug",
               "summary" => "some summary",
               "title" => "some title"
             } = json_response(conn, 200)["data"]

      # res = json_response(conn, 200)["data"]
      # dbg(res)

      create_attrs = %{
        title: "some title 2",
        body: "some body 2",
        summary: "some summary 2",
        photo: "some photo 2",
        slug: "some slug 2",
        tags: "Backend, Elixir"
      }

      conn = post(conn, ~p"/api/projects", project: create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/projects/#{id}")

      assert %{
               "id" => ^id,
               "body" => "some body 2",
               "photo" => "some photo 2",
               "slug" => "some slug 2",
               "summary" => "some summary 2",
               "title" => "some title 2"
             } = json_response(conn, 200)["data"]

      # dbg(res)
      conn = get(conn, ~p"/api/tags")
      res = json_response(conn, 200)["data"]
      assert length(res) == 3
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, ~p"/api/projects", project: @invalid_attrs)
        |> doc(description: "Create project fail", operation_id: "create_project_fail")

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update project" do
    # setup [:create_project]
    setup do
      %{project: project} = insert(:project_tag)
      [project: project]
    end

    test "renders project when data is valid", %{conn: conn, project: %Project{id: id} = project} do
      conn =
        put(conn, ~p"/api/projects/#{project}", project: @update_attrs)
        |> doc(description: "Update project", operation_id: "update_project")

      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/projects/#{id}")
      res = json_response(conn, 200)["data"]

      assert %{
               "id" => ^id,
               "body" => "some updated body",
               "photo" => "some updated photo",
               "slug" => "some updated slug",
               "summary" => "some updated summary",
               "title" => "some updated title"
             } = res

      project_tag =
        ProjectTag
        |> Repo.all()

      assert length(project_tag) == 2
    end

    test "renders errors when data is invalid", %{conn: conn, project: project} do
      conn =
        put(conn, ~p"/api/projects/#{project}", project: @invalid_attrs)
        |> doc(description: "Update project fail", operation_id: "update_project_fail")

      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete project" do
    setup [:create_project]

    test "deletes chosen project", %{conn: conn, project: project} do
      conn = delete(conn, ~p"/api/projects/#{project}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/projects/#{project}")
      end
    end
  end

  defp create_project(_) do
    project = project_fixture()
    %{project: project}
  end
end
