defmodule Signal.Button do
  defstruct []
  # use GenServer

  # def start_link(name) when is_binary(name), do:
  #   GenServer.start_link(__MODULE__, name, name: Signal.Registry.via_tuple(name))

  # def press(pid, item) do
  #   GenServer.cast(pid, {:press, item})
  # end

  # def state(pid) do
  #   GenServer.call(pid, :state)
  # end

  # def init(name) do
  #   {:ok, new_button(name)}
  # end

  # defp new_button(name) do
  #   %{name: name, events: [], started_os_time: System.os_time(), started_monotonic_time: System.monotonic_time()}
  # end

  # def handle_info(:timeout, state) do
  #   {:stop, {:shutdown, :timeout}, state}
  # end

  # def handle_cast({:press, item}, state) do
  #   {:noreply, [item | state] }
  # end

  # def handle_call(:state, _from, state) do
  #   {:reply, state, state}
  # end


end
