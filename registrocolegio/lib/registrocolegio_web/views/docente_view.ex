defmodule RegistrocolegioWeb.DocenteView do
  use RegistrocolegioWeb, :view
  alias RegistrocolegioWeb.DocenteView

  def render("index.json", %{docentes: docentes}) do
    %{data: render_many(docentes, DocenteView, "docente.json")}
  end

  def render("show.json", %{docente: docente}) do
    %{data: render_one(docente, DocenteView, "docente.json")}
  end

  def render("docente.json", %{docente: docente}) do
    instituto = [docente.instituto]
    |> Enum.map(& Map.from_struct(&1))
    |> Enum.map(& Enum.reduce([:_meta_, :docentes, :materias, :inserted_at, :updated_at,], &1, fn key, acc -> Map.delete(key, acc) end))
    %{
      id: docente.id,
      nombres: docente.nombres,
      edad: docente.edad,
      correo: docente.correo,
      telefono: docente.telefono,
      especializacion: docente.especializacion,
      instituto: List.first(instituto)
    }
  end
end
