defmodule Bank.Repo.Migrations.CreateCustomer do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :username, :string
      add :email, :string
      add :wallet_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create index(:customers, [:username], unique: true)
    create index(:customers, [:email], unique: true)
  end
end
