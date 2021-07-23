defmodule Pots.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Pots.Repo,
      # Start the Telemetry supervisor
      PotsWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Pots.PubSub},
      # Start the Endpoint (http/https)
      PotsWeb.Endpoint
      # Start a worker by calling: Pots.Worker.start_link(arg)
      # {Pots.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Pots.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PotsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
