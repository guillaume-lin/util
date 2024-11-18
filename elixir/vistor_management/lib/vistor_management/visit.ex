#
# visit domain / context
#
defmodule VistorManagement.Visit do
  use Ash.Domain
  require Ash.Query

  resources do
    resource VistorManagement.Visit.Ticket
  end

  #
  # list my active tickets (not expired,applied or approved ) when I am login
  #
  def list_my_active_tickets() do
    IO.puts("hi from ash domain")
    tickets = VistorManagement.Visit.Ticket
    |> Ash.Query.filter(status != :closed)
    |> Ash.read!()

  end

  #
  # list ticket by id
  #
  def get_one_ticket(ticket_id) do
    IO.puts("ash domain get_one_ticket")
    IO.puts(ticket_id)
    ticket = VistorManagement.Visit.Ticket
      |> Ash.Query.filter(id == ticket_id)
      |> Ash.read!()
  end

  def apply_new_ticket(ticket) do
    IO.puts("apply new ticket")
    ticket = VistorManagement.Visit.Ticket
    |> Ash.Changeset.for_create(:create, ticket)
    |> Ash.create!()
    ticket
  end

  @doc """
    cancel visit
    applicant and approver can do this
  """
  def close_ticket(ticket) do
    IO.puts("close ticket #{ticket.id}: #{ticket.status}")
    ticket
    |> Ash.Changeset.for_update(:close,%{})
    |> Ash.update!()
  end


  @doc """
    approve a ticket
    user need to be have an approve role
   """
  def approve_ticket(ticket) do
    IO.puts("approve_ticket #{ticket.id}")
    ticket
    |> Ash.Changeset.for_update(:approve)
    |> Ash.update!()
  end

end
