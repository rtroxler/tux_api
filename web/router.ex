defmodule TuxApi.Router do
  use TuxApi.Web, :router

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

   scope "/api", TuxApi do
     pipe_through :api

     get "/rate-data", TuxController, :process_rates
     get "/national-rate-data", TuxController, :process_all_rates
     get "/city-data", TuxController, :find_cities
   end
end
