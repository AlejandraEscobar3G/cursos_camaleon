defmodule Cursos.Accounts do
    @moduledoc """
    The Accounts context.
    """
    import Ecto.Query
    alias Cursos.Repo
    alias Cursos.Accounts.User

    def get_user(id) do
        Repo.get(User, id)
    end
    
    def get_user!(id) do
        Repo.get!(User, id)
    end
    
    def get_user_by(params) do
        Repo.get_by(User, params)
    end

    def list_users do
        Repo.all(User)
    end

    def change_user(%User{} = user) do
        User.changeset(user, %{})
    end

    def create_user(attrs \\ %{}) do
        %User{}
        |> User.changeset(attrs)
        |> Repo.insert()
    end

    def get_user_by_username(username) do
        from(u in User, where: u.username == ^username)
        |> Repo.one()
    end

    def authenticate_by_username_and_pass(username, password) do
        user = get_user_by_username(username)
        
        cond do
            user && Pbkdf2.verify_pass(password, user.password_hash) ->
                {:ok, user}
            user -> 
                {:error, :unauthorized}
            true ->
                Pbkdf2.no_user_verify()
                {:error, :not_found}
        end
    end

end