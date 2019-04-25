defmodule CursosWeb.AnnotationView do
  use CursosWeb, :view

  def render("annotation.json", %{annotation: annotation}) do
    %{
      id: annotation.id,
      body: annotation.body,
      at: annotation.at,
      user: render_one(annotation.user, CursosWeb.UserView, "user.json")
    }
  end
end