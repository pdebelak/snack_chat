defmodule SnackChat.RoomController do
  use SnackChat.Web, :controller

  plug SnackChat.RequireUser when action in [:create, :show]

  alias SnackChat.Room

  def index(conn, _params) do
    rooms = Repo.all(Room)
    render(conn, "index.json", rooms: rooms)
  end

  def create(conn, %{"room" => room_params}) do
    enter_room(conn, room_params, Room.by_name(room_params["name"]))
  end

  defp enter_room(conn, room_params, nil) do
    changeset = Room.changeset(%Room{}, room_params)

    case Repo.insert(changeset) do
      {:ok, room} ->
        conn
        |> render("show.json", room: room)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(SnackChat.ChangesetView, "error.json", changeset: changeset)
    end
  end
  defp enter_room(conn, _params, room) do
    render conn, "show.json", room: room
  end

  def show(conn, %{"id" => id}) do
    room = Repo.get!(Room, id)
    render(conn, "show.json", room: room)
  end
end
