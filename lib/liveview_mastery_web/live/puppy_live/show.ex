defmodule LiveviewMasteryWeb.PuppyLive.Show do
  use LiveviewMasteryWeb, :live_view

  alias LiveviewMastery.Puppies

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:puppy, Puppies.get_puppy!(id))}
  end

  defp page_title(:show), do: "Show Puppy"
  defp page_title(:edit), do: "Edit Puppy"
end
