defmodule Portfolio.ContentsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Portfolio.Contents` context.
  """

use Portfolio.DataCase

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    param = params_for(:tag)
    {:ok, tag} =
      attrs
      |> Enum.into(param)
      |> Portfolio.Contents.create_tag()
    tag
  end

  @doc """
  Generate a project.
  """
  def project_fixture(attrs \\ %{}) do
    param = params_for(:project)

    {:ok, project} =
      attrs
      |> Enum.into(param)
      |> Portfolio.Contents.create_project()

    project
  end

  @doc """
  Generate a project_tag.
  """
  def project_tag_fixture(attrs \\ %{}) do
    param = params_with_assocs(:project_tag)
    {:ok, project_tag} =
      attrs
      |> Enum.into(param)
      |> Portfolio.Contents.create_project_tag()

    project_tag
  end
end
