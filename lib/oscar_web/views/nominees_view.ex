defmodule OscarWeb.NomineesView do
  use OscarWeb, :view

  def is_choosen(_, []), do: false

  def is_choosen(nominee_id, bets) do
    nominees = Enum.map(bets, fn bet -> bet.nominee_id end)

    Enum.member?(nominees, nominee_id)
  end
end
