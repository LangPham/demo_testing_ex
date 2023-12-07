defmodule PortfolioWeb.Router do
  use PortfolioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    # plug :fetch_session
    # plug :fetch_live_flash
    # plug :put_root_layout, html: {NoelWeb.Layouts, :root}
    # plug :protect_from_forgery
    # plug :put_secure_browser_headers
    # plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PortfolioWeb do
    pipe_through :browser
    get "/", PageController, :home
    get "/contact", PageController, :home
    get "/portfolio", PageController, :home
    get "/portfolio/:id", PageController, :home

  end

  scope "/api", PortfolioWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
    resources "/tags", TagController, except: [:new, :edit]
    resources "/projects", ProjectController
    resources "/project_tag", ProjectTagController, except: [:new, :edit]

    get "/projects/slug/:slug", ProjectController, :show_slug
  end
end
