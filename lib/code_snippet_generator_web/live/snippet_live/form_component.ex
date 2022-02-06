defmodule CodeSnippetGeneratorWeb.SnippetLive.FormComponent do
  use CodeSnippetGeneratorWeb, :live_component

  alias CodeSnippetGenerator.Generator

  @impl true
  def update(%{snippet: snippet} = assigns, socket) do
    changeset = Generator.change_snippet(snippet)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"snippet" => snippet_params}, socket) do
    changeset =
      socket.assigns.snippet
      |> Generator.change_snippet(snippet_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"snippet" => snippet_params}, socket) do
    save_snippet(socket, socket.assigns.action, snippet_params)
  end

  defp save_snippet(socket, :edit, snippet_params) do
    case Generator.update_snippet(socket.assigns.snippet, snippet_params) do
      {:ok, _snippet} ->
        {:noreply,
         socket
         |> put_flash(:info, "Snippet updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_snippet(socket, :new, snippet_params) do
    case Generator.create_snippet(snippet_params) do
      {:ok, _snippet} ->
        {:noreply,
         socket
         |> put_flash(:info, "Snippet created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
