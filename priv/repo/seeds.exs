alias Nimbus.Repo
alias Nimbus.Company

# delete and re-seed 20 companies
Repo.delete_all Company

for _ <- 1..20 do
  company = %Company{
    name: Faker.Company.name,
    description: Faker.Lorem.paragraph(%Range{first: 1, last: 5}),
    since: Ecto.Date.cast!(DateTime.utc_now),
    employees: :rand.uniform(50),
    active: Enum.random([true, false])
  }

  Repo.insert company
end
