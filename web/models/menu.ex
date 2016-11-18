defmodule Foodtimebot.Menu do
  use Foodtimebot.Web, :model
  import Foodtimebot.Utils.Sluggify
  import Foodtimebot.Utils.ManyToMany


  schema "menus" do
    field :menu_name, :string
    field :meal_time, :string
    field :recipe, :string
    field :display_image, :string

    many_to_many :fooditems, Foodtimebot.Fooditem, join_through: "food_items", on_delete: :nothing
    timestamps()
  end

  def all_menus do
    from m in __MODULE__,
      order_by: [desc: m.inserted_at]

  end
  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:menu_name, :meal_time, :recipe, :display_image])
    |> validate_required([:menu_name, :meal_time, :recipe, :display_image])
  end
end
