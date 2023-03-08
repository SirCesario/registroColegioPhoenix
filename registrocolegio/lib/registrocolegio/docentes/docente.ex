defmodule Registrocolegio.Docentes.Docente do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "docentes" do
    field :correo, :string
    field :edad, :string
    field :especializacion, :string
    field :nombres, :string
    field :telefono, :string
    belongs_to :instituto, Registrocolegio.Institutos.Instituto
    has_many :materias, Registrocolegio.Materias.Materia


    timestamps()
  end

  @doc false
  def changeset(docente, attrs) do
    docente
    |> cast(attrs, [:nombres, :edad, :correo, :telefono, :especializacion, :instituto_id])
    |> validate_required([:nombres, :edad, :correo, :telefono, :especializacion])
  end
end
