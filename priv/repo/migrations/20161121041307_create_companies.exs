defmodule Nimbus.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string
      add :description, :text, null: true
      add :since, :date, null: true
      add :employees, :integer, default: 0
      add :active, :boolean, default: true
      timestamps
    end
  end
end
