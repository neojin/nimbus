defmodule Nimbus.Router do
  use Nimbus.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Nimbus do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index
    resources "/simple-crud-ui", SimpleCrudUiController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Nimbus do
  #   pipe_through :api
  # end
end
