defmodule KVServer do
  require Logger

  def accept(port) do
    # The options below mean:
    #
    # 1. `:binary` - receives data as binaries (instead of lists)
    # 2. `packet: :line` - receives data line by line
    # 3. `active: false` - blocks on `:gen_tcp.recv/2` until data is available
    # 4. `reuseaddr: true` - allows us to reuse the address if the listener crashes
    #
    {:ok, socket} =
      :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info("Accepting connections on port #{port}")
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    task_to_serve(client)
    loop_acceptor(socket)
  end
  defp spawn_to_serve(client) do
    pid = inspect(spawn_link(KVServer, :serve, [client]))
    IO.puts("serving #{pid}")
  end
  defp task_to_serve(client) do
    {:ok, pid} = Task.Supervisor.start_link()
    task = Task.Supervisor.async(pid,fn -> serve(client) end)
    IO.puts("serving task " <> inspect(task))
  end
  def serve(socket) do
    res = (socket
    |> read_line()
    |> write_line(socket))
    serve(socket)
    IO.puts(res)
  end

  defp read_line(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, data} ->
          data
        _ ->
          IO.puts("will exit " <> inspect(self()))
          Process.exit(self(), :kill)
    end
  end

  defp write_line(line, socket) do
    :gen_tcp.send(socket, line)
  end
end
