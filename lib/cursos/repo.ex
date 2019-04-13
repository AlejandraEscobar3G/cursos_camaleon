defmodule Cursos.Repo do
  use Ecto.Repo,
    otp_app: :cursos,
    adapter: Ecto.Adapters.Postgres
end
