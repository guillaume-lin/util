#
#
#
defmodule HelloWeb.HanoiController do
  use HelloWeb, :controller

  def index(conn, params) do
    static_dir = :code.priv_dir(:hello) |> Path.join("static")
    IO.puts(static_dir)

    IO.puts(inspect(params))
    IO.puts(params["tmpl"])

    #
    # result is a list , like [a1,a2,a3,r]
    # a1,a2,a3,
    #
    {:ok,result} = Hello.Lua.run_script(params["formula"])

    # generate 3 text and send to index.html.heex to render
    # page:   [Q1,Q2,Q3,A1], [Q1,Q2,Q3,A2]
    #
    conn
    #|> put_flash(:error, "something error occured.")
    |> clear_flash()
    |> render(:index, args: args, result: result)
  end

  def values(conn, _params) do
    IO.puts("hello values ")
    render(conn, :values)
  end
end
