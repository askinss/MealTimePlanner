defmodule Foodtimebot.FoodItemTest do
  use Foodtimebot.ModelCase

  alias Foodtimebot.FoodItem

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FoodItem.changeset(%FoodItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FoodItem.changeset(%FoodItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
