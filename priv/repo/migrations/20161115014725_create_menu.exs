defmodule Foodtimebot.Repo.Migrations.CreateMenu do
  use Ecto.Migration

  def change do
    create table(:menus) do
      add :menu_name, :string
      add :meal_time, :string
      add :recipe, :text
      add :display_image, :string

      timestamps()
    end

  end
end
