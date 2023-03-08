defmodule Registrocolegio.MateriasFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Registrocolegio.Materias` context.
  """

  @doc """
  Generate a materia.
  """
  def materia_fixture(attrs \\ %{}) do
    {:ok, materia} =
      attrs
      |> Enum.into(%{
        nombre: "some nombre",
        numero_creditos: "some numero_creditos"
      })
      |> Registrocolegio.Materias.create_materia()

    materia
  end
end
