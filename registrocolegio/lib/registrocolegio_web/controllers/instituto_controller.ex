defmodule RegistrocolegioWeb.InstitutoController do
  use RegistrocolegioWeb, :controller

  alias Registrocolegio.Institutos
  alias Registrocolegio.Institutos.Instituto

  action_fallback RegistrocolegioWeb.FallbackController

  def index(conn, _params) do
    institutos = Institutos.list_institutos()
    render(conn, "index.json", institutos: institutos)
  end

  def create(conn, %{"instituto" => instituto_params}) do
    with {:ok, %Instituto{} = instituto} <- Institutos.create_instituto(instituto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.instituto_path(conn, :show, instituto))
      |> render("show.json", instituto: instituto)
    end
  end

  def show(conn, %{"id" => id}) do
    instituto = Institutos.get_instituto!(id)
    render(conn, "show.json", instituto: instituto)
  end

  def update(conn, %{"id" => id, "instituto" => instituto_params}) do
    instituto = Institutos.get_instituto!(id)

    with {:ok, %Instituto{} = instituto} <- Institutos.update_instituto(instituto, instituto_params) do
      render(conn, "show.json", instituto: instituto)
    end
  end

  def delete(conn, %{"id" => id}) do
    instituto = Institutos.get_instituto!(id)

    with {:ok, %Instituto{}} <- Institutos.delete_instituto(instituto) do
      send_resp(conn, :no_content, "No se puede eliminar un Instituto si aun tiene Docentes Asignados")
    end
  end
end
