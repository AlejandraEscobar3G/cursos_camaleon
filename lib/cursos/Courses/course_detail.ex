defmodule Cursos.Courses.CourseDetail do
    use Ecto.Schema
    import Ecto.Changeset

    schema "course_detail" do
        field :init_date, :date
        field :end_date, :date
        field :modality, :integer
        belongs_to :profesor, Cursos.University.Profesor
        belongs_to :course, Cursos.Courses.Course
        has_many :student_course_detail, Cursos.Courses.StudentCourseDetail

    end
end