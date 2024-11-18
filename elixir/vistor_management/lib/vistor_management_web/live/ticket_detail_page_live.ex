#
#  show ticket detail
#
#
defmodule VistorManagementWeb.TicketDetailPageLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  #use Phoenix.LiveView
  use VistorManagementWeb, :live_view

  #
  # load ticket detail
  #
  # if ticket_id exists, load the desired ticket
  # else show a blank ticket for user to create
  #
  def mount(params, _session, socket) do
    IO.puts("mount ticket detail")
    IO.inspect(params)
    # load data from database
    ticket_id = params["ticket_id"]
    ticket  = VistorManagement.Visit.get_one_ticket(ticket_id)
    form = to_form(ticket)
    socket = socket |> assign(:date, "2004")
      |>assign(:form, form)
    IO.inspect(socket)
    {:ok, socket}
  end

  on_mount {VistorManagementWeb.LiveUserAuth, :live_user_required}

  # def render() do
  # end


  def handle_event("validate",params,socket) do
    IO.puts("validate")
    IO.inspect(params)
    {:noreply,socket}
  end

  def handle_event("create_ticket",params,socket) do
    IO.puts("create_ticket")
    IO.inspect(params)
    ticket = %{"name": "new created","phone": "13799780035"}
    ticket = VistorManagement.Visit.apply_new_ticket(ticket)
    put_flash(socket,:info,"ticket created")
    to = unverified_path(socket,VistorManagementWeb.Router,"/ticket/detail", ticket_id: ticket.id)
    {:noreply, socket}
  end
  def handle_event("approve_ticket",params,socket) do
    IO.puts("approve_ticket")
    IO.inspect(params)
    {:noreplay, push_redirect(socket, to: "/ticket/list" ) }
  end
end
