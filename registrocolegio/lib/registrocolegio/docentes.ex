defmodule Registrocolegio.Docentes do
  @moduledoc """
  The Docentes context.
  """

  import Ecto.Query, warn: false
  alias Registrocolegio.Repo

  alias Registrocolegio.Docentes.Docente

  @doc """
  Returns the list of docentes.

  ## Examples

      iex> list_docentes()
      [%Docente{}, ...]

  """
  def list_docentes do
    Repo.all(Docente) |> Repo.preload(:materias)
  end

  @doc """
  Gets a single docente.

  Raises `Ecto.NoResultsError` if the Docente does not exist.

  ## Examples

      iex> get_docente!(123)
      %Docente{}

      iex> get_docente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_docente!(id), do: Repo.get!(Docente, id) |> Repo.preload(:materias)

  @doc """
  Creates a docente.

  ## Examples

      iex> create_docente(%{field: value})
      {:ok, %Docente{}}

      iex> create_docente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_docente(attrs \\ %{}) do
    %Docente{}
    |> Docente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a docente.

  ## Examples

      iex> update_docente(docente, %{field: new_value})
      {:ok, %Docente{}}

      iex> update_docente(docente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_docente(%Docente{} = docente, attrs) do
    docente
    |> Docente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a docente.

  ## Examples

      iex> delete_docente(docente)
      {:ok, %Docente{}}

      iex> delete_docente(docente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_docente(%Docente{} = docente) do
    Repo.delete(docente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking docente changes.

  ## Examples

      iex> change_docente(docente)
      %Ecto.Changeset{data: %Docente{}}

  """
  def change_docente(%Docente{} = docente, attrs \\ %{}) do
    Docente.changeset(docente, attrs)
  end
end
