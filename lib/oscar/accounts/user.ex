defmodule Oscar.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Oscar.Bets.Bet

  schema "users" do
    field :name, :string
    field :email, :string
    field :provider, :string
    field :token, :string

    has_many :bets, Bet

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :provider, :token])
    |> validate_required([:email])
  end
end
