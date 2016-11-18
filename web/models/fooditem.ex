defmodule Foodtimebot.Fooditem do
  use Foodtimebot.Web, :model

  schema "fooditems" do
    field :foodname, :string
    field :foodgroup, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:foodname, :foodgroup, :status])
    |> validate_required([:foodname, :foodgroup, :status])
  end
  
  def only_featured do
      from(c in __MODULE__, where: c.featured == true, select: {c.foodname})
   end

  def find_for_select do
  	from( c in __MODULE__, select: {c.foodname, c.id})
  end
end
