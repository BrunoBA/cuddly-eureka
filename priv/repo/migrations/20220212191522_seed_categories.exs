defmodule Oscar.Repo.Migrations.SeedCategories do
  use Ecto.Migration

  alias Oscar.Categories.Category
  alias Oscar.Repo

  def up do
    # [%Category{name: "Best Picture"}]
    # |> Enum.each(fn x -> Repo.insert(x) end)
    IO.puts("-------")
  end

  def down do
    IO.puts("-------")
  end
end
