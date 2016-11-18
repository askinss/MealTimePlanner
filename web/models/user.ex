defmodule Foodtimebot.User do
  use Foodtimebot.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :intro, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password, :intro])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/(.*?)\@\w+\.\w+/)
    |> validate_length(:password, min: 6 )

  end
end
