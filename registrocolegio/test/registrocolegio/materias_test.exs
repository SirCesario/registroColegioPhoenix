defmodule Registrocolegio.MateriasTest do
  use Registrocolegio.DataCase

  alias Registrocolegio.Materias

  describe "materias" do
    alias Registrocolegio.Materias.Materia

    import Registrocolegio.MateriasFixtures

    @invalid_attrs %{nombre: nil, numero_creditos: nil}

    test "list_materias/0 returns all materias" do
      materia = materia_fixture()
      assert Materias.list_materias() == [materia]
    end

    test "get_materia!/1 returns the materia with given id" do
      materia = materia_fixture()
      assert Materias.get_materia!(materia.id) == materia
    end

    test "create_materia/1 with valid data creates a materia" do
      valid_attrs = %{nombre: "some nombre", numero_creditos: "some numero_creditos"}

      assert {:ok, %Materia{} = materia} = Materias.create_materia(valid_attrs)
      assert materia.nombre == "some nombre"
      assert materia.numero_creditos == "some numero_creditos"
    end

    test "create_materia/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Materias.create_materia(@invalid_attrs)
    end

    test "update_materia/2 with valid data updates the materia" do
      materia = materia_fixture()
      update_attrs = %{nombre: "some updated nombre", numero_creditos: "some updated numero_creditos"}

      assert {:ok, %Materia{} = materia} = Materias.update_materia(materia, update_attrs)
      assert materia.nombre == "some updated nombre"
      assert materia.numero_creditos == "some updated numero_creditos"
    end

    test "update_materia/2 with invalid data returns error changeset" do
      materia = materia_fixture()
      assert {:error, %Ecto.Changeset{}} = Materias.update_materia(materia, @invalid_attrs)
      assert materia == Materias.get_materia!(materia.id)
    end

    test "delete_materia/1 deletes the materia" do
      materia = materia_fixture()
      assert {:ok, %Materia{}} = Materias.delete_materia(materia)
      assert_raise Ecto.NoResultsError, fn -> Materias.get_materia!(materia.id) end
    end

    test "change_materia/1 returns a materia changeset" do
      materia = materia_fixture()
      assert %Ecto.Changeset{} = Materias.change_materia(materia)
    end
  end
end
