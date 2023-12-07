defmodule Portfolio.Factory do
  use ExMachina.Ecto, repo: Portfolio.Repo
  use Portfolio.Factory.{UserFactory, ProjectFactory, TagFactory, ProjectTagFactory}
end
