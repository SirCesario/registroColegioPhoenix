defmodule Registrocolegio.InstitutosTest do
  use Registrocolegio.DataCase

  alias Registrocolegio.Institutos

  describe "institutos" do
    alias Registrocolegio.Institutos.Instituto

    import Registrocolegio.InstitutosFixtures

    @invalid_attrs %{ciudad: nil, direccion: nil, nombre: nil, telefono: nil}

    test "list_institutos/0 returns all institutos" do
      instituto = instituto_fixture()
      assert Institutos.list_institutos() == [instituto]
    end

    test "get_instituto!/1 returns the instituto with given id" do
      instituto = instituto_fixture()
      assert Institutos.get_instituto!(instituto.id) == instituto
    end

    test "create_instituto/1 with valid data creates a instituto" do
      valid_attrs = %{ciudad: "some ciudad", direccion: "some direccion", nombre: "some nombre", telefono: "some telefono"}

      assert {:ok, %Instituto{} = instituto} = Institutos.create_instituto(valid_attrs)
      assert instituto.ciudad == "some ciudad"
      assert instituto.direccion == "some direccion"
      assert instituto.nombre == "some nombre"
      assert instituto.telefono == "some telefono"
    end

    test "create_instituto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Institutos.create_instituto(@invalid_attrs)
    end

    test "update_instituto/2 with valid data updates the instituto" do
      instituto = instituto_fixture()
      update_attrs = %{ciudad: "some updated ciudad", direccion: "some updated direccion", nombre: "some updated nombre", telefono: "some updated telefono"}

      assert {:ok, %Instituto{} = instituto} = Institutos.update_instituto(instituto, update_attrs)
      assert instituto.ciudad == "some updated ciudad"
      assert instituto.direccion == "some updated direccion"
      assert instituto.nombre == "some updated nombre"
      assert instituto.telefono == "some updated telefono"
    end

    test "update_instituto/2 with invalid data returns error changeset" do
      instituto = instituto_fixture()
      assert {:error, %Ecto.Changeset{}} = Institutos.update_instituto(instituto, @invalid_attrs)
      assert instituto == Institutos.get_instituto!(instituto.id)
    end

    test "delete_instituto/1 deletes the instituto" do
      instituto = instituto_fixture()
      assert {:ok, %Instituto{}} = Institutos.delete_instituto(instituto)
      assert_raise Ecto.NoResultsError, fn -> Institutos.get_instituto!(instituto.id) end
    end

    test "change_instituto/1 returns a instituto changeset" do
      instituto = instituto_fixture()
      assert %Ecto.Changeset{} = Institutos.change_instituto(instituto)
    end
  end
end
