defmodule OscarWeb.AuthController do
  use OscarWeb, :controller

  alias Oscar.Accounts.User
  alias Oscar.Repo

  plug(Ueberauth)

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      name: get_user_name(auth.info),
      token: auth.credentials.token,
      email: auth.info.email,
      provider: Atom.to_string(auth.provider)
    }

    changeset = User.changeset(%User{}, user_params)
    singin(conn, changeset)
  end

  defp singin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        # |> put_flash(:info, "Welcome " <> user.email)
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.nominee_controller_path(conn, :nominees))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error to Login")
        |> redirect(to: Routes.login_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end

  def get_user_name(auth_info) do
    if auth_info.first_name !== nil and auth_info.first_name !== nil do
      auth_info.first_name <> auth_info.last_name
    else
      auth_info.email
    end
  end

  def logout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.login_path(conn, :index))
  end
end
