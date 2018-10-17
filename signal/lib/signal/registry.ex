defmodule Signal.Registry do
  def via_tuple(name), do: {:via, Registry, {:RegistrySignals, name}}
end


# discovery of processes
# iex(host3@0.0.0.0)4> Registry.keys(:RegistrySignals, :"$initial_call")
# nil
# iex(host3@0.0.0.0)5> Process.get(:"$initial_call")
# {IEx.Evaluator, :init, 4}
# iex(host3@0.0.0.0)6> Process.get(Elixir.Signal.Supervisor)
# nil
# iex(host3@0.0.0.0)7> Process.whereis(Elixir.Signal.Supervisor)
# #PID<0.147.0>
# iex(host3@0.0.0.0)8> p = Process.whereis(Elixir.Signal.Supervisor)
# #PID<0.147.0>
# iex(host3@0.0.0.0)9> Registry.keys(:RegistrySignals, p)
# []
# iex(host3@0.0.0.0)10> Registry.keys(:RegistrySignals, p)
# []
# iex(host3@0.0.0.0)11> Signal.Button.start_link("bbb")
# {:ok, #PID<0.9396.0>}
# iex(host3@0.0.0.0)12> Registry.keys(:RegistrySignals, p)
# []
# iex(host3@0.0.0.0)13> p = Process.whereis(:RegistrySignals)
# #PID<0.148.0>
# iex(host3@0.0.0.0)14> Registry.keys(:RegistrySignals, p)
# []
# iex(host3@0.0.0.0)15> Registry.keys(:RegistrySignals, p)
# []
# iex(host3@0.0.0.0)16> Registry.count(:RegistrySignals)
# 2

### Find button B1 in the registry.
# (elixir) lib/registry.ex:647: Registry.keys/2
# iex(host2@0.0.0.0)5> Registry.keys(:RegistrySignals, "b1")
# ** (FunctionClauseError) no function clause matching in Registry.keys/2

#     The following arguments were given to Registry.keys/2:

#         # 1
#         :RegistrySignals

#         # 2
#         "b1"

#     Attempted function clauses (showing 1 out of 1):

#         def keys(registry, pid) when is_atom(registry) and is_pid(pid)

#     (elixir) lib/registry.ex:647: Registry.keys/2
# iex(host2@0.0.0.0)5> Registry.lookup(:RegistrySignals, Signal.Registry.via_tuple("b1"))
# []
# iex(host2@0.0.0.0)6> Registry.lookup(:RegistrySignals, "b1")
# [{#PID<0.159.0>, nil}]


# remote task execution return results to caller.
# Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
# iex(host4@0.0.0.0)1> Node.connect(:"host2@0.0.0.0")
# true
# iex(host4@0.0.0.0)2>  t = Task.Supervisor.async({MyApp.DistSupervisor, :"host2@0.0.0.0"}, Registry, :lookup, [:RegistryS
# ignals, "b1"])
# %Task{
#   owner: #PID<0.107.0>,
#   pid: #PID<10466.172.0>,
#   ref: #Reference<0.1225426505.55050247.48615>
# }
# iex(host4@0.0.0.0)3>  r = Task.await(t)
# [{#PID<10466.159.0>, nil}]
# iex(host4@0.0.0.0)4> [{rb, _e] = r
# ** (SyntaxError) iex:4: unexpected token: ]. The "{" at line 4 is missing terminator "}"

# iex(host4@0.0.0.0)4> [{rb, _e}] = r
# [{#PID<10466.159.0>, nil}]
# iex(host4@0.0.0.0)5> Signal.Button.state(rb)
# ** (UndefinedFunctionError) function Signal.Button.state/1 is undefined (module Signal.Button is not available)
#     Signal.Button.state(#PID<10466.159.0>)
# iex(host4@0.0.0.0)5> c("./lib/signal/button.ex")
# [Signal.Button]
# iex(host4@0.0.0.0)6> Signal.Button.state(rb)
# %{
#   events: [],
#   name: "b1",
#   started_monotonic_time: -576460319240132000,
#   started_os_time: 1538718197421499600
# }
# iex(host4@0.0.0.0)7> Node.
