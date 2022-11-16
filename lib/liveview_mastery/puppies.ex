defmodule LiveviewMastery.Puppies do
  @moduledoc """
  The Puppies context.
  """

  import Ecto.Query, warn: false
  alias LiveviewMastery.Repo

  alias LiveviewMastery.Puppies.Puppy

  @doc """
  Returns the list of puppies.

  ## Examples

      iex> list_puppies()
      [%Puppy{}, ...]

  """
  def list_puppies do
    Repo.all(Puppy)
  end

  @doc """
  Gets a single puppy.

  Raises `Ecto.NoResultsError` if the Puppy does not exist.

  ## Examples

      iex> get_puppy!(123)
      %Puppy{}

      iex> get_puppy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_puppy!(id), do: Repo.get!(Puppy, id)

  @doc """
  Creates a puppy.

  ## Examples

      iex> create_puppy(%{field: value})
      {:ok, %Puppy{}}

      iex> create_puppy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_puppy(attrs \\ %{}) do
    %Puppy{}
    |> Puppy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a puppy.

  ## Examples

      iex> update_puppy(puppy, %{field: new_value})
      {:ok, %Puppy{}}

      iex> update_puppy(puppy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_puppy(%Puppy{} = puppy, attrs) do
    puppy
    |> Puppy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a puppy.

  ## Examples

      iex> delete_puppy(puppy)
      {:ok, %Puppy{}}

      iex> delete_puppy(puppy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_puppy(%Puppy{} = puppy) do
    Repo.delete(puppy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking puppy changes.

  ## Examples

      iex> change_puppy(puppy)
      %Ecto.Changeset{data: %Puppy{}}

  """
  def change_puppy(%Puppy{} = puppy, attrs \\ %{}) do
    Puppy.changeset(puppy, attrs)
  end
end
