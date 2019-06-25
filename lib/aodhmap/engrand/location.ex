defmodule Aodhmap.Engrand.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :idName, :string
    field :latitude, :float
    field :locationName, :string
    field :longitude, :float

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:latitude, :longitude, :idName, :locationName])
    |> validate_required([:latitude, :longitude, :idName, :locationName])
  end
end
