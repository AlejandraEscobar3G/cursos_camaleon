defmodule Cursos.Repo.Migrations.CreateCareer do
  use Ecto.Migration

  def change do
    create table(:career) do
      add :name, :string

      timestamps()
    end

    create unique_index(:career, [:name])
  end
end
