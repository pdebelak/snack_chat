defmodule SnackChat.RoomView do
  use SnackChat.Web, :view

  def render("index.json", %{rooms: rooms}) do
    rooms
    |> Enum.map(fn {name, users} -> %{name: name, count: length(users)} end)
  end

  def render("show.json", %{room: room}) do
    %{name: room.name, users: []}
  end
end
