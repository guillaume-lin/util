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

    form = to_form(%{"action" => "create"})
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
    put_flash(socket, :info, "tickert created")
    {:ok, socket}
  end
  def handle_event("approve_ticket",params,socket) do
    IO.puts("approve_ticket")
    IO.inspect(params)
    {:noreplay, push_redirect(socket, to: "/ticket/list" ) }
  end
end
