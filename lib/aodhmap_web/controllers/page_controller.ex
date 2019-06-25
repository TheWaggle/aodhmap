defmodule AodhmapWeb.PageController do
  use AodhmapWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
