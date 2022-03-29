defmodule Oscar.Nominees do
  @moduledoc """
  The Nominees context.
  """

  import Ecto.Query, warn: false
  alias Oscar.Repo

  alias Oscar.Nominees.Nominee

  @doc """
  Returns the list of nominees.

  ## Examples

      iex> list_nominees()
      [%Nominee{}, ...]

  """
  def list_nominees do
    Repo.all(Nominee)
  end

  @doc """
  Gets a single nominee.

  Raises `Ecto.NoResultsError` if the Nominee does not exist.

  ## Examples

      iex> get_nominee!(123)
      %Nominee{}

      iex> get_nominee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nominee!(id), do: Repo.get!(Nominee, id)

  @doc """
  Creates a nominee.

  ## Examples

      iex> create_nominee(%{field: value})
      {:ok, %Nominee{}}

      iex> create_nominee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nominee(attrs \\ %{}) do
    %Nominee{}
    |> Nominee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nominee.

  ## Examples

      iex> update_nominee(nominee, %{field: new_value})
      {:ok, %Nominee{}}

      iex> update_nominee(nominee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nominee(%Nominee{} = nominee, attrs) do
    nominee
    |> Nominee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nominee.

  ## Examples

      iex> delete_nominee(nominee)
      {:ok, %Nominee{}}

      iex> delete_nominee(nominee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nominee(%Nominee{} = nominee) do
    Repo.delete(nominee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nominee changes.

  ## Examples

      iex> change_nominee(nominee)
      %Ecto.Changeset{data: %Nominee{}}

  """
  def change_nominee(%Nominee{} = nominee, attrs \\ %{}) do
    Nominee.changeset(nominee, attrs)
  end
end
