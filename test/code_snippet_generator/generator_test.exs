defmodule CodeSnippetGenerator.GeneratorTest do
  use CodeSnippetGenerator.DataCase

  alias CodeSnippetGenerator.Generator

  describe "snippets" do
    alias CodeSnippetGenerator.Generator.Snippet

    import CodeSnippetGenerator.GeneratorFixtures

    @invalid_attrs %{result: nil, status: nil}

    test "list_snippets/0 returns all snippets" do
      snippet = snippet_fixture()
      assert Generator.list_snippets() == [snippet]
    end

    test "get_snippet!/1 returns the snippet with given id" do
      snippet = snippet_fixture()
      assert Generator.get_snippet!(snippet.id) == snippet
    end

    test "create_snippet/1 with valid data creates a snippet" do
      valid_attrs = %{result: %{}, status: "some status"}

      assert {:ok, %Snippet{} = snippet} = Generator.create_snippet(valid_attrs)
      assert snippet.result == %{}
      assert snippet.status == "some status"
    end

    test "create_snippet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Generator.create_snippet(@invalid_attrs)
    end

    test "update_snippet/2 with valid data updates the snippet" do
      snippet = snippet_fixture()
      update_attrs = %{result: %{}, status: "some updated status"}

      assert {:ok, %Snippet{} = snippet} = Generator.update_snippet(snippet, update_attrs)
      assert snippet.result == %{}
      assert snippet.status == "some updated status"
    end

    test "update_snippet/2 with invalid data returns error changeset" do
      snippet = snippet_fixture()
      assert {:error, %Ecto.Changeset{}} = Generator.update_snippet(snippet, @invalid_attrs)
      assert snippet == Generator.get_snippet!(snippet.id)
    end

    test "delete_snippet/1 deletes the snippet" do
      snippet = snippet_fixture()
      assert {:ok, %Snippet{}} = Generator.delete_snippet(snippet)
      assert_raise Ecto.NoResultsError, fn -> Generator.get_snippet!(snippet.id) end
    end

    test "change_snippet/1 returns a snippet changeset" do
      snippet = snippet_fixture()
      assert %Ecto.Changeset{} = Generator.change_snippet(snippet)
    end
  end
end
