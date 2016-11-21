defmodule Nimbus.Company do
  use Nimbus.Web, :model

  schema "companies" do
    field :name, :string
    field :description, :string
    field :since, Ecto.Date
    field :employees, :integer, default: 0
    field :active, :boolean, default: true

    timestamps
  end
end
