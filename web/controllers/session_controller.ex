defmodule Foodtimebot.SessionController do
  use Foodtimebot.Web, :controller

  alias Foodtimebot.User
  import Comeonin.Bcrypt, only: [checkpw: 2]
  plug :scrub_params, "session" when action in [:create]

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
  case Foodtimebot.Session.login(session_params, Foodtimebot.Repo) do
    {:ok, user} ->
      conn
      |> put_session(:current_user, user.id)
      |> put_flash(:info, "Logged in")
      |> redirect(to: "/")
    :error ->
      conn
      |> put_flash(:info, "Wrong email or password")
      |> render("new.html")
  end
end


  def delete(conn, _params) do
    conn
    |> put_flash(:info, "Signed out successfully")
    |> put_session(:current_user, nil)
    |> redirect(to: "/")
  end

end

