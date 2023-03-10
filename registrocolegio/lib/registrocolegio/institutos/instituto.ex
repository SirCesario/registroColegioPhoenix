defmodule Registrocolegio.Institutos.Instituto do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "institutos" do
    field :ciudad, :string
    field :direccion, :string
    field :nombre, :string
    field :telefono, :string
    has_many :docentes, Registrocolegio.Docentes.Docente


    timestamps()
  end

  @doc false
  def changeset(instituto, attrs) do
    instituto
    |> cast(attrs, [:nombre, :direccion, :ciudad, :telefono])
    |> validate_required([:nombre, :direccion, :ciudad, :telefono])

  end
end
