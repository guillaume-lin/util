#
# visit domain / context 
#
defmodule VistorManagement.Visit do
  use Ash.Domain

  resources do
    resource VistorManagement.Visit.Ticket
  end
end
