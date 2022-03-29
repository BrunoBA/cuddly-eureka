defmodule Oscar.BetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oscar.Bets` context.
  """

  @doc """
  Generate a bet.
  """
  def bet_fixture(attrs \\ %{}) do
    {:ok, bet} =
      attrs
      |> Enum.into(%{

      })
      |> Oscar.Bets.create_bet()

    bet
  end
end
