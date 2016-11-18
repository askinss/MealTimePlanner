defmodule Foodtimebot.MenuController do
  use Foodtimebot.Web, :controller

  alias Foodtimebot.Menu
  alias Foodtimebot.Fooditem
  
  plug :set_fooditems when action in [:new, :create, :edit, :update] 

  def index(conn, _params) do
    {menus, kerosene}  = Menu.all_menus |> Repo.paginate(_params)
    render(conn, "index.html", menus: menus, kerosene: kerosene)
  end

  def new(conn, _params) do
    changeset = Menu.changeset(%Menu{fooditems: []})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"menu" => menu_params}) do
    changeset = Menu.changeset(%Menu{fooditems: []}, menu_params)


    case Repo.insert(changeset) do
      {:ok, _menu} ->
        conn
        |> put_flash(:info, "Menu created successfully.")
        |> redirect(to: menu_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    menu = Repo.get!(Menu, id)
    
    |> Repo.preload([:fooditems])
    render(conn, "show.html", menu: menu)
  end

  def edit(conn, %{"id" => id}) do
    menu = Repo.get!(Menu, id)
    |> Repo.preload([:fooditems])
    changeset = Menu.changeset(menu)
    render(conn, "edit.html", menu: menu, changeset: changeset)
  end

  def update(conn, %{"id" => id, "menu" => menu_params}) do
    menu = Repo.get!(Menu, id)
    |> Repo.preload([:fooditems])
    changeset = Menu.changeset(menu, menu_params)

    case Repo.update(changeset) do
      {:ok, menu} ->
        conn
        |> put_flash(:info, "Menu updated successfully.")
        |> redirect(to: menu_path(conn, :show, menu))
      {:error, changeset} ->
        render(conn, "edit.html", menu: menu, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu = Repo.get!(Menu, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(menu)

    conn
    |> put_flash(:info, "Menu deleted successfully.")
    |> redirect(to: menu_path(conn, :index))
  end
  
  defp set_fooditems(conn, _params) do
    assign(conn, :fooditems, Repo.all(Fooditem.find_for_select))
  end
end
