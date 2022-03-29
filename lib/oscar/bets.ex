defmodule Oscar.Bets do
  @moduledoc """
  The Bets context.
  """

  import Ecto.Query, warn: false
  import Ecto.Query, only: [from: 2]

  alias Oscar.Nominees.Nominee
  alias Oscar.Bets.Bet
  alias Oscar.Repo

  def get_unique_by_category([], accumulator), do: accumulator

  def get_unique_by_category([head | tail], accumulator),
    do: get_unique_by_category(tail, get_accumulator(accumulator, head))

  defp get_accumulator(acc, head) do
    category_ids = Enum.map(acc, fn bet -> bet.category_id end)

    if Enum.member?(category_ids, head.category_id) do
      acc
    else
      acc ++ [head]
    end
  end

  def get_bets_by_user(user_id) do
    query =
      from(
        b in Bet,
        join: n in Nominee,
        on: b.nominee_id == n.id,
        where: b.user_id == ^user_id
      )

    query =
      from(
        [b, n] in query,
        select: %{
          nominee_id: b.nominee_id,
          nominee_title: n.title,
          nominee_sub_title: n.subtitle,
          category_id: n.category_id,
          created_at: b.inserted_at
        },
        order_by: [
          desc: n.category_id,
          desc: b.inserted_at
        ]
      )

    Repo.all(query)
    |> get_unique_by_category([])
  end

  def invalidate_old_bets(category_id, user_id) do
    query =
      from(
        b in Bet,
        join: n in Nominee,
        on: b.nominee_id == n.id,
        where: b.user_id == ^user_id,
        where: n.category_id == ^category_id
      )

    Repo.update_all(query, set: [active: false])
  end

  def create_bet(nominee_id, user_id) do
    nominee = Repo.get(Nominee, nominee_id)
    update_bets(nominee, user_id)
  end

  defp update_bets(nil, _), do: :ok

  defp update_bets(nominee, user_id) do
    invalidate_old_bets(nominee.category_id, user_id)

    {status, _} =
      %Bet{
        nominee_id: nominee.id,
        user_id: user_id
      }
      |> Repo.insert()

    status
  end
end
