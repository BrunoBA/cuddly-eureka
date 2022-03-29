defmodule Oscar.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  alias Oscar.Nominees.Nominee
  alias Oscar.Accounts.User

  schema "bets" do
    belongs_to :nominee, Nominee
    belongs_to :user, User

    field :active, :boolean

    timestamps()
  end

  @doc false
  def changeset(bet, attrs) do
    bet
    |> cast(attrs, [])
    |> validate_required([])
  end
end
