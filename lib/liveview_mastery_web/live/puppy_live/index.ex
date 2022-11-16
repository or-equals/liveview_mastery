defmodule LiveviewMasteryWeb.PuppyLive.Index do
  use LiveviewMasteryWeb, :live_view

  alias LiveviewMastery.Puppies
  alias LiveviewMastery.Puppies.Puppy

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :puppies, list_puppies())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Puppy")
    |> assign(:puppy, Puppies.get_puppy!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Puppy")
    |> assign(:puppy, %Puppy{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Puppies")
    |> assign(:puppy, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    puppy = Puppies.get_puppy!(id)
    {:ok, _} = Puppies.delete_puppy(puppy)

    {:noreply, assign(socket, :puppies, list_puppies())}
  end

  defp list_puppies do
    Puppies.list_puppies()
  end
end
