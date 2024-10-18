defmodule VistorManagementWeb.PageController do
  use VistorManagementWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    conn
    #|> put_root_layout(html: false)
    |> render(:home)
  end
end
