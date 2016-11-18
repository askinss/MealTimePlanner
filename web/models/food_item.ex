defmodule Foodtimebot.FoodItem do
  use Foodtimebot.Web, :model

  schema "food_items" do
    belongs_to :menu, Foodtimebot.Menu
    belongs_to :fooditem, Foodtimebot.Fooditem

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
