defmodule RegistrocolegioWeb.MateriaController do
  use RegistrocolegioWeb, :controller

  alias Registrocolegio.Materias
  alias Registrocolegio.Materias.Materia

  action_fallback RegistrocolegioWeb.FallbackController

  def index(conn, _params) do
    materias = Materias.list_materias()
    render(conn, "index.json", materias: materias)
  end

  def create(conn, %{"materia" => materia_params}) do
    with {:ok, %Materia{} = materia} <- Materias.create_materia(materia_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.materia_path(conn, :show, materia))
      |> render("show.json", materia: materia)
    end
  end

  def show(conn, %{"id" => id}) do
    materia = Materias.get_materia!(id)
    render(conn, "show.json", materia: materia)
  end

  def update(conn, %{"id" => id, "materia" => materia_params}) do
    materia = Materias.get_materia!(id)

    with {:ok, %Materia{} = materia} <- Materias.update_materia(materia, materia_params) do
      render(conn, "show.json", materia: materia)
    end
  end

  def delete(conn, %{"id" => id}) do
    materia = Materias.get_materia!(id)

    with {:ok, %Materia{}} <- Materias.delete_materia(materia) do
      send_resp(conn, :no_content, "")
    end
  end
end
