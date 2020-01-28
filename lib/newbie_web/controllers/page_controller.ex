defmodule NewbieWeb.PageController do
  use NewbieWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
