defmodule Cursos.Repo.Migrations.InsertaDatosChidos do
  use Ecto.Migration
  alias Cursos.Repo
  alias Cursos.Accounts.User

  def change do
    Repo.insert %User{name: "Juan", username: "JP"}
  end
end
