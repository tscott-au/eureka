defmodule Signal do
  use GenServer

  @moduledoc """
  Documentation for Signal.
  """

  def start_link({name, deps}),  do:
    GenServer.start_link(__MODULE__, deps, [name: name])

  def init(state), do: {:ok, state}

  def subscribe(this, "stop_event" = event), do:
    GenServer.call(this, {:subscribe, event,  :stop_button})

  def subscribe(_this, event), do: {:error, "unknown event", event}

  def handle_call({:subscribe, event, target}, from, deps) do
    result = deps[target] |> Publisher.subscribe(event, from)
    {:reply, result, deps}
  end

end

defprotocol  Publisher do
  def subscribe(server, event, consumer)
end
