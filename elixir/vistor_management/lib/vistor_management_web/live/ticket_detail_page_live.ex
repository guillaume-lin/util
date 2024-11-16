#
#  show ticket detail
#
#
defmodule VistorManagementWeb.TicketDetailPageLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  #use Phoenix.LiveView
  use VistorManagementWeb, :live_view

  #load ticket detail 
  def mount(_params, _session, socket) do
    # Let's assume a fixed temperature for now
    temperature = 71
    form = to_form(%{"username" => "haha", "email" => "x@xx", "action" => "approve"})
    socket = socket |> assign(:date, "2004")
      |>assign(:form, form)
    IO.inspect(socket)
    {:ok, assign(socket, :temperature, temperature)}
  end

  on_mount {VistorManagementWeb.LiveUserAuth, :live_user_required}

  # def render() do
  # end  

  def handle_event("inc_temperature", _params, socket) do
    alias VistorManagement.Visit
    IO.puts("event got")
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end

  def handle_event("validate",params,socket) do 
    IO.puts("validate")
    IO.inspect(params)
    {:noreply,socket}
  end

  def handle_event("save",params,socket) do
    IO.puts("save")
    IO.inspect(params)
    {:noreply, socket}
  end
  def handle_event("approve_ticket",params,socket) do
    IO.puts("approve_ticket")
    IO.inspect(params)
    {:noreply, socket}
  end
end
