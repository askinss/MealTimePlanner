defmodule Foodtimebot.FooditemController do
  use Foodtimebot.Web, :controller

  alias Foodtimebot.Fooditem

  def index(conn, _params) do
    fooditems = Repo.all(Fooditem)
    render(conn, "index.html", fooditems: fooditems)
  end

  def new(conn, _params) do
    changeset = Fooditem.changeset(%Fooditem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"fooditem" => fooditem_params}) do
    changeset = Fooditem.changeset(%Fooditem{}, fooditem_params)

    case Repo.insert(changeset) do
      {:ok, _fooditem} ->
        conn
        |> put_flash(:info, "Fooditem created successfully.")
        |> redirect(to: fooditem_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    fooditem = Repo.get!(Fooditem, id)
    render(conn, "show.html", fooditem: fooditem)
  end

  def edit(conn, %{"id" => id}) do
    fooditem = Repo.get!(Fooditem, id)
    changeset = Fooditem.changeset(fooditem)
    render(conn, "edit.html", fooditem: fooditem, changeset: changeset)
  end

  def update(conn, %{"id" => id, "fooditem" => fooditem_params}) do
    fooditem = Repo.get!(Fooditem, id)
    changeset = Fooditem.changeset(fooditem, fooditem_params)

    case Repo.update(changeset) do
      {:ok, fooditem} ->
        conn
        |> put_flash(:info, "Fooditem updated successfully.")
        |> redirect(to: fooditem_path(conn, :show, fooditem))
      {:error, changeset} ->
        render(conn, "edit.html", fooditem: fooditem, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    fooditem = Repo.get!(Fooditem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(fooditem)

    conn
    |> put_flash(:info, "Fooditem deleted successfully.")
    |> redirect(to: fooditem_path(conn, :index))
  end
end
