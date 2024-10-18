#
#  actions for approver
#
defmodule VistorManagement.Approve do
  import VistorManagementWeb.Gettext

  def approve(ticketId) do
    msg = gettext("ticket {ticket} approved")

    ticket =
      VistorManagement.Visit.Ticket
      |> Ash.Changeset.for_create(:create, %{name: "n", phone: "p"})
      |> Ash.create!()

    IO.puts("ticket approved")
  end
end
