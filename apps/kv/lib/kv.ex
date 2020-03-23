defmodule KV do
  use Application

  @impl true
  def start(_type, _args) do
    # Although we dont use the supervisor name directly,
    # it can be useful when debugging or introspecting the system

    # This starts the supervision tree.
    KV.Supervisor.start_link(name: KV.Supervisor)
  end
end
