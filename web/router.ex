defmodule SnackChat.Router do
  use SnackChat.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SnackChat do
    pipe_through :api
  end
end
