defmodule MasterProxy do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    port = System.get_env("PORT") |> String.to_integer
    cowboy = Plug.Adapters.Cowboy.child_spec(:http, MasterProxy.Plug, [], [port: port])

    children = [
      cowboy
    ]

    opts = [strategy: :one_for_one, name: MasterProxy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
