defmodule Registrocolegio.Materias.Materia do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "materias" do
    field :nombre, :string
    field :numero_creditos, :string
    belongs_to :docente, Registrocolegio.Docentes.Docente

    timestamps()
  end

  @doc false
  def changeset(materia, attrs) do
    materia
    |> cast(attrs, [:nombre, :numero_creditos, :docente_id])
    |> validate_required([:nombre, :numero_creditos, :docente_id])
    |> foreign_key_constraint(:docente_id) #Restriccion para que exista un Docuente en la tabla.
  end
end
