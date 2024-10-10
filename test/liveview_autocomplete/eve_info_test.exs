defmodule LiveviewAutocomplete.EveInfoTest do
  use LiveviewAutocomplete.DataCase

  alias LiveviewAutocomplete.EveInfo

  describe "location" do
    alias LiveviewAutocomplete.EveInfo.Location

    import LiveviewAutocomplete.EveInfoFixtures

    @invalid_attrs %{ship: nil, system_name: nil, pilot: nil}

    test "list_location/0 returns all location" do
      location = location_fixture()
      assert EveInfo.list_location() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert EveInfo.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{ship: "some ship", system_name: "some system_name", pilot: "some pilot"}

      assert {:ok, %Location{} = location} = EveInfo.create_location(valid_attrs)
      assert location.ship == "some ship"
      assert location.system_name == "some system_name"
      assert location.pilot == "some pilot"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EveInfo.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{ship: "some updated ship", system_name: "some updated system_name", pilot: "some updated pilot"}

      assert {:ok, %Location{} = location} = EveInfo.update_location(location, update_attrs)
      assert location.ship == "some updated ship"
      assert location.system_name == "some updated system_name"
      assert location.pilot == "some updated pilot"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = EveInfo.update_location(location, @invalid_attrs)
      assert location == EveInfo.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = EveInfo.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> EveInfo.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = EveInfo.change_location(location)
    end
  end
end
