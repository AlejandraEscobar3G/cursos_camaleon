defmodule Cursos.University.Profesor do
    use Ecto.Schema
    import Ecto.Changeset

    schema "profesor" do
        field :name, :string
        field :first_lastname, :string
        field :second_lastname, :string
        field :email, :string
        has_many :profesor, Cursos.Courses.CourseDetail

        timestamps()
    end
    
end