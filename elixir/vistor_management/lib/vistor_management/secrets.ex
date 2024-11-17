defmodule VistorManagement.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        VistorManagement.Accounts.User,
        _opts
      ) do
    Application.fetch_env(:vistor_management, :token_signing_secret)
  end
end