defmodule Oscar.Repo.Migrations.CreateNominees do
  use Ecto.Migration

  def change do
    create table(:nominees) do
      add :title, :string
      add :subtitle, :string
      add :category_id, references(:categories)

      timestamps()
    end
  end
end
