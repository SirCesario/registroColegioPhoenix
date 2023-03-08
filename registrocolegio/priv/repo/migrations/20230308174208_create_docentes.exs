defmodule Registrocolegio.Repo.Migrations.CreateDocentes do
  use Ecto.Migration

  def change do
    create table(:docentes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombres, :string
      add :edad, :string
      add :correo, :string
      add :telefono, :string
      add :especializacion, :string
      add :instituto_id, references(:institutos, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:docentes, [:instituto_id])
  end
end
