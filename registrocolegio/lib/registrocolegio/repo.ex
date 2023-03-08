defmodule Registrocolegio.Repo do
  use Ecto.Repo,
    otp_app: :registrocolegio,
    adapter: Ecto.Adapters.Postgres
end
