defmodule RegistrocolegioWeb.DocenteControllerTest do
  use RegistrocolegioWeb.ConnCase

  import Registrocolegio.DocentesFixtures

  alias Registrocolegio.Docentes.Docente

  @create_attrs %{
    correo: "some correo",
    edad: "some edad",
    especializacion: "some especializacion",
    nombres: "some nombres",
    telefono: "some telefono"
  }
  @update_attrs %{
    correo: "some updated correo",
    edad: "some updated edad",
    especializacion: "some updated especializacion",
    nombres: "some updated nombres",
    telefono: "some updated telefono"
  }
  @invalid_attrs %{correo: nil, edad: nil, especializacion: nil, nombres: nil, telefono: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all docentes", %{conn: conn} do
      conn = get(conn, Routes.docente_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create docente" do
    test "renders docente when data is valid", %{conn: conn} do
      conn = post(conn, Routes.docente_path(conn, :create), docente: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.docente_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "correo" => "some correo",
               "edad" => "some edad",
               "especializacion" => "some especializacion",
               "nombres" => "some nombres",
               "telefono" => "some telefono"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.docente_path(conn, :create), docente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update docente" do
    setup [:create_docente]

    test "renders docente when data is valid", %{conn: conn, docente: %Docente{id: id} = docente} do
      conn = put(conn, Routes.docente_path(conn, :update, docente), docente: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.docente_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "correo" => "some updated correo",
               "edad" => "some updated edad",
               "especializacion" => "some updated especializacion",
               "nombres" => "some updated nombres",
               "telefono" => "some updated telefono"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, docente: docente} do
      conn = put(conn, Routes.docente_path(conn, :update, docente), docente: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete docente" do
    setup [:create_docente]

    test "deletes chosen docente", %{conn: conn, docente: docente} do
      conn = delete(conn, Routes.docente_path(conn, :delete, docente))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.docente_path(conn, :show, docente))
      end
    end
  end

  defp create_docente(_) do
    docente = docente_fixture()
    %{docente: docente}
  end
end
