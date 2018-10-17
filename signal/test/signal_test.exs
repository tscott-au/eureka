


defmodule FakeSubscriber do
  use GenServer
  def start_link, do: GenServer.start_link(__MODULE__, [])
  def init(state), do: {:ok, state}

  def state(pid),  do:  GenServer.call(pid, :state)
  def subscribe(server, signal, event), do: GenServer.call(server, {:subscribe, signal, event})

  def handle_call(:state, _from, state), do:  {:reply, state, state}

  def handle_call({:subscribe, signal, event}, _from, state) do
      result = Signal.subscribe(signal, event)
      {:reply, result, state}
  end

  def handle_info({:event, _info} = event, state) do
    {:noreply, state ++ [event]}
  end
end

defmodule SignalTest do
  use ExUnit.Case, async: true
  doctest Signal

  test "subscribe for unknown event" do
    h = newSignalFixture(:error1)
    producer = "producer"
    result =  Signal.subscribe(h, producer)
    assert result == {:error, "unknown event", "producer"}
  end

  test "subscribe for stop event" do
    h = newSignalFixture(:subscribe1)
    event = "stop_event"
    assert {:ok} == Signal.subscribe(h, event)
    assert_received {:event, event}
  end

  test "diff process subscribe for stop event" do
    h = newSignalFixture(:subscribe3)

    {:ok, s} = FakeSubscriber.start_link()
    event = "stop_event"
    assert {:ok} == FakeSubscriber.subscribe(s, h, event)

    result = FakeSubscriber.state(s)

    # consumer = "consumer"
    # result =  Signal.subscribe(h, producer, consumer)
    assert  result == [event: "stop_event"]
  end



  defp newSignalFixture(name) do
    fb = %FakeButton{}
    dependencies = %{stop_button: fb}
    {:ok, handler} = Signal.start_link({name, dependencies})
    handler
  end
end
