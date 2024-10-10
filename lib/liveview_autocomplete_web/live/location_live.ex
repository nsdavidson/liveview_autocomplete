defmodule LiveviewAutocompleteWeb.LocationLive do
  use LiveviewAutocompleteWeb, :live_view

  alias LiveviewAutocomplete.EveInfo

  def mount(_params, _session, socket) do
    locations = EveInfo.list_location()
    {:ok, assign(socket, :locations, locations)}
  end

  def handle_event("search", %{"searchTerm" => searchTerm}, socket) do
    locations = EveInfo.search_location(searchTerm)
    {:noreply, assign(socket, :locations, locations)}
  end
end
