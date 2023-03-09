defmodule RegistrocolegioWeb.MateriaControllerTest do
  use RegistrocolegioWeb.ConnCase

  import Registrocolegio.MateriasFixtures

  alias Registrocolegio.Materias.Materia

  @create_attrs %{
    nombre: "some nombre",
    numero_creditos: "some numero_creditos"
  }
  @update_attrs %{
    nombre: "some updated nombre",
    numero_creditos: "some updated numero_creditos"
  }
  @invalid_attrs %{nombre: nil, numero_creditos: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all materias", %{conn: conn} do
      conn = get(conn, Routes.materia_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create materia" do
    test "renders materia when data is valid", %{conn: conn} do
      conn = post(conn, Routes.materia_path(conn, :create), materia: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.materia_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "nombre" => "some nombre",
               "numero_creditos" => "some numero_creditos"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.materia_path(conn, :create), materia: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update materia" do
    setup [:create_materia]

    test "renders materia when data is valid", %{conn: conn, materia: %Materia{id: id} = materia} do
      conn = put(conn, Routes.materia_path(conn, :update, materia), materia: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.materia_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "nombre" => "some updated nombre",
               "numero_creditos" => "some updated numero_creditos"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, materia: materia} do
      conn = put(conn, Routes.materia_path(conn, :update, materia), materia: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete materia" do
    setup [:create_materia]

    test "deletes chosen materia", %{conn: conn, materia: materia} do
      conn = delete(conn, Routes.materia_path(conn, :delete, materia))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.materia_path(conn, :show, materia))
      end
    end
  end

  defp create_materia(_) do
    materia = materia_fixture()
    %{materia: materia}
  end
end
