defmodule Portfolio.ContentsTest do
  use Portfolio.DataCase

  alias Portfolio.Contents

  describe "tags" do
    alias Portfolio.Contents.Tag

    import Portfolio.ContentsFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Contents.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Contents.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tag{} = tag} = Contents.create_tag(valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contents.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tag{} = tag} = Contents.update_tag(tag, update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Contents.update_tag(tag, @invalid_attrs)
      assert tag == Contents.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Contents.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Contents.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Contents.change_tag(tag)
    end
  end

  describe "projects" do
    alias Portfolio.Contents.Project

    import Portfolio.ContentsFixtures

    @invalid_attrs %{title: nil, body: nil, summary: nil, photo: nil, slug: nil}

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Contents.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Contents.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      valid_attrs = %{title: "some title", body: "some body", summary: "some summary", photo: "some photo", slug: "some slug"}

      assert {:ok, %Project{} = project} = Contents.create_project(valid_attrs)
      assert project.title == "some title"
      assert project.body == "some body"
      assert project.summary == "some summary"
      assert project.photo == "some photo"
      assert project.slug == "some slug"
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contents.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      update_attrs = %{title: "some updated title", body: "some updated body", summary: "some updated summary", photo: "some updated photo", slug: "some updated slug"}

      assert {:ok, %Project{} = project} = Contents.update_project(project, update_attrs)
      assert project.title == "some updated title"
      assert project.body == "some updated body"
      assert project.summary == "some updated summary"
      assert project.photo == "some updated photo"
      assert project.slug == "some updated slug"
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Contents.update_project(project, @invalid_attrs)
      assert project == Contents.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Contents.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Contents.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Contents.change_project(project)
    end
  end

  describe "project_tag" do
    alias Portfolio.Contents.ProjectTag

    import Portfolio.ContentsFixtures

    @invalid_attrs %{}

    test "list_project_tag/0 returns all project_tag" do
      project_tag = project_tag_fixture()
      assert Contents.list_project_tag() == [project_tag]
    end
  end
end
