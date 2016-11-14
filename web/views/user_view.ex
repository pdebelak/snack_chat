defmodule SnackChat.UserView do
  use SnackChat.Web, :view
  alias SnackChat.User

  def render("show.json", %{user: user}) do
    render_one(user, SnackChat.UserView, "user.json")
  end

  def render("user.json", %{user: user}) do
    %{username: user.username, token: User.token(user)}
  end
end
