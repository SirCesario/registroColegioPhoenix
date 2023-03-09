defmodule Registrocolegio.Materias do
  @moduledoc """
  The Materias context.
  """

  import Ecto.Query, warn: false
  alias Registrocolegio.Repo

  alias Registrocolegio.Materias.Materia

  @doc """
  Returns the list of materias.

  ## Examples

      iex> list_materias()
      [%Materia{}, ...]

  """
  def list_materias do
    Repo.all(Materia) |> Repo.preload(:docente)
  end

  @doc """
  Gets a single materia.

  Raises `Ecto.NoResultsError` if the Materia does not exist.

  ## Examples

      iex> get_materia!(123)
      %Materia{}

      iex> get_materia!(456)
      ** (Ecto.NoResultsError)

  """
  def get_materia!(id), do: Repo.get!(Materia, id) |> Repo.preload(:docente)

  @doc """
  Creates a materia.

  ## Examples

      iex> create_materia(%{field: value})
      {:ok, %Materia{}}

      iex> create_materia(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_materia(attrs \\ %{}) do
    %Materia{}
    |> Materia.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a materia.

  ## Examples

      iex> update_materia(materia, %{field: new_value})
      {:ok, %Materia{}}

      iex> update_materia(materia, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_materia(%Materia{} = materia, attrs) do
    materia
    |> Materia.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a materia.

  ## Examples

      iex> delete_materia(materia)
      {:ok, %Materia{}}

      iex> delete_materia(materia)
      {:error, %Ecto.Changeset{}}

  """
  def delete_materia(%Materia{} = materia) do
    Repo.delete(materia)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking materia changes.

  ## Examples

      iex> change_materia(materia)
      %Ecto.Changeset{data: %Materia{}}

  """
  def change_materia(%Materia{} = materia, attrs \\ %{}) do
    Materia.changeset(materia, attrs)
  end
end
