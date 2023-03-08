defmodule Registrocolegio.Repo.Migrations.CreateInstitutos do
  use Ecto.Migration

  def change do
    create table(:institutos, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :nombre, :string
      add :direccion, :string
      add :ciudad, :string
      add :telefono, :string

      timestamps()
    end

    create unique_index(:institutos, [:nombre])
    
  end
end
