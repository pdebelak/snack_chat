defmodule SnackChat.UserController do
  use SnackChat.Web, :controller

  alias SnackChat.User

  def create(conn, %{"user" => user_params}) do
    changeset = set_changeset(conn.assigns[:user], user_params)

    case Repo.insert_or_update(changeset) do
      {:ok, user} ->
        conn
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SnackChat.ChangesetView, "error.json", changeset: changeset)
    end
  end

  defp set_changeset(nil, user_params), do: User.changeset(%User{}, user_params)
  defp set_changeset(user, user_params), do: User.changeset(user, user_params)
end
