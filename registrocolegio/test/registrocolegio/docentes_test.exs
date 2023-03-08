defmodule Registrocolegio.DocentesTest do
  use Registrocolegio.DataCase

  alias Registrocolegio.Docentes

  describe "docentes" do
    alias Registrocolegio.Docentes.Docente

    import Registrocolegio.DocentesFixtures

    @invalid_attrs %{correo: nil, edad: nil, especializacion: nil, nombres: nil, telefono: nil}

    test "list_docentes/0 returns all docentes" do
      docente = docente_fixture()
      assert Docentes.list_docentes() == [docente]
    end

    test "get_docente!/1 returns the docente with given id" do
      docente = docente_fixture()
      assert Docentes.get_docente!(docente.id) == docente
    end

    test "create_docente/1 with valid data creates a docente" do
      valid_attrs = %{correo: "some correo", edad: "some edad", especializacion: "some especializacion", nombres: "some nombres", telefono: "some telefono"}

      assert {:ok, %Docente{} = docente} = Docentes.create_docente(valid_attrs)
      assert docente.correo == "some correo"
      assert docente.edad == "some edad"
      assert docente.especializacion == "some especializacion"
      assert docente.nombres == "some nombres"
      assert docente.telefono == "some telefono"
    end

    test "create_docente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Docentes.create_docente(@invalid_attrs)
    end

    test "update_docente/2 with valid data updates the docente" do
      docente = docente_fixture()
      update_attrs = %{correo: "some updated correo", edad: "some updated edad", especializacion: "some updated especializacion", nombres: "some updated nombres", telefono: "some updated telefono"}

      assert {:ok, %Docente{} = docente} = Docentes.update_docente(docente, update_attrs)
      assert docente.correo == "some updated correo"
      assert docente.edad == "some updated edad"
      assert docente.especializacion == "some updated especializacion"
      assert docente.nombres == "some updated nombres"
      assert docente.telefono == "some updated telefono"
    end

    test "update_docente/2 with invalid data returns error changeset" do
      docente = docente_fixture()
      assert {:error, %Ecto.Changeset{}} = Docentes.update_docente(docente, @invalid_attrs)
      assert docente == Docentes.get_docente!(docente.id)
    end

    test "delete_docente/1 deletes the docente" do
      docente = docente_fixture()
      assert {:ok, %Docente{}} = Docentes.delete_docente(docente)
      assert_raise Ecto.NoResultsError, fn -> Docentes.get_docente!(docente.id) end
    end

    test "change_docente/1 returns a docente changeset" do
      docente = docente_fixture()
      assert %Ecto.Changeset{} = Docentes.change_docente(docente)
    end
  end
end
