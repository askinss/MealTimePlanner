defmodule Foodtimebot.Repo.Migrations.CreateFooditem do
  use Ecto.Migration

  def change do
    create table(:fooditems) do
      add :foodname, :string
      add :foodgroup, :string
      add :status, :string

      timestamps()
    end

  end
end
