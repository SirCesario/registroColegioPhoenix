defmodule RegistrocolegioWeb.DocenteController do
  use RegistrocolegioWeb, :controller



  alias Registrocolegio.Docentes
  alias Registrocolegio.Docentes.Docente

  action_fallback RegistrocolegioWeb.FallbackController

  def index(conn, _params) do
    docentes = Docentes.list_docentes()
    render(conn, "index.json", docentes: docentes)
  end


  def create(conn, %{"docente" => docente_params}) do
    with {:ok, %Docente{} = docente} <- Docentes.create_docente(docente_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", Routes.docente_path(conn, :show, docente))
      |> render("show.json", docente: docente)
    end
  end



  def show(conn, %{"id" => id}) do
    docente = Docentes.get_docente!(id)
    render(conn, "show.json", docente: docente)
  end

  def update(conn, %{"id" => id, "docente" => docente_params}) do
    docente = Docentes.get_docente!(id)

    with {:ok, %Docente{} = docente} <- Docentes.update_docente(docente, docente_params) do
      render(conn, "show.json", docente: docente)
    end
  end

  def delete(conn, %{"id" => id}) do
    docente = Docentes.get_docente!(id)

    with {:ok, %Docente{}} <- Docentes.delete_docente(docente) do
      send_resp(conn, :no_content, "")
    end
  end
end
