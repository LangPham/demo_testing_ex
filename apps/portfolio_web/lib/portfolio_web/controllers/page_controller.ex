defmodule PortfolioWeb.PageController do
  use PortfolioWeb, :controller
  def home(conn, _params) do
    path = Path.join(:code.priv_dir(:portfolio_web), "static/wasm/index.html")
    {:ok, index} = File.read(path)
    html(conn, index)
  end
end
