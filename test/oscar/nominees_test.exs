defmodule Oscar.NomineesTest do
  use Oscar.DataCase

  alias Oscar.Nominees

  describe "nominees" do
    alias Oscar.Nominees.Nominee

    import Oscar.NomineesFixtures

    @invalid_attrs %{name: nil}

    test "list_nominees/0 returns all nominees" do
      nominee = nominee_fixture()
      assert Nominees.list_nominees() == [nominee]
    end

    test "get_nominee!/1 returns the nominee with given id" do
      nominee = nominee_fixture()
      assert Nominees.get_nominee!(nominee.id) == nominee
    end

    test "create_nominee/1 with valid data creates a nominee" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Nominee{} = nominee} = Nominees.create_nominee(valid_attrs)
      assert nominee.name == "some name"
    end

    test "create_nominee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Nominees.create_nominee(@invalid_attrs)
    end

    test "update_nominee/2 with valid data updates the nominee" do
      nominee = nominee_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Nominee{} = nominee} = Nominees.update_nominee(nominee, update_attrs)
      assert nominee.name == "some updated name"
    end

    test "update_nominee/2 with invalid data returns error changeset" do
      nominee = nominee_fixture()
      assert {:error, %Ecto.Changeset{}} = Nominees.update_nominee(nominee, @invalid_attrs)
      assert nominee == Nominees.get_nominee!(nominee.id)
    end

    test "delete_nominee/1 deletes the nominee" do
      nominee = nominee_fixture()
      assert {:ok, %Nominee{}} = Nominees.delete_nominee(nominee)
      assert_raise Ecto.NoResultsError, fn -> Nominees.get_nominee!(nominee.id) end
    end

    test "change_nominee/1 returns a nominee changeset" do
      nominee = nominee_fixture()
      assert %Ecto.Changeset{} = Nominees.change_nominee(nominee)
    end
  end
end
