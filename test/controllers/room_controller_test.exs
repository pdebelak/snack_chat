defmodule SnackChat.RoomControllerTest do
  use SnackChat.ConnCase

  alias SnackChat.{Room, User}
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, room_path(conn, :index)
    assert json_response(conn, 200) == []
  end

  test "shows chosen resource", %{conn: conn} do
    user = Repo.insert! %User{}
    room = Repo.insert! %Room{}
    conn = conn
    |> with_user(user)
    |> get(room_path(conn, :show, room))
    assert json_response(conn, 200) == %{"name" => room.name, "users" => []}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      user = Repo.insert! %User{}
      conn
      |> with_user(user)
      |> get(room_path(conn, :show, -1))
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = conn
    |> with_user(user)
    |> post(room_path(conn, :create), room: @valid_attrs)
    assert json_response(conn, 200)["name"] == @valid_attrs[:name]
    assert Repo.get_by(Room, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = conn
    |> with_user(user)
    |> post(room_path(conn, :create), room: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "renders 401 on create if not logged in", %{conn: conn} do
    conn = post conn, room_path(conn, :create), room: @valid_attrs
    assert json_response(conn, 401)["errors"] == "Unauthorized"
  end

  test "renders resource when already exists", %{conn: conn} do
    room = Repo.insert! %Room{name: "room_name"}
    user = Repo.insert! %User{}
    conn = conn
    |> with_user(user)
    |> post(room_path(conn, :create), room: %{name: room.name})
    assert json_response(conn, 200)["name"] == room.name
    assert length(Repo.all(Room)) == 1
  end
end
