defmodule SnackChat.Router do
  use SnackChat.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SnackChat do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/rooms", RoomController, except: [:new, :edit]
  end
end
