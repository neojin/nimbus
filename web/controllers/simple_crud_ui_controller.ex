defmodule Nimbus.SimpleCrudUiController do
  use Nimbus.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end