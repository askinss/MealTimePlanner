defmodule Foodtimebot.FoodItemControllerTest do
  use Foodtimebot.ConnCase

  alias Foodtimebot.FoodItem
  @valid_attrs %{food_class: "some content", fooditem_name: "some content", status: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, food_item_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing fooditems"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, food_item_path(conn, :new)
    assert html_response(conn, 200) =~ "New food item"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, food_item_path(conn, :create), food_item: @valid_attrs
    assert redirected_to(conn) == food_item_path(conn, :index)
    assert Repo.get_by(FoodItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, food_item_path(conn, :create), food_item: @invalid_attrs
    assert html_response(conn, 200) =~ "New food item"
  end

  test "shows chosen resource", %{conn: conn} do
    food_item = Repo.insert! %FoodItem{}
    conn = get conn, food_item_path(conn, :show, food_item)
    assert html_response(conn, 200) =~ "Show food item"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, food_item_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    food_item = Repo.insert! %FoodItem{}
    conn = get conn, food_item_path(conn, :edit, food_item)
    assert html_response(conn, 200) =~ "Edit food item"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    food_item = Repo.insert! %FoodItem{}
    conn = put conn, food_item_path(conn, :update, food_item), food_item: @valid_attrs
    assert redirected_to(conn) == food_item_path(conn, :show, food_item)
    assert Repo.get_by(FoodItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    food_item = Repo.insert! %FoodItem{}
    conn = put conn, food_item_path(conn, :update, food_item), food_item: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit food item"
  end

  test "deletes chosen resource", %{conn: conn} do
    food_item = Repo.insert! %FoodItem{}
    conn = delete conn, food_item_path(conn, :delete, food_item)
    assert redirected_to(conn) == food_item_path(conn, :index)
    refute Repo.get(FoodItem, food_item.id)
  end
end
