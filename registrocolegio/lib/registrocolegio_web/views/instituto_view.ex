defmodule RegistrocolegioWeb.InstitutoView do
  use RegistrocolegioWeb, :view
  alias RegistrocolegioWeb.InstitutoView

  def render("index.json", %{institutos: institutos}) do
    %{data: render_many(institutos, InstitutoView, "instituto.json")}
  end

  def render("show.json", %{instituto: instituto}) do
    %{data: render_one(instituto, InstitutoView, "instituto.json")}
  end

  def render("instituto.json", %{instituto: instituto}) do

    docentes = instituto.docentes
    |> Enum.map(& Map.from_struct(&1))
    |> Enum.map(& Enum.reduce([:_meta_, :instituto, :instituto_id, :materias, :inserted_at, :updated_at,], &1, fn key, acc -> Map.delete(key, acc) end))


    %{
      id: instituto.id,
      nombre: instituto.nombre,
      direccion: instituto.direccion,
      ciudad: instituto.ciudad,
      telefono: instituto.telefono,
      docentes: docentes
    }
  end
end