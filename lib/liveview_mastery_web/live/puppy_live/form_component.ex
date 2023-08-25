defmodule LiveviewMasteryWeb.PuppyLive.FormComponent do
  use LiveviewMasteryWeb, :live_component

  alias LiveviewMastery.Puppies

  @impl true
  def update(%{puppy: puppy} = assigns, socket) do
    changeset = Puppies.change_puppy(puppy)
    
    socket 
    |> allow_upload(:photo, accept: ~w(.png .jpeg .jpg), max_entries: 1, auto_upload: true, external: &presign_entry/2)
    |> assign(assigns)
    |> assign(:changeset, changeset)}
    |> ok()
  end

  defp presign_entry(entry, %{assigns: %{uploads: uploads}} = socket) do
    s3_filepath = SimpleS3Upload.s3_filepath(entry)
    {:ok, fields} =
      SimpleS3Upload.sign_form_upload(
        key: s3_filepath,
        content_type: entry.client_type,
        max_file_size: uploads.photo.max_file_size,
        expires_in: :timer.hours(1)
      )
    meta =
      %{
        uploader: "S3",
        key: s3_filepath,
        url: "https://#{SimpleS3Upload.bucket()}.s3.amazonaws.com",
        fields: fields
      }

    {:ok, meta, socket}
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
    puppy_params = put_photo_urls(socket, puppy_params)
    save_puppy(socket, socket.assigns.action, puppy_params)
  end

  defp save_puppy(socket, :edit, puppy_params) do
    case Puppies.update_puppy(socket.assigns.puppy, puppy_params) do
      {:ok, _puppy} ->
        {:noreply,
         socket
         |> put_flash(:info, "Puppy updated successfully")
         |> push_navigate(to: socket.assigns.return_to)}

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
         |> push_navigate(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp put_photo_urls(socket, puppy) do
    {completed, []} = uploaded_entries(socket, :photo)
    urls =
      for entry <- completed do
        SimpleS3Upload.entry_url(entry)
      end

    %{puppy | "photo_url" => add_photo_url_to_params(List.first(urls), puppy["photo_url"])}
  end
end