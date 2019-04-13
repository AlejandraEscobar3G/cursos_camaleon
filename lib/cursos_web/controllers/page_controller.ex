defmodule CursosWeb.PageController do
  use CursosWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
