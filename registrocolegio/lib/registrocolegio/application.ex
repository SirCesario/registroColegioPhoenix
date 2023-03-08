defmodule Registrocolegio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Registrocolegio.Repo,
      # Start the Telemetry supervisor
      RegistrocolegioWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Registrocolegio.PubSub},
      # Start the Endpoint (http/https)
      RegistrocolegioWeb.Endpoint
      # Start a worker by calling: Registrocolegio.Worker.start_link(arg)
      # {Registrocolegio.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Registrocolegio.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RegistrocolegioWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
