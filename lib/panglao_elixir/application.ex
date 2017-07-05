defmodule PanglaoElixir.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Starts a worker by calling: PanglaoElixir.Worker.start_link(arg1, arg2, arg3)
      # worker(PanglaoElixir.Worker, [arg1, arg2, arg3]),
      supervisor(ConCache, [
        [ttl_check: :timer.seconds(60), ttl: :timer.seconds(60 * 60 * 24 * 20)],
        [name: :panglao_elixir]], id: :panglao_elixir_cache),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PanglaoElixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
