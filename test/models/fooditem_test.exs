defmodule Foodtimebot.FooditemTest do
  use Foodtimebot.ModelCase

  alias Foodtimebot.Fooditem

  @valid_attrs %{foodgroup: "some content", foodname: "some content", status: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Fooditem.changeset(%Fooditem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Fooditem.changeset(%Fooditem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
