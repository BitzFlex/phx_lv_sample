defmodule PhxLvSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhxLvSampleWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phx_lv_sample, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhxLvSample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhxLvSample.Finch},
      # Start a worker by calling: PhxLvSample.Worker.start_link(arg)
      # {PhxLvSample.Worker, arg},
      # Start to serve requests, typically the last entry
      PhxLvSampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxLvSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxLvSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
