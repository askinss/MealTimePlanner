defmodule Foodtimebot.MenuTypeControllerTest do
  use Foodtimebot.ConnCase

  alias Foodtimebot.MenuType
  @valid_attrs %{menu_desc: "some content", menu_items: "some content", menu_name: "some content", menu_pic: "some content", menu_time: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, menu_type_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing menutypes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, menu_type_path(conn, :new)
    assert html_response(conn, 200) =~ "New menu type"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, menu_type_path(conn, :create), menu_type: @valid_attrs
    assert redirected_to(conn) == menu_type_path(conn, :index)
    assert Repo.get_by(MenuType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, menu_type_path(conn, :create), menu_type: @invalid_attrs
    assert html_response(conn, 200) =~ "New menu type"
  end

  test "shows chosen resource", %{conn: conn} do
    menu_type = Repo.insert! %MenuType{}
    conn = get conn, menu_type_path(conn, :show, menu_type)
    assert html_response(conn, 200) =~ "Show menu type"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, menu_type_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    menu_type = Repo.insert! %MenuType{}
    conn = get conn, menu_type_path(conn, :edit, menu_type)
    assert html_response(conn, 200) =~ "Edit menu type"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    menu_type = Repo.insert! %MenuType{}
    conn = put conn, menu_type_path(conn, :update, menu_type), menu_type: @valid_attrs
    assert redirected_to(conn) == menu_type_path(conn, :show, menu_type)
    assert Repo.get_by(MenuType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    menu_type = Repo.insert! %MenuType{}
    conn = put conn, menu_type_path(conn, :update, menu_type), menu_type: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit menu type"
  end

  test "deletes chosen resource", %{conn: conn} do
    menu_type = Repo.insert! %MenuType{}
    conn = delete conn, menu_type_path(conn, :delete, menu_type)
    assert redirected_to(conn) == menu_type_path(conn, :index)
    refute Repo.get(MenuType, menu_type.id)
  end
end
