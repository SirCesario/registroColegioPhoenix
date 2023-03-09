defmodule RegistrocolegioWeb.MateriaView do
  use RegistrocolegioWeb, :view
  alias RegistrocolegioWeb.MateriaView

  def render("index.json", %{materias: materias}) do
    %{data: render_many(materias, MateriaView, "materia.json")}
  end

  def render("show.json", %{materia: materia}) do
    %{data: render_one(materia, MateriaView, "materia.json")}
  end

  def render("materia.json", %{materia: materia}) do
    %{
      id: materia.id,
      nombre: materia.nombre,
      numero_creditos: materia.numero_creditos
    }
  end
end
