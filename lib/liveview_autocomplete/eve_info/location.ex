defmodule LiveviewAutocomplete.EveInfo.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "location" do
    field :ship, :string
    field :system_name, :string
    field :pilot, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:ship, :system_name, :pilot])
    |> validate_required([:ship, :system_name, :pilot])
  end
end
