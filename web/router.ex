defmodule SnackChat.Router do
  use SnackChat.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
  end

  scope "/api", SnackChat do
    pipe_through :api

    resources "/users", UserController, only: [:create, :update]
    resources "/rooms", RoomController, only: [:index, :show, :create]
  end

  scope "/", SnackChat do
    pipe_through :browser

    get "/", PageController, :index
    get "/username", PageController, :index
    get "/chat/:room", PageController, :index
  end
end
