defmodule CursosWeb.WatchController do
  use CursosWeb, :controller

  alias Cursos.Multimedia

  def show(conn, %{"id" => id}) do
    video = Multimedia.get_video!(id)
    render(conn, "show.html", video: video)
  end
  
end