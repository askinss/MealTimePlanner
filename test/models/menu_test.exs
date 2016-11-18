defmodule Foodtimebot.MenuTest do
  use Foodtimebot.ModelCase

  alias Foodtimebot.Menu

  @valid_attrs %{display_image: "some content", meal_time: "some content", menu_name: "some content", recipe: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Menu.changeset(%Menu{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Menu.changeset(%Menu{}, @invalid_attrs)
    refute changeset.valid?
  end
end
