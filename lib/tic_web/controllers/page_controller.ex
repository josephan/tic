defmodule TicWeb.PageController do
  use TicWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
