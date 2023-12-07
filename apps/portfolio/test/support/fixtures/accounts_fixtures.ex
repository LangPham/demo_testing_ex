defmodule Portfolio.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Portfolio.Accounts` context.
  """

  use Portfolio.DataCase

  @doc """
  Generate a unique user email.
  """
  def unique_user_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    param = params_for(:user)
    # dbg(param)
    {:ok, user} =
      attrs
      |> Enum.into(param)
      |> Portfolio.Accounts.create_user()

    user
  end
end
