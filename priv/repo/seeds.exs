alias Nimbus.Repo
alias Nimbus.Company

Repo.delete_all Company

for _ <- 1..10 do
  company = %Company{
    name: Faker.Company.name,
    description: Faker.Lorem.paragraph(%Range{first: 1, last: 5}),
    since: Ecto.Date.cast!(DateTime.utc_now),
    employees: :rand.uniform(50),
    active: Enum.random([true, false])
  }

  Repo.insert company
end
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Nimbus.Repo.insert!(%Nimbus.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
