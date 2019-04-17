defmodule Cursos.Accounts.User do
    use Ecto.Schema
    import Ecto.Changeset
    
    schema "user" do
        field :name, :string
        field :username, :string
        field :password_hash, :string, null: false

        timestamps()
    end

    def changeset(user, attrs) do
        user
        |> cast(attrs, [:name, :username, :password_hash])
        |> validate_required([:name, :username, :password_hash])
        |> validate_length(:name, min: 1, max: 20)
        |> validate_length(:username, min: 5, max: 5)
        |> put_pass_hash()
    end

    defp put_pass_hash(changeset) do
        case changeset do
            %Ecto.Changeset{valid?: true, changes: %{password_hash: pass}} ->
                put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(pass))
            _ ->
                changeset
        end
    end
end