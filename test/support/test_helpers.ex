defmodule Cursos.TestHelpers do
  alias Cursos.{
    Accounts,
    Multimedia
  }

  def user_fixture(attrs \\ %{}) do
    username = "user#{System.unique_integer([:positive])}"

    {:ok, user} =
      attrs
      |> Enum.into(%{
        name: "Some User",
        username: username,
        password_hash: attrs[:password_hash] || "12345678"
      })
      |> Accounts.create_user()

    user
  end

  def video_fixture(%Accounts.User{} = user, attrs \\ %{}) do
    attrs = 
      Enum.into(attrs, %{
        title: "Thunder",
        url: "https://www.youtube.com/watch?v=fKopy74weus",
        description: "La escucho en este momento..."
      })
    {:ok, video} = Multimedia.create_video(user, attrs)

    video
  end
end