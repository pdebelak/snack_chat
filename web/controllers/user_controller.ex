defmodule SnackChat.UserController do
  use SnackChat.Web, :controller

  alias SnackChat.User

  def create(conn, %{"user" => user_params}) do
    changeset = case conn.assigns[:user] do
      nil -> User.changeset(%User{}, user_params)
      user -> User.changeset(user, user_params)
    end

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
end
