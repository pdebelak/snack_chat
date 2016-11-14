defmodule SnackChat.RoomTest do
  use SnackChat.ModelCase

  alias SnackChat.Room

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Room.changeset(%Room{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Room.changeset(%Room{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with duplicate name" do
    SnackChat.Repo.insert! %Room{name: "name"}
    changeset = Room.changeset(%Room{}, %{name: "name"})
    {:error, _changeset} = Repo.insert(changeset)
  end
end
