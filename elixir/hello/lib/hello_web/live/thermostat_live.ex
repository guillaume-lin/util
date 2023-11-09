defmodule HelloWeb.ThermostatLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  #use Phoenix.LiveView
  use HelloWeb, :live_view

  def render(assigns) do
    IO.puts("render")

    ~H"""
    <div>start here</div>
    Current temperature is: <%= @temperature %>°F
    <button phx-click="inc_temperature">+</button>
    <div>haha</div>
    <button phx-click="dec_temperature">-</button>
    <div>end here</div>
    """
  end

  def mount(_params, _session, socket) do
    IO.puts("mount")
    a = Hello.Hanoi.hanoi()
    IO.puts(a)
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    IO.puts("handle_event a ")
    {:ok, b} = Hello.Hanoi.lua()
    IO.puts(b)

    IO.puts("handle_event b")
    p = socket
    Enum.map(Map.keys(p), fn x -> IO.puts(x) end)

    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
  def handle_event("dec_temperature",_params,socket) do
    {:noreply, update(socket, :temperature, &(&1 - 1))}
  end
end
