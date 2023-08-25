defmodule LiveviewMasteryWeb.UploadComponent do
  use LiveviewMasteryWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <%= hidden_input @form, :photo_url %>
      <%= error_tag @form, :photo_url %>
      <div class="col-span-4 sm:col-span-2" phx-drop-target={@uploads.photo.ref}>
        <div class="mt-2 border-2 border-gray-300 border-dashed rounded-md px-6 pt-5 pb-6 flex justify-center">
          <div class="space-y-1 text-center">
            <svg class="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
              <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
            </svg>
            <div class="flex text-sm text-gray-600 ml-20">
              <.live_file_input upload={@uploads.photo} />
            </div>
            <p class="text-xs text-gray-500">
              PNG or JPG
            </p>
          </div>
        </div>
      </div>

      <div class="col-span-4 sm:col-span-2">
        <%= for {_ref, msg} <- @uploads.photo.errors do %>
          <div class="rounded-md bg-red-50 p-4">
            <div class="flex">
              <div class="flex-shrink-0">
                <!-- Heroicon name: x-circle -->
                  <svg class="h-5 w-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                  </svg>
                </div>
                <div class="ml-3">
                  <h3 class="text-sm font-medium text-red-800">
                    <%= Phoenix.Naming.humanize(msg) %>
                  </h3>
                </div>
              </div>
            </div>
          <% end %>

          <%= for entry <- @uploads.photo.entries do %>
            <.live_img_preview entry={entry} width="75" />

            <div class="py-5">
              <div class="flex items-center">
                <div class="w-0 flex-1">
                  <dd class="flex items-baseline">
                    <div class="ml-2 flex items-baseline text-sm font-semibold text-green-600">
                      <svg class="self-center flex-shrink-0 h-5 w-5 text-green-500" fill="currentColor" viewBox="0 0 20 20" aria-hidden="true">
                        <path fill-rule="evenodd" d="M5.293 9.707a1 1 0 010-1.414l4-4a1 1 0 011.414 0l4 4a1 1 0 01-1.414 1.414L11 7.414V15a1 1 0 11-2 0V7.414L6.707 9.707a1 1 0 01-1.414 0z" clip-rule="evenodd" />
                      </svg>
                      <%= entry.progress %>%
                    </div>
                  </dd>
                 </div>
               </div>
            </div>
          <% end %>
        </div>
      </div>
   """
  end


end
