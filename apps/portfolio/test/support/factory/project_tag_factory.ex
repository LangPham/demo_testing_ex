defmodule Portfolio.Factory.ProjectTagFactory do
  alias Portfolio.Contents.ProjectTag

  defmacro __using__(__opts) do
    quote do
      def project_tag_factory do
        %ProjectTag{
          project: build(:project),
          tag: build(:tag),
        }
      end
    end
  end
end
