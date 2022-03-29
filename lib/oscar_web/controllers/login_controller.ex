defmodule OscarWeb.LoginController do
  use OscarWeb, :controller
	alias Oscar.Repo
  alias Oscar.Categories.Category

  def index(conn, _params) do
    if conn.assigns[:user] do
      redirect(conn, to: Routes.page_path(conn, :index))
    else
      conn
      |> put_root_layout("login.html")
      |> put_layout("empty.html")
      |> render("index.html")
    end
  end
end
