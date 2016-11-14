defmodule SnackChat.UserView do
  use SnackChat.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, SnackChat.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, SnackChat.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username}
  end
end
