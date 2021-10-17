defmodule CodeSnippetGeneratorWeb.PageController do
  use CodeSnippetGeneratorWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
