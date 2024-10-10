defmodule LiveviewAutocomplete.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LiveviewAutocompleteWeb.Telemetry,
      LiveviewAutocomplete.Repo,
      {DNSCluster, query: Application.get_env(:liveview_autocomplete, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LiveviewAutocomplete.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LiveviewAutocomplete.Finch},
      # Start a worker by calling: LiveviewAutocomplete.Worker.start_link(arg)
      # {LiveviewAutocomplete.Worker, arg},
      # Start to serve requests, typically the last entry
      LiveviewAutocompleteWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveviewAutocomplete.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveviewAutocompleteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
