defmodule Registrocolegio.InstitutosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Registrocolegio.Institutos` context.
  """

  @doc """
  Generate a instituto.
  """
  def instituto_fixture(attrs \\ %{}) do
    {:ok, instituto} =
      attrs
      |> Enum.into(%{
        ciudad: "some ciudad",
        direccion: "some direccion",
        nombre: "some nombre",
        telefono: "some telefono"
      })
      |> Registrocolegio.Institutos.create_instituto()

    instituto
  end
end
