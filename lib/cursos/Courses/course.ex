defmodule Cursos.Courses.Course do
    use Ecto.Schema
    import Ecto.Changeset

    schema "course" do
        field :name, :string
        field :duration, :integer
        has_many :course_detail, Cursos.Courses.CourseDetail

        timestamps()
    end  
end