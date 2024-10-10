defmodule LiveviewAutocomplete.EveInfoFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LiveviewAutocomplete.EveInfo` context.
  """

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{
        pilot: "some pilot",
        ship: "some ship",
        system_name: "some system_name"
      })
      |> LiveviewAutocomplete.EveInfo.create_location()

    location
  end
end
