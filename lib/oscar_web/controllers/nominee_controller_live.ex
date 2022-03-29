defmodule OscarWeb.NomineeControllerLive do
  use OscarWeb, :live_view

  alias Oscar.Repo
  alias Oscar.Categories.Category
  alias Oscar.Accounts.User
  alias Oscar.Bets

  def render(assigns) do
    Phoenix.View.render(OscarWeb.NomineesView, "index.html", assigns)
  end

  def mount(_params, data, socket) do
    unless Map.has_key?(data, "user_id") do
      {:ok, redirect(socket, to: Routes.login_path(socket, :index))}
    else
      categories = Repo.all(Category) |> Repo.preload(:nominees)

      %{"user_id" => user_id} = data
      user = Repo.get(User, user_id)
      bets = Bets.get_bets_by_user(user_id)

      socket =
        socket
        |> assign(:categories, categories)
        |> assign(:user, user)
        |> assign(:bets, bets)

      {:ok, socket}
    end
  end

  def handle_event("choose_nominee", value, socket) do
    %{"nominee_id" => nominee_id} = value

		compare = DateTime.compare(~U[2022-03-27 23:59:59.000000Z], DateTime.utc_now())
		socket = do_the_bet(socket, nominee_id, compare)

    {:noreply, socket}
  end

	defp do_the_bet(socket, _, :eq), do: socket

	defp do_the_bet(socket, _, :lt), do: socket

	defp do_the_bet(socket, nominee_id, :gt) do
		categories = Repo.all(Category) |> Repo.preload(:nominees)

    user = socket.assigns[:user]

    Bets.create_bet(nominee_id, user.id)

    bets = Bets.get_bets_by_user(user.id)

		socket
      |> assign(:categories, categories)
      |> assign(:bets, bets)
	end
end
