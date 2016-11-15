defmodule SnackChat.LoadUser do
  def init(opts) do
    opts
  end

  def call(conn, _opts) do
    token = conn.req_headers
    |> Enum.find(fn {header, _value} -> header == "authentication" end)
    |> extract_token()
    IO.puts(token)
    conn
    |> Plug.Conn.assign(:user, SnackChat.User.from_token(token))
  end

  defp extract_token({"authentication", token}) do
    String.replace_prefix(token, "Bearer ", "")
  end
  defp extract_token(_), do: nil
end
