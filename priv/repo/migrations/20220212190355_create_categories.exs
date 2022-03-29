defmodule Oscar.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  alias Oscar.Nominees.Nominee

  def up do
    create table(:categories) do
      add :name, :string

      timestamps()
    end
  end

  def down do
    drop table(:categories)
  end
end
