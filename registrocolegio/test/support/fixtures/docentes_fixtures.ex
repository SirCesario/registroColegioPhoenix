defmodule Registrocolegio.DocentesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Registrocolegio.Docentes` context.
  """

  @doc """
  Generate a docente.
  """
  def docente_fixture(attrs \\ %{}) do
    {:ok, docente} =
      attrs
      |> Enum.into(%{
        correo: "some correo",
        edad: "some edad",
        especializacion: "some especializacion",
        nombres: "some nombres",
        telefono: "some telefono"
      })
      |> Registrocolegio.Docentes.create_docente()

    docente
  end
end
