defmodule CursosWeb.UserController do
    use CursosWeb, :controller

    alias Cursos.Accounts

    plug :authenticate when action in [:index, :show]
    
    def index(conn, __params) do
        users = Accounts.list_users()
        render(conn, "index.html", users: users)
    end

    def show(conn, %{"id" => id}) do
        user = Accounts.get_user(id)
        render(conn, "show.html", user: user)
    end

    def new(conn, __params) do
        changeset = Accounts.change_user(%Accounts.User{})
        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"user" => user_params}) do
        case Accounts.create_user(user_params) do
            {:ok, user} ->
                conn
                |> login(user)
                |> put_flash(:info, "#{user.name} creado")
                |> redirect(to: Routes.user_path(conn, :index))
            {:error, %Ecto.Changeset{} = changeset} ->
                render(conn, "new.html", changeset: changeset)
        end
    end

    def login(conn, user) do
        conn
        |> CursosWeb.Auth.login(user)
    end

    defp authenticate(conn, _opts) do
        if conn.assigns.current_user do
            conn
        else
            conn
            |> put_flash(:error, "Debes iniciar sesión para poder acceder")
            |> redirect(to: Routes.page_path(conn, :index))
            |> halt()
        end
    end
end