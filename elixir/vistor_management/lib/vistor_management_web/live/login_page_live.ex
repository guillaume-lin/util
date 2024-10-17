defmodule VistorManagementWeb.LoginPageLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  use Phoenix.LiveView
  #use VistorManagementWeb, :live_view

  def render(assigns) do
    ~H"""
    Current temperature: <%= @temperature %>°F
    <button phx-click="inc_temperature">+</button>
    """
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    IO.puts("mount")
    
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    IO.puts("event got")
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end