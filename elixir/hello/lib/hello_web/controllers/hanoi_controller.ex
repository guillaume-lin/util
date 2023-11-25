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
    IO.puts(params["formula"])
    Hello.Hanoi.hanoi(4)
    questions = Enum.map(1..3,fn _ ->
      generate_question(params["tmpl"],params["formula"])
      end )
      # [{question, result}, ...]
  
    conn
    #|> put_flash(:error, "something error occured.")
    |> clear_flash()
    |> render(:index, questions: questions)
  end

  #
  # eval formula and generate a question
  #
  defp generate_question(tmpl,formula) do
    #
    # result is a list , like [a1,a2,a3,r]
    # a1,a2,a3,
    #

    {:ok,result} = Hello.Lua.run_script(formula)
    IO.puts(inspect(result))

    key = [:a,:b,:c,:d,:e,:f,:g,:h]
    ass = Enum.zip(key,result)

    IO.puts(inspect(ass))
    question = EEx.eval_string(tmpl, assigns: ass)

    {question, result}
  end 
  def values(conn, _params) do
    IO.puts("hello values ")
    render(conn, :values)
  end
end
