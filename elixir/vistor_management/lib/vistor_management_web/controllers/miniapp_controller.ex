defmodule VistorManagementWeb.MiniappController do
  use VistorManagementWeb, :controller

  def login(conn, params) do
    IO.puts("app login")
    json = VistorManagement.Json.serialize(%{name: "ljx"})
    # send response to client
    send_resp(conn,200,json)
  end
end
