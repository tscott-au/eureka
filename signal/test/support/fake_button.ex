defmodule FakeButton do
  defstruct []
end

defimpl Publisher, for: FakeButton do
  def subscribe(_deps, event, {consumer, _ref}) do
    Process.send(consumer, {:event, event}, [])
    {:ok}
  end
end
