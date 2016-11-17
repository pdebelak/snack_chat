defmodule SnackChat.RoomChannel do
  use SnackChat.Web, :channel
  alias SnackChat.{Room, UsersRegistry}

  def join("room:" <> room_name, %{"token" => token}, socket) do
    join_room(Room.by_name(room_name), token, socket)
  end

  defp join_room(nil, _, _), do: {:error, %{reason: "Not found"}}
  defp join_room(room, token, socket) do
    case User.from_token(token) do
      nil -> {:error, %{reason: "Not authorized"}}
      user ->
        UsersRegistry.add_user(user, room)
        {:ok, socket}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
