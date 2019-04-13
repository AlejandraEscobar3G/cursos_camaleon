defmodule Cursos.University.Career do
    use Ecto.Schema
    import Ecto.Changeset

    schema "career" do
        field :name, :string
        has_many :student_course_detail, Cursos.Courses.StudentCourseDetail

        timestamps()
    end  
end