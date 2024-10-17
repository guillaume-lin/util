#
# visit domain / context 
#
defmodule VistorManagement.Visit do
  use Ash.Domain

  resources do
    resource VistorManagement.Visit.Ticket
  end

  # controller action to ask for visit
   def ask_for_visit(%{name: name, phone: phone} = visitor) do
       IO.puts("create visitor with ${name} ${phone}")
       VistorManagement.Visit.Ticket |> Ash.Changeset.for_create(:create, visitor)
   end  
end
