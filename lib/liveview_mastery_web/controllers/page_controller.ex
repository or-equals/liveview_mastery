defmodule LiveviewMasteryWeb.PageController do
  use LiveviewMasteryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
