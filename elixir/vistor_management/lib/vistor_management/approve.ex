#
#  actions for approver
#
defmodule VistorManagement.Approve do
    import VistorManagementWeb.Gettext

    def approve(ticketId) do
        gettext("ticket approved")
        IO.puts("ticket ${ticketId} approved")
    end
end