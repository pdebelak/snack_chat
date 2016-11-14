defmodule SnackChat.PageController do
  use SnackChat.Web, :controller

  require EEx
  EEx.function_from_file :def, :static_page, "priv/static/index.html"

  def index(conn, _params) do
    conn
    |> html(static_page)
  end
end
