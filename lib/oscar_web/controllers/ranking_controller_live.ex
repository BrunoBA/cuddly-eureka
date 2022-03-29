defmodule OscarWeb.RankingControllerLive do
  use OscarWeb, :live_view

  alias Oscar.Repo
  alias Oscar.Categories.Category
  alias Oscar.Accounts.User

  def render(assigns) do
    Phoenix.View.render(OscarWeb.RankingView, "index.html", assigns)
  end

  def mount(_params, data, socket) do
    unless Map.has_key?(data, "user_id") do
      {:ok, redirect(socket, to: Routes.login_path(socket, :index))}
    else
      users = Repo.all(User)
      socket = assign(socket, :users, users)

      {:ok, socket}
    end
  end
end
