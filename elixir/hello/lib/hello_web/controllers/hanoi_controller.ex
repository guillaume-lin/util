#
#
#
defmodule HelloWeb.HanoiController do
  use HelloWeb, :controller

  def index(conn, _params) do
    IO.puts("hello hanoi")
    Hello.Util.Hanoi.hanoi()
    render(conn, :index)
  end
end
