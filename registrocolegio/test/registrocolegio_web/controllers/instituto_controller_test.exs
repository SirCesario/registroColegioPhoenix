defmodule RegistrocolegioWeb.InstitutoControllerTest do
  use RegistrocolegioWeb.ConnCase

  import Registrocolegio.InstitutosFixtures

  alias Registrocolegio.Institutos.Instituto

  @create_attrs %{
    ciudad: "some ciudad",
    direccion: "some direccion",
    nombre: "some nombre",
    telefono: "some telefono"
  }
  @update_attrs %{
    ciudad: "some updated ciudad",
    direccion: "some updated direccion",
    nombre: "some updated nombre",
    telefono: "some updated telefono"
  }
  @invalid_attrs %{ciudad: nil, direccion: nil, nombre: nil, telefono: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all institutos", %{conn: conn} do
      conn = get(conn, Routes.instituto_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create instituto" do
    test "renders instituto when data is valid", %{conn: conn} do
      conn = post(conn, Routes.instituto_path(conn, :create), instituto: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.instituto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "ciudad" => "some ciudad",
               "direccion" => "some direccion",
               "nombre" => "some nombre",
               "telefono" => "some telefono"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.instituto_path(conn, :create), instituto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update instituto" do
    setup [:create_instituto]

    test "renders instituto when data is valid", %{conn: conn, instituto: %Instituto{id: id} = instituto} do
      conn = put(conn, Routes.instituto_path(conn, :update, instituto), instituto: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.instituto_path(conn, :show, id))

      assert %{
               "id" => ^id,
               "ciudad" => "some updated ciudad",
               "direccion" => "some updated direccion",
               "nombre" => "some updated nombre",
               "telefono" => "some updated telefono"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, instituto: instituto} do
      conn = put(conn, Routes.instituto_path(conn, :update, instituto), instituto: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete instituto" do
    setup [:create_instituto]

    test "deletes chosen instituto", %{conn: conn, instituto: instituto} do
      conn = delete(conn, Routes.instituto_path(conn, :delete, instituto))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.instituto_path(conn, :show, instituto))
      end
    end
  end

  defp create_instituto(_) do
    instituto = instituto_fixture()
    %{instituto: instituto}
  end
end
