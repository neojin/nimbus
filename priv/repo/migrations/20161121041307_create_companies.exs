defmodule Nimbus.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:company) do
      add :name, :string
      add :description, :text
      add :since, :date
      add :employees, :integer
      add :active, :boolean
      timestamps
    end
  end
end
