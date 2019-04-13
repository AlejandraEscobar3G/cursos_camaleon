defmodule Cursos.Repo.Migrations.CreateProfesor do
  use Ecto.Migration

  def change do
    create table(:profesor) do
      add :name, :string
      add :first_lastname, :string
      add :second_lastname, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:profesor, [:name])
  end
end
