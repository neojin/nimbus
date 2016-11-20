defmodule Nimbus.GithubLink do
  require Logger

  # since the router is always involved, add it to every url
  @common_paths ["web/router.ex"]

  def init(paths), do: paths

  def call(conn, paths) do
    Logger.info inspect(urls(paths))
    Plug.Conn.assign(conn, :github_urls, urls(paths))
  end

  defp urls(relative_paths) do
    common_paths = url_map @common_paths
    user_paths = url_map relative_paths
    common_paths ++ user_paths
  end

  # NOTE : does this beling in a view module instead?
  defp url_map(paths) do
    Enum.map(paths, fn(path) -> { path, github_url_for(path) } end)
  end

  defp github_url_for(path) do
    base = Application.get_env :nimbus, :github_base_url
    base <> path
  end
end
