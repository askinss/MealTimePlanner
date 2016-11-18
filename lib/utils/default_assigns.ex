defmodule Foodtimebot.Plugs.DefaultAssigns do
  alias Foodtimebot.Repo
  alias Foodtimebot.Fooditem

  import Plug.Conn

  def init(default), do: default

  def call(conn, _default) do
    #food_items = Repo.all(Fooditem.only_featured)
   # assign(conn, :food_items, food_items)
  end

end
