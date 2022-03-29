defmodule OscarWeb.BetControllerTest do
  use OscarWeb.ConnCase

  import Oscar.BetsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all bets", %{conn: conn} do
      conn = get(conn, Routes.bet_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Bets"
    end
  end

  describe "new bet" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.bet_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bet"
    end
  end

  describe "create bet" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.bet_path(conn, :create), bet: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.bet_path(conn, :show, id)

      conn = get(conn, Routes.bet_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bet"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.bet_path(conn, :create), bet: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bet"
    end
  end

  describe "edit bet" do
    setup [:create_bet]

    test "renders form for editing chosen bet", %{conn: conn, bet: bet} do
      conn = get(conn, Routes.bet_path(conn, :edit, bet))
      assert html_response(conn, 200) =~ "Edit Bet"
    end
  end

  describe "update bet" do
    setup [:create_bet]

    test "redirects when data is valid", %{conn: conn, bet: bet} do
      conn = put(conn, Routes.bet_path(conn, :update, bet), bet: @update_attrs)
      assert redirected_to(conn) == Routes.bet_path(conn, :show, bet)

      conn = get(conn, Routes.bet_path(conn, :show, bet))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, bet: bet} do
      conn = put(conn, Routes.bet_path(conn, :update, bet), bet: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bet"
    end
  end

  describe "delete bet" do
    setup [:create_bet]

    test "deletes chosen bet", %{conn: conn, bet: bet} do
      conn = delete(conn, Routes.bet_path(conn, :delete, bet))
      assert redirected_to(conn) == Routes.bet_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.bet_path(conn, :show, bet))
      end
    end
  end

  defp create_bet(_) do
    bet = bet_fixture()
    %{bet: bet}
  end
end
