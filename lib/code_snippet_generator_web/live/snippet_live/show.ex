defmodule CodeSnippetGeneratorWeb.SnippetLive.Show do
  use CodeSnippetGeneratorWeb, :live_view

  alias CodeSnippetGenerator.{Generator, Repo}

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

  @spec display_code(any) :: binary
  def display_code(result) do
    get_in(result, ["analyzeResult", "readResults"])
    |> List.first()
    |> get_in(["lines"])
    |> format_lines()
  end

  def format_lines(lines) do
    left_most_x = left_most_x(lines) |> get_in(["boundingBox"]) |> List.first()
    pixels_per_character = pixels_per_character(List.first(lines))

    lines
    |> Enum.map(fn line ->
      spaces = line_with_padding(line, left_most_x, pixels_per_character)
      text = get_in(line, ["text"])

      IO.inspect(text)
      IO.puts("Line spaces: #{spaces} -> #{String.pad_leading(text, spaces)}")
      String.pad_leading(text, spaces)
    end)
    |> Enum.join("\n")
  end


  defp pixels_per_character(line) do
    [top_left_x, _, top_right_x | _] = get_in(line, ["boundingBox"])
    text_length = get_in(line, ["text"]) |> String.length()

    total_width = top_right_x - top_left_x
    ceil(total_width / text_length)
  end

  defp left_most_x(lines) do
    Enum.min_by(lines, fn line -> get_in(line, ["boundingBox"]) |> List.first() end)
  end

  defp line_with_padding(line, left_most_x, pixels_per_character) do
    [top_left_x | _] = get_in(line, ["boundingBox"])
    length = get_in(line, ["text"]) |> String.length()
    offset = top_left_x - left_most_x

    floor(offset / pixels_per_character) + length
  end

  defp page_title(:show), do: "Show Snippet"
  defp page_title(:edit), do: "Edit Snippet"
end
