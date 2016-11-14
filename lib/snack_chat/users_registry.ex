defmodule SnackChat.UsersRegistry do
  use GenServer

  alias SnackChat.{User, Room}

  def active_rooms, do: active_rooms(__MODULE__)
  def active_rooms(registry) do
    GenServer.call(registry, {:active_rooms})
    |> Enum.reject(fn {_room, users} -> Enum.empty?(users) end)
    |> Enum.into(%{})
  end

  def add_user(user, room), do: add_user(__MODULE__, user, room)
  def add_user(registry, user, room) do
    GenServer.call registry, {:add_user, user, room}
  end

  def users_in_room(room), do: users_in_room(__MODULE__, room)
  def users_in_room(registry, %Room{name: name}) do
    active_rooms(registry)
    |> Map.get(name, [])
  end

  def remove_user(user, room), do: remove_user(__MODULE__, user, room)
  def remove_user(registry, user, room) do
    GenServer.call registry, {:remove_user, user, room}
  end

  # GenServer callbacks

  def start_link, do: GenServer.start_link(__MODULE__, :ok)
  def start_link(registry) do
    GenServer.start_link(__MODULE__, :ok, name: registry)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:active_rooms}, _from, rooms) do
    {:reply, rooms, rooms}
  end

  def handle_call({:add_user, %User{id: id}, %Room{name: name}}, _from, rooms) do
    user_list = Map.get(rooms, name, [])
    {:reply, :ok, Map.put(rooms, name, Enum.uniq([id | user_list]))}
  end

  def handle_call({:remove_user, %User{id: id}, %Room{name: name}}, _from, rooms) do
    user_list = Map.get(rooms, name, [])
    {:reply, :ok, Map.put(rooms, name, Enum.reject(user_list, fn(user_id) -> user_id == id end))}
  end
end
