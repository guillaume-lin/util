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
    IO.inspect(tickets)
    socket = socket
    |> assign(:tickets, tickets)
    |> assign(:date, "2004")
    {:ok, socket}
  end

  #
  # when apply new
  # create a new ticket and goto detail
  #
  def handle_event("apply_new",params, socket) do
    IO.inspect(params)
    #to = Routes.live_path(socket, VistorManagementWeb.TicketDetailPage,)
    {:noreply, push_redirect(socket, to: "/ticket/create")}

  end
  def handle_event("goto_detail", _params, socket) do
    alias VistorManagement.Visit
    alias VistorManagement.Approve

    {:noreply, push_redirect(socket,to: "/ticket/detail")}
  end
  def handle_event(_,_params,socket) do
    IO.puts("don't know how to do")
    {:noreply, socket}
  end

end
