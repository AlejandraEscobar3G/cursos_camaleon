defmodule Cursos.Repo.Migrations.CreateStudentCourseDetail do
  use Ecto.Migration

  def change do
    create table(:student_course_detail) do
      add :no_cta, :bigint
      add :student_name, :string
      add :first_lastname, :string
      add :second_lastname, :string
      add :email, :string
      add :photo, :boolean
      add :voluntary_payment, :boolean
      add :career_id, references(:career)
      add :course_detail_id, references(:course_detail)

      timestamps()
    end

    create index(:student_course_detail, [:no_cta, :student_name, :email, :course_detail_id])
  end
end
