defmodule Foodtimebot.PageController do
  use Foodtimebot.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
