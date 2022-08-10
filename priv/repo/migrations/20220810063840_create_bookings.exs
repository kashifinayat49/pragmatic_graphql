defmodule Getaways.Repo.Migrations.CreateBookings do
  use Ecto.Migration

  def change do
    create table(:bookings) do
      add :start_date, :date
      add :end_date, :date
      add :state, :string
      add :total_price, :decimal
      add :place_id, references(:places), null: false
      add :user_id, references(:users), null: false

      timestamps()
    end

    create index(:bookings, [:place_id, :user_id])
  end
end
