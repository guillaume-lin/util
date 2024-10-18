defmodule VistorManagementWeb.LoginPageLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  #use Phoenix.LiveView
  use VistorManagementWeb, :live_view

  def render(assigns) do
    IO.puts("render")
    IO.inspect(assigns)
    IO.inspect(assigns.socket.assigns)
    ~H"""
    Current temperature: <%= @temperature %>°F  <button phx-click="inc_temperature">+</button>
    """
  end

  def mount(_params, _session, socket) do
    # Let's assume a fixed temperature for now
    temperature = 70
    IO.puts("mount")
    socket = assign(socket, :date, "2004")
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    alias VistorManagement.Visit
    alias VistorManagement.Approve
    Approve.approve("1")
    IO.puts("event got")
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
