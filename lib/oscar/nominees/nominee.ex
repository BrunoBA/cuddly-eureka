defmodule Oscar.Nominees.Nominee do
  use Ecto.Schema
  import Ecto.Changeset

  alias Oscar.Categories.Category
  alias Oscar.Bets.Bet

  schema "nominees" do
    field :title, :string
    field :subtitle, :string

    belongs_to :category, Category

    has_many :bets, Bet

    timestamps()
  end

  @doc false
  def changeset(nominee, attrs) do
    nominee
    |> cast(attrs, [:title, :subtitle, :category, :category_id])
    |> validate_required([:title, :subtitle])
  end
end
