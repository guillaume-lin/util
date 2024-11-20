#
#  show ticket detail
#
#
defmodule VistorManagementWeb.TicketDetailPageLive do
  # In Phoenix v1.6+ apps, the line is typically: use MyAppWeb, :live_view
  #use Phoenix.LiveView
  use VistorManagementWeb, :live_view
  alias VistorManagement.Visit.Ticket

  #
  # load ticket detail
  #
  # if ticket_id exists, load the desired ticket
  # else show a blank ticket for user to create
  # check action for the detail {:create, :view, :approve}
  #
  def mount(params, _session, socket) do
    IO.puts("mount ticket detail")
    IO.inspect(params)
    IO.inspect(socket)
    live_action = socket.assigns[:live_action]
    IO.inspect(live_action)
    newSocket = 
    case live_action do
      :create ->
           create_ticket(params,socket)
      :approve ->
           approve_ticket(params,socket)
      _ ->
          # view ticket
          view_ticket(params,socket)
    end
    IO.puts("mount done")
    IO.inspect(newSocket)
    {:ok, newSocket}
  end


  #create a ticket
  defp create_ticket(params, socket) do
    IO.puts("prepare for create ticket")
    
    _ticket_struct = %{
      uid: socket.assigns.current_user.id,
      name: "xxxx",
      phone: "12347578910",
      visit_reason: "visit for sales",
      visit_start_date: Date.utc_today(),
      visit_end_date: Date.utc_today(),

    }
    form =
    Ticket
    |> AshPhoenix.Form.for_create(:create, forms: [auto?: true])
    |> to_form()
    #VistorManagement.Visit.apply_new_ticket(ticket_struct)
    

    socket = assign(socket,:form, form)
    IO.inspect(socket)
    socket
  end

  # show a ticket for user to approve
  defp approve_ticket(_params,socket) do
    socket
  end
  # show a ticket
  defp view_ticket(params, socket) do
    ticket_id = params["ticket_id"]
    ticket = VistorManagement.Visit.get_one_ticket(ticket_id)

    #convert to form
    form = to_form(ticket)
    #
    #socket = assign(socket,:form, form)
    socket
  end



  on_mount {VistorManagementWeb.LiveUserAuth, :live_user_required}

  # def render() do
  # end


  def handle_event("validate",params,socket) do
    IO.puts("validate")
    IO.inspect(params)
    {:noreply,socket}
  end

  #
  #  verify user input and save a new ticket
  #  after save, rediect to ticket list
  #
  def handle_event("create_ticket",params,socket) do
    IO.puts("create_ticket")
    IO.inspect(params)
    IO.inspect(socket)
    ticket = %{name: "new created", phone: "13799780035"}
    ticket = VistorManagement.Visit.apply_new_ticket(ticket)
    put_flash(socket,:info,"ticket created")
    to = unverified_path(socket,VistorManagementWeb.Router,"/ticket/list")
    {:noreply, push_redirect(socket, to: to)}
  end

  #
  #  approve ticket
  #  after approve,redirect to ticket list
  #
  def handle_event("approve_ticket",params,socket) do
    IO.puts("approve_ticket")
    IO.inspect(params)
    {:noreplay, push_redirect(socket, to: "/ticket/list" ) }
  end
end
