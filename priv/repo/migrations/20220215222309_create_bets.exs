defmodule Oscar.Repo.Migrations.CreateBets do
  use Ecto.Migration

  def change do
    create table(:bets) do
      add :user_id, references(:users)
      add :nominee_id, references(:nominees)
      add :active, :boolean, default: true
      timestamps()
    end
  end
end
