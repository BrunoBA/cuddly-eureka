defmodule OscarWeb.NomineeControllerTest do
  use OscarWeb.ConnCase

  import Oscar.NomineesFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all nominees", %{conn: conn} do
      conn = get(conn, Routes.nominee_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Nominees"
    end
  end

  describe "new nominee" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.nominee_path(conn, :new))
      assert html_response(conn, 200) =~ "New Nominee"
    end
  end

  describe "create nominee" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.nominee_path(conn, :create), nominee: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.nominee_path(conn, :show, id)

      conn = get(conn, Routes.nominee_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Nominee"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.nominee_path(conn, :create), nominee: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Nominee"
    end
  end

  describe "edit nominee" do
    setup [:create_nominee]

    test "renders form for editing chosen nominee", %{conn: conn, nominee: nominee} do
      conn = get(conn, Routes.nominee_path(conn, :edit, nominee))
      assert html_response(conn, 200) =~ "Edit Nominee"
    end
  end

  describe "update nominee" do
    setup [:create_nominee]

    test "redirects when data is valid", %{conn: conn, nominee: nominee} do
      conn = put(conn, Routes.nominee_path(conn, :update, nominee), nominee: @update_attrs)
      assert redirected_to(conn) == Routes.nominee_path(conn, :show, nominee)

      conn = get(conn, Routes.nominee_path(conn, :show, nominee))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, nominee: nominee} do
      conn = put(conn, Routes.nominee_path(conn, :update, nominee), nominee: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Nominee"
    end
  end

  describe "delete nominee" do
    setup [:create_nominee]

    test "deletes chosen nominee", %{conn: conn, nominee: nominee} do
      conn = delete(conn, Routes.nominee_path(conn, :delete, nominee))
      assert redirected_to(conn) == Routes.nominee_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.nominee_path(conn, :show, nominee))
      end
    end
  end

  defp create_nominee(_) do
    nominee = nominee_fixture()
    %{nominee: nominee}
  end
end
