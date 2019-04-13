defmodule Cursos.Courses.StudentCourseDetail do
    use Ecto.Schema
    import Ecto.Changeset

    schema "student_course_detail" do
        field :no_cta, :integer
        field :student_name, :string
        field :first_lastname, :string
        field :second_lastname, :string
        field :email, :string
        field :photo, :boolean
        field :voluntary_payment, :boolean
        belongs_to :career, Cursos.University.Career
        belongs_to :course_detail, Cursos.Courses.CourseDetail

        timestamps()
    end
end