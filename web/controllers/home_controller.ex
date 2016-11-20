defmodule Nimbus.HomeController do
  use Nimbus.Web, :controller

  # NOTE : is there a better way to do this?
  plug Nimbus.GithubLink, [
    "web/controllers/home_controller.ex",
    "web/templates/home/index.html.eex",
    "web/views/home_view.ex"
  ]

  def index(conn, _params) do
    render conn, "index.html"
  end
end
