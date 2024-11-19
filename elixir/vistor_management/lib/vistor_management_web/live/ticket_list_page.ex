#
#  this page list tickets
#  if not login, goto sign in page
#  else show ticket list according by user
#
defmodule VistorManagementWeb.TicketListPage do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  #use Phoenix.LiveView
  use VistorManagementWeb, :live_view

  on_mount {VistorManagementWeb.LiveUserAuth, :live_user_required}

  #def render(assigns) do
  #  ~H""" """
  #end

  def mount(_params, _session, socket) do
    # Let's assume a fixed temperature for now
    socket = assign(socket, page_title: "Ticket List")
    IO.puts("mount")
    alias VistorManagement.Visit
    tickets = Visit.list_my_active_tickets()
    
    socket = socket
    |> assign(:tickets, tickets)
    |> assign(:date, "2004")
    
    IO.inspect(socket)
    {:ok, socket}
  end

  def handle_params(params,uri,socket) do
    IO.puts("ticket list page handle_params")
    IO.inspect(params)
    IO.inspect(uri)
    {:noreply, socket}
  end
  #
  # when apply new
  # create a new ticket and goto detail
  #
  def handle_event("apply_new",params, socket) do
    IO.inspect(params)

    to = unverified_path(socket, VistorManagementWeb.Router,"/ticket/create")

    {:noreply, push_redirect(socket, to: to)}

  end
  def handle_event("goto_detail", params, socket) do
    alias VistorManagement.Visit
    alias VistorManagement.Approve
    IO.puts("goto_detail")
    IO.inspect(params)
    to = unverified_path(socket, VistorManagementWeb.Router,"/ticket/detail", ticket_id: params["ticket-id"])
    {:noreply, push_redirect(socket,to: to)}
  end
  def handle_event(_,_params,socket) do
    IO.puts("don't know how to do")
    {:noreply, socket}
  end

end
