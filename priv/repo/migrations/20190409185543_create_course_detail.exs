defmodule Cursos.Repo.Migrations.CreateCourseDetail do
  use Ecto.Migration

  def change do
    create table(:course_detail) do
      add :init_date, :date
      add :end_date, :date
      add :modality, :integer
      add :profesor_id, references(:profesor)
      add :course_id, references(:course)
    end

    create index(:course_detail, [:init_date, :end_date])
  end
end
