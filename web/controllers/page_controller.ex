defmodule TuxApi.PageController do
  use TuxApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
