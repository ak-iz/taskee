defmodule Taskee.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      TaskeeWeb.Telemetry,
      # Start the Ecto repository
      Taskee.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Taskee.PubSub},
      # Start Finch
      {Finch, name: Taskee.Finch},
      # Start the Endpoint (http/https)
      TaskeeWeb.Endpoint
      # Start a worker by calling: Taskee.Worker.start_link(arg)
      # {Taskee.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Taskee.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TaskeeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
