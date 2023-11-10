#
#
#
defmodule HelloWeb.HanoiController do
  use HelloWeb, :controller

  def index(conn, _params) do
    IO.puts("hello hanoi")
    Hello.Hanoi.hanoi()
    t = One2Three.generate_a_add()
    t2 = One2Three.generate_a_sub()
    IO.puts(inspect(t))
    IO.puts(inspect(t2))
    conn
    #|> put_flash(:error, "something error occured.")
    |> clear_flash()
    |> render(:index, t: t, t2: t2)
  end

  def values(conn, _params) do
    IO.puts("hello values ")
    render(conn, :values)
  end
end
