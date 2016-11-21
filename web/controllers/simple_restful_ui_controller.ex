defmodule Nimbus.SimpleRestfulUiController do
  use Nimbus.Web, :controller
  alias Nimbus.Company

  # NOTE : is there a better way to do this?
  plug Nimbus.GithubLink, [
    "web/controllers/simple_resftul_ui_controller.ex",
    "web/templates/simple_restful_ui/index.html.eex",
    "web/views/simple_restful_ui_view.ex",
    "web/models/company.ex",
    "priv/repo/migrations/20161121041307_create_companies.exs",
    "priv/repo/seeds.exs"
  ]

  def index(conn, _params) do
    query = from c in Company, order_by: c.name
    render conn, "index.html", companies: Repo.all(query)
  end
end
