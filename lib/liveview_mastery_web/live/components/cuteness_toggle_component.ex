defmodule LiveviewMasteryWeb.CutenessToggleComponent do
  use Phoenix.Component

  def render(%{puppy: %{id: id, cuteness: cuteness}} = assigns) do
    ~H"""
    <span
      phx-click="toggle-cuteness"
      phx-value-id={id}
      id={"puppy-cuteness-toggle-#{id}"}
      class={"#{toggle_color(cuteness)} relative inline-block flex-shrink-0 h-5 w-9 border-2 border-transparent rounded-full cursor-pointer transition-colors ease-in-out duration-200 focus:outline-none focus:ring focus:ring-gray-200"}
      role="checkbox"
      tabindex="0"
    >
      <span
        aria-hidden="true"
        class={"#{toggle_position(cuteness)} inline-block h-4 w-4 rounded-full bg-white shadow transform transition ease-in-out duration-200"}
      >
      </span>
    </span>
    """
  end

  def toggle_color(true), do: "bg-green-500"
  def toggle_color(false), do: "bg-gray-200"

  def toggle_position(true), do: "translate-x-4"
  def toggle_position(false), do: "translate-x-0"
end
