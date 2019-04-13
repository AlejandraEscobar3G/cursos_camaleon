defmodule Cursos.Repo.Migrations.AddPasswordHashToUser do
  use Ecto.Migration

  def change do
    alter table(:user) do
      add :password_hash, :string, null: false
    end
  end
end
