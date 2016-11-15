defmodule SnackChat.UserControllerTest do
  use SnackChat.ConnCase

  alias SnackChat.User
  @valid_attrs %{username: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @valid_attrs
    assert json_response(conn, 200)["username"] == @valid_attrs[:username]
    assert Repo.get_by(User, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, user_path(conn, :create), user: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
    assert length(Repo.all(User)) == 0
  end

  test "updates and renders chosen resource when data is valid and authentication header is present", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = conn
    |> with_user(user)
    |> post(user_path(conn, :create), user: @valid_attrs)
    assert json_response(conn, 200)["username"] == @valid_attrs[:username]
    assert Repo.get(User, user.id).username == @valid_attrs[:username]
    assert length(Repo.all(User)) == 1
  end

  test "does not update chosen resource and renders errors when data is invalid and authentication header is present", %{conn: conn} do
    user = Repo.insert! %User{}
    conn = conn
    |> with_user(user)
    |> post(user_path(conn, :create), user: @invalid_attrs)
    assert json_response(conn, 422)["errors"] != %{}
    assert length(Repo.all(User)) == 1
  end
end
