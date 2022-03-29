defmodule Oscar.NomineesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Oscar.Nominees` context.
  """

  @doc """
  Generate a nominee.
  """
  def nominee_fixture(attrs \\ %{}) do
    {:ok, nominee} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Oscar.Nominees.create_nominee()

    nominee
  end
end
