defmodule Registrocolegio.Repo.Migrations.CreateMaterias do
  use Ecto.Migration

  def change do
    create table(:materias, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :numero_creditos, :string
      add :docente_id, references(:docentes, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:materias, [:docente_id])
  end
end
