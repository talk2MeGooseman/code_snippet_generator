defmodule CodeSnippetGeneratorWeb.SnippetLive.Show do
  use CodeSnippetGeneratorWeb, :surface_view
  alias Surface.Components.{LiveRedirect, LivePatch}
  alias CodeSnippetGeneratorWeb.Components.{Code, Tweet}

  alias CodeSnippetGenerator.{Generator, Repo}

  @impl true
  def render(assigns) do
    ~F"""
    <h1>Show Snippet</h1>

    <Tweet tweet={@snippet.tweet} />


    <Code code={@snippet.result} />

    <span><LivePatch label="Edit" to={Routes.snippet_show_path(@socket, :edit, @snippet)} /></span>
    <span><LiveRedirect label="Back" to={Routes.snippet_index_path(@socket, :index)} /></span>


    <script>
    window.addEventListener('load', function(event) {

    });
    </script>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    snippet = Generator.get_snippet!(id)
    snippet = Repo.preload(snippet, :tweet)

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:snippet, snippet)}
  end

  defp page_title(:show), do: "Show Snippet"
  defp page_title(:edit), do: "Edit Snippet"
end
