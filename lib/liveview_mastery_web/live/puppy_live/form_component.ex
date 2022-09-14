defmodule LiveviewMasteryWeb.PuppyLive.FormComponent do
  use LiveviewMasteryWeb, :live_component

  alias LiveviewMastery.Puppies

  @impl true
  def update(%{puppy: puppy} = assigns, socket) do
    changeset = Puppies.change_puppy(puppy)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"puppy" => puppy_params}, socket) do
    changeset =
      socket.assigns.puppy
      |> Puppies.change_puppy(puppy_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"puppy" => puppy_params}, socket) do
    save_puppy(socket, socket.assigns.action, puppy_params)
  end

  defp save_puppy(socket, :edit, puppy_params) do
    case Puppies.update_puppy(socket.assigns.puppy, puppy_params) do
      {:ok, _puppy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Puppy updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_puppy(socket, :new, puppy_params) do
    case Puppies.create_puppy(puppy_params) do
      {:ok, _puppy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Puppy created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
