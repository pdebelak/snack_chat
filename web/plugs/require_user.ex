defmodule SnackChat.RequireUser do
  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    if conn.assigns[:user] do
      conn
    else
      conn
      |> Plug.Conn.put_resp_content_type("application/json")
      |> Plug.Conn.send_resp(401, "{\"errors\": \"Unauthorized\"}")
      |> Plug.Conn.halt()
    end
  end
end
