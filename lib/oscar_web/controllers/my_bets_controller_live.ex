defmodule OscarWeb.MyBetsControllerLive do
  use OscarWeb, :live_view

  alias Oscar.Repo
  alias Oscar.Categories.Category
  alias Oscar.Accounts.User
  alias Oscar.Bets

  def render(assigns) do
    Phoenix.View.render(OscarWeb.MyBetsView, "index.html", assigns)
  end

  def mount(_params, data, socket) do
    unless Map.has_key?(data, "user_id") do
      {:ok, redirect(socket, to: Routes.login_path(socket, :index))}
    else
      categories = Repo.all(Category) |> Repo.preload(:nominees)

      %{"user_id" => user_id} = data
      user = Repo.get(User, user_id)

      correct_bets = []
      bets = Bets.get_bets_by_user(user_id)

      socket =
        socket
        |> assign(:categories, categories)
        |> assign(:user, user)
        |> assign(:correct_bets, correct_bets)
        |> assign(:bets, bets)

      {:ok, socket}
    end
  end

  defp add_or_remove_correct_bet(correct_bets, category_id) do
    if Enum.member?(correct_bets, category_id) do
      correct_bets -- [category_id]
    else
      [category_id | correct_bets]
    end
  end

  def handle_event("set_as_correct", value, socket) do
    %{"category_id" => category_id} = value

    category_id = String.to_integer(category_id)

    correct_bets = add_or_remove_correct_bet(socket.assigns[:correct_bets], category_id)

    socket =
      socket
      |> assign(:correct_bets, correct_bets)

    {:noreply, socket}
  end
end
