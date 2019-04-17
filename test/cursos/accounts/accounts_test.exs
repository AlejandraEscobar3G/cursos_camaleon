defmodule Cursos.AccountsTest do
  use Cursos.DataCase

  alias Cursos.Accounts
  alias Cursos.Accounts.User

  describe "create_user/1" do
    @valid_attrs %{
      name: "Administrador",
      username: "ADMIN"
    }
    @invalid_attrs %{}

    test "with valid data inserts user" do
      assert {:ok, %User{id: id} = user} = Accounts.create_user(@valid_attrs)
      assert user.name == "Administrador"
      assert user.username == "ADMIN"
      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "with invalid data does not insert user" do
      assert {:error, _changeset} = Accounts.create_user(@invalid_attrs)
      assert Accounts.list_users() == []
    end

    test "enforces unique usernames" do
      assert {:ok, %User{id: id}} = Accounts.create_user(@valid_attrs)
      assert {:error, changeset} = Accounts.create_user(@valid_attrs)

      assert %{username: ["Ya existe"]} =
        errors_on(changeset)

      assert [%User{id: ^id}] = Accounts.list_users()
    end

    test "does not accept long usernames" do
      attrs = Map.put(@valid_attrs, :username, String.duplicate("a", 30))
      {:error, changeset} = Accounts.create_user(attrs)

      assert %{username: ["Debe contener máximo 20 caracteres"]} =
        errors_on(changeset)
      assert Accounts.list_users() == []
    end

    test "La contraseña debe contener 8 caracteres" do
      attrs = put_in(@valid_attrs, [:user, :password_hash], "12345678")
      {:error, changeset} = Accounts.create_user(attrs)

      assert %{password: ["Debe contener 8 caracteres"]}
      errors_on(changeset)[:user]
      assert Accounts.list_users() == []
    end
  end
end