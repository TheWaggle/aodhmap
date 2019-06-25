defmodule Aodhmap.EngrandTest do
  use Aodhmap.DataCase

  alias Aodhmap.Engrand

  describe "locations" do
    alias Aodhmap.Engrand.Location

    @valid_attrs %{idName: "some idName", latitude: 120.5, locationName: "some locationName", longitude: 120.5}
    @update_attrs %{idName: "some updated idName", latitude: 456.7, locationName: "some updated locationName", longitude: 456.7}
    @invalid_attrs %{idName: nil, latitude: nil, locationName: nil, longitude: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Engrand.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Engrand.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Engrand.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Engrand.create_location(@valid_attrs)
      assert location.idName == "some idName"
      assert location.latitude == 120.5
      assert location.locationName == "some locationName"
      assert location.longitude == 120.5
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Engrand.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Engrand.update_location(location, @update_attrs)
      assert location.idName == "some updated idName"
      assert location.latitude == 456.7
      assert location.locationName == "some updated locationName"
      assert location.longitude == 456.7
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Engrand.update_location(location, @invalid_attrs)
      assert location == Engrand.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Engrand.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Engrand.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Engrand.change_location(location)
    end
  end
end
