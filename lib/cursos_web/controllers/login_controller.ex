defmodule CursosWeb.LoginController do
    use CursosWeb, :controller

    def new(conn, _params) do
        render(conn, "new.html")
    end

    def create(conn, %{"loggin" => %{"password_hash" => password, "username" => username}}) do
        case CursosWeb.Auth.login_by_username_and_pass(conn, username, password) do
            {:ok, conn} ->
                conn
                |> put_flash(:info, "Bienvenido")
                |> redirect(to: Routes.page_path(conn, :index))
            {:error,  _reason, conn} ->
                conn
                |> put_flash(:error, "Invalid email/password combination")
                |> render("new.html")
        end
    end

    def delete(conn, _) do
        conn
        |> CursosWeb.Auth.logout()
        |> redirect(to: Routes.page_path(conn, :index))
    end
end