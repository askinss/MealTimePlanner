defmodule Foodtimebot.RegistrationController do
  use Foodtimebot.Web, :controller
  alias Foodtimebot.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

def create(conn, %{"user" => user_params}) do
  changeset = User.changeset(%User{}, user_params)

  case Foodtimebot.Registration.create(changeset, Foodtimebot.Repo) do
    {:ok, changeset} ->
      conn
      |> put_flash(:info, "Profile Created")
      |> redirect(to: "/")
    {:error, changeset} ->
      conn
      |> put_flash(:info, "Unable to create Profile")
      |> render("new.html", changeset: changeset)
  end
end

end

