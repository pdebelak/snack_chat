defmodule SnackChat.UserTest do
  use SnackChat.ModelCase

  alias SnackChat.User

  @valid_attrs %{username: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "token creates token for user" do
    user = %User{id: 1}
    assert User.token(user)
  end

  test "token can lookup user" do
    user = Repo.insert! %User{}
    token = User.token(user)
    assert user == User.from_token(token)
  end

  test "when token not found returns error" do
    assert :error = User.from_token("bad_token")
  end
end
