# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     LiveviewAutocomplete.Repo.insert!(%LiveviewAutocomplete.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias LiveviewAutocomplete.EveInfo

locations = [
  %{
    ship: "X-Wing",
    system_name: "A galaxy far, far away",
    pilot: "Luke S."
  },
  %{
    ship: "USS Enterprise",
    system_name: "The final frontier",
    pilot: "H. Sulu"
  },
  %{
    ship: "Serenity",
    system_name: "Somewhere in the 'verse",
    pilot: "Wash"
  }
]

Enum.each(locations, fn location ->
  EveInfo.create_location(location)
end)
