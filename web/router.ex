defmodule Foodtimebot.Router do
  use Foodtimebot.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Foodtimebot do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    # User Registrations
    resources "/registrations", RegistrationController, only: [:new, :create]
    
    # User Logins 
    get  "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete

    resources "/fooditems", FooditemController
    resources "/menus", MenuController
  end

  
  # Other scopes may use custom stacks.
   scope "/api", Foodtimebot do
    
   pipe_through :api
   end
end
