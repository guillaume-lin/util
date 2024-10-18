defmodule VistorManagement.Accounts do
  use Ash.Domain

  resources do
    resource VistorManagement.Accounts.Token
    resource VistorManagement.Accounts.User
  end
end
