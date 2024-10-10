defmodule LiveviewAutocomplete.Repo do
  use Ecto.Repo,
    otp_app: :liveview_autocomplete,
    adapter: Ecto.Adapters.Postgres
end
