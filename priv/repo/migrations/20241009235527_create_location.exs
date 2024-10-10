defmodule LiveviewAutocomplete.Repo.Migrations.CreateLocation do
  use Ecto.Migration

  def change do
    create table(:location) do
      add :ship, :string
      add :system_name, :string
      add :pilot, :string

      timestamps(type: :utc_datetime)
    end
  end
end
