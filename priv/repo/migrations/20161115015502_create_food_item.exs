defmodule Foodtimebot.Repo.Migrations.CreateFoodItem do
  use Ecto.Migration

  def change do
    create table(:food_items) do
      add :menu_id, references(:menus, on_delete: :nothing)
      add :fooditem_id, references(:fooditems, on_delete: :nothing)

      timestamps()
    end
    create index(:food_items, [:menu_id])
    create index(:food_items, [:fooditem_id])

  end
end
