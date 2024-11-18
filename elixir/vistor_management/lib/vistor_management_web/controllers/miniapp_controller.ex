defmodule VistorManagementWeb.MiniappController do
  use VistorManagementWeb, :controller

  #/miniapp/login
  def login(conn, params) do
    IO.puts("app login")
    IO.inspect(params)
    json = VistorManagement.Json.serialize(%{name: "ljx"})
    # send response to client
    send_resp(conn,200,json)
  end

  #/miniapp/ticket/list
  def list_ticket(conn,params) do 
    IO.puts("list ticket")
    IO.inspect(params)
    send_resp(conn,200,"tickets")
  end

  #/miniapp/ticket/create
  def create_ticket() do
  end

  #/miniapp/ticket/view
  def view_ticket() do
  end

  #/miniapp/ticket/approve
  def approve_ticket() do 
  end


end
