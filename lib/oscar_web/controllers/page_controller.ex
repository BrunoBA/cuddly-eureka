defmodule OscarWeb.PageController do
  use OscarWeb, :controller

  alias Oscar.Repo
  alias Oscar.Categories.Category

  plug OscarWeb.Plugs.RequireAuth when action in [:index]

  def index(conn, _params) do
    categories = Repo.all(Category) |> Repo.preload(:nominees)

    conn
    |> render("index.html", categories: categories)
  end
end
