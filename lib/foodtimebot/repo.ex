defmodule Foodtimebot.Repo do
  use Ecto.Repo, otp_app: :foodtimebot
  use Kerosene, per_page: 10
end
