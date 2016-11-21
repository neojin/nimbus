defmodule Nimbus.SimpleRestfulUiController do
  use Nimbus.Web, :controller

  # NOTE : is there a better way to do this?
  plug Nimbus.GithubLink, [
    "web/controllers/simple_resftul_ui_controller.ex",
    "web/templates/simple_restful_ui/index.html.eex",
    "web/views/simple_restful_ui_view.ex"
  ]

  def index(conn, _params) do
    render conn, "index.html"
  end
end
