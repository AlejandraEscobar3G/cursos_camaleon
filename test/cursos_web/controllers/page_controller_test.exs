defmodule CursosWeb.PageControllerTest do
  use CursosWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Rumbl out loud."
  end
end
