defmodule Foodtimebot.MenuTypeTest do
  use Foodtimebot.ModelCase

  alias Foodtimebot.MenuType

  @valid_attrs %{menu_desc: "some content", menu_items: "some content", menu_name: "some content", menu_pic: "some content", menu_time: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MenuType.changeset(%MenuType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MenuType.changeset(%MenuType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
