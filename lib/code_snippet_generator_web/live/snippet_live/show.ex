defmodule CodeSnippetGeneratorWeb.SnippetLive.Show do
  use CodeSnippetGeneratorWeb, :live_view

  alias CodeSnippetGenerator.Generator

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:snippet, Generator.get_snippet!(id))}
  end

  @spec display_code(any) :: binary
  def display_code(result) do
    get_in(result, ["analyzeResult", "readResults"])
    |> List.first()
    |> get_in(["lines"])
    |> Enum.map(fn line -> get_in(line, ["text"]) end)
    |> Enum.join("\n")
  end

  defp page_title(:show), do: "Show Snippet"
  defp page_title(:edit), do: "Edit Snippet"
end
