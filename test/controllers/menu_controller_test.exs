defmodule Foodtimebot.MenuControllerTest do
  use Foodtimebot.ConnCase

  alias Foodtimebot.Menu
  @valid_attrs %{display_image: "some content", meal_time: "some content", menu_name: "some content", recipe: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, menu_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing menus"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, menu_path(conn, :new)
    assert html_response(conn, 200) =~ "New menu"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, menu_path(conn, :create), menu: @valid_attrs
    assert redirected_to(conn) == menu_path(conn, :index)
    assert Repo.get_by(Menu, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, menu_path(conn, :create), menu: @invalid_attrs
    assert html_response(conn, 200) =~ "New menu"
  end

  test "shows chosen resource", %{conn: conn} do
    menu = Repo.insert! %Menu{}
    conn = get conn, menu_path(conn, :show, menu)
    assert html_response(conn, 200) =~ "Show menu"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, menu_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    menu = Repo.insert! %Menu{}
    conn = get conn, menu_path(conn, :edit, menu)
    assert html_response(conn, 200) =~ "Edit menu"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    menu = Repo.insert! %Menu{}
    conn = put conn, menu_path(conn, :update, menu), menu: @valid_attrs
    assert redirected_to(conn) == menu_path(conn, :show, menu)
    assert Repo.get_by(Menu, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    menu = Repo.insert! %Menu{}
    conn = put conn, menu_path(conn, :update, menu), menu: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit menu"
  end

  test "deletes chosen resource", %{conn: conn} do
    menu = Repo.insert! %Menu{}
    conn = delete conn, menu_path(conn, :delete, menu)
    assert redirected_to(conn) == menu_path(conn, :index)
    refute Repo.get(Menu, menu.id)
  end
end
