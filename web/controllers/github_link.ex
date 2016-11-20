defmodule Nimbus.GithubLink do
  require Logger

  # since the router is always involved, add it to every url
  @common_paths ["web/router.ex", "web/templates/layout", "web/views/layout_view.ex"]

  def init(paths), do: paths

  def call(conn, paths) do
    Plug.Conn.assign(conn, :github_common_urls, url_map(@common_paths))
    |> Plug.Conn.assign(:github_defined_urls, url_map(paths))
  end

  # NOTE : does this beling in a view module instead?
  defp url_map(paths) do
    sorted = Enum.sort paths
    Enum.map(sorted, fn(path) -> { path, github_url_for(path) } end)
  end

  defp github_url_for(path) do
    base = Application.get_env :nimbus, :github_base_url
    base <> path
  end
end
