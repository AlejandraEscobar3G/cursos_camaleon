defmodule Cursos.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:course) do
      add :name, :string
      add :duration, :integer

      timestamps()
    end

    create unique_index(:course, [:name])
  end
end
