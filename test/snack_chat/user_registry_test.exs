defmodule SnackChat.UsersRegistryTest do
  use ExUnit.Case, async: true

  alias SnackChat.UsersRegistry

  setup do
    {:ok, registry} = UsersRegistry.start_link
    {:ok, registry: registry}
  end

  test "active_rooms defaults to empty", %{registry: registry} do
    assert UsersRegistry.active_rooms(registry) == %{}
  end

  test "can add a user", %{registry: registry} do
    user = %SnackChat.User{ id: 1 }
    room = %SnackChat.Room{ name: "room" }
    UsersRegistry.add_user(registry, user, room)
    assert UsersRegistry.active_rooms(registry) == %{ room.name => [user.id] }
  end

  test "adding a user that is already in the room doesn't re-add it", %{registry: registry} do
    user = %SnackChat.User{ id: 1 }
    room = %SnackChat.Room{ name: "room" }
    UsersRegistry.add_user(registry, user, room)
    UsersRegistry.add_user(registry, user, room)
    assert UsersRegistry.active_rooms(registry) == %{ room.name => [user.id] }
  end

  test "can list users in a room", %{registry: registry} do
    user = %SnackChat.User{ id: 1 }
    room = %SnackChat.Room{ name: "room" }
    UsersRegistry.add_user(registry, user, room)
    assert UsersRegistry.users_in_room(registry, room) == [user.id]
  end

  test "listing users in non-present room is empty list", %{registry: registry} do
    room = %SnackChat.Room{ name: "room" }
    assert UsersRegistry.users_in_room(registry, room) == []
  end

  test "can remove a user from a room", %{registry: registry} do
    user = %SnackChat.User{ id: 1 }
    room = %SnackChat.Room{ name: "room" }
    UsersRegistry.add_user(registry, user, room)
    UsersRegistry.remove_user(registry, user, room)
    assert UsersRegistry.users_in_room(registry, room) == []
  end

  test "empty room is not included in active_rooms", %{registry: registry} do
    user = %SnackChat.User{ id: 1 }
    room = %SnackChat.Room{ name: "room" }
    UsersRegistry.add_user(registry, user, room)
    UsersRegistry.remove_user(registry, user, room)
    assert UsersRegistry.active_rooms(registry) == %{}
  end
end
