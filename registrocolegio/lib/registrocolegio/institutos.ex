defmodule Registrocolegio.Institutos do
  @moduledoc """
  The Institutos context.
  """

  import Ecto.Query, warn: false
  alias Registrocolegio.Repo

  alias Registrocolegio.Institutos.Instituto

  @doc """
  Returns the list of institutos.

  ## Examples

      iex> list_institutos()
      [%Instituto{}, ...]

  """
  def list_institutos do
    Repo.all(Instituto)
    #|> Repo.preload(:docentes)
  end

  @doc """
  Gets a single instituto.

  Raises `Ecto.NoResultsError` if the Instituto does not exist.

  ## Examples

      iex> get_instituto!(123)
      %Instituto{}

      iex> get_instituto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_instituto!(id), do: Repo.get!(Instituto, id) #|> Repo.preload(:docentes)



  @doc """
  Creates a instituto.

  ## Examples

      iex> create_instituto(%{field: value})
      {:ok, %Instituto{}}

      iex> create_instituto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_instituto(attrs \\ %{}) do
    %Instituto{}
    |> Instituto.changeset(attrs)
    |> Repo.insert()
  end

  #Creacion de Validacion Para Cantidad de Docentes en Un Instituto




  @doc """
  Updates a instituto.

  ## Examples

      iex> update_instituto(instituto, %{field: new_value})
      {:ok, %Instituto{}}

      iex> update_instituto(instituto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_instituto(%Instituto{} = instituto, attrs) do
    instituto
    |> Instituto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a instituto.

  ## Examples

      iex> delete_instituto(instituto)
      {:ok, %Instituto{}}

      iex> delete_instituto(instituto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_instituto(%Instituto{} = instituto) do
    Repo.delete(instituto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking instituto changes.

  ## Examples

      iex> change_instituto(instituto)
      %Ecto.Changeset{data: %Instituto{}}

  """
  def change_instituto(%Instituto{} = instituto, attrs \\ %{}) do
    Instituto.changeset(instituto, attrs)
  end
end
