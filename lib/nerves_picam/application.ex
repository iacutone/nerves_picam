defmodule NervesPicam.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Picam.Camera, []),
      Plug.Cowboy.child_spec(scheme: :http, plug: NervesPicam.Router, options: [port: 4001])
    ]

    opts = [strategy: :one_for_one, name: NervesPicam.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # List all child processes to be supervised
  def children(:host) do
    [
      # Children that only run on the host
      # Starts a worker by calling: NervesPicam.Worker.start_link(arg)
      # {NervesPicam.Worker, arg},
    ]
  end

  def children(_target) do
    [
      # Children for all targets except host
      # Starts a worker by calling: NervesPicam.Worker.start_link(arg)
      # {NervesPicam.Worker, arg},
    ]
  end

  def target() do
    Application.get_env(:nerves_rpi3_wifi_picam, :target)
  end
end
