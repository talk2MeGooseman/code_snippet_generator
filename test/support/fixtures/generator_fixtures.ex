defmodule CodeSnippetGenerator.GeneratorFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CodeSnippetGenerator.Generator` context.
  """

  @doc """
  Generate a snippet.
  """
  def snippet_fixture(attrs \\ %{}) do
    {:ok, snippet} =
      attrs
      |> Enum.into(%{
        result: %{},
        status: "some status"
      })
      |> CodeSnippetGenerator.Generator.create_snippet()

    snippet
  end
end
