defmodule Hello.Lua do

  defp init_functions(st) do
    random_int = fn [from, to],state ->
      {[Enum.random(from..to)],state}
    end
    st1 = :luerl.set_table([:random_int],random_int,st)

    random_text = fn [strArray],state ->
      {[1],state}
    end
    st2 = :luerl.set_table([:random_text], random_text,st1)
  end
  #
  # create a context and eval the script
  # return  {:ok, result}
  # result is a list
  #
  def run_script(script) do
    st0 = :luerl.init()
    st1 = init_functions(st0)
    :luerl.eval(script,st1)
  end

  #
  #  call a chunk with argument
  #  chunk reference args as ... , for example:
  #  local arg1, arg2 = ... ;
  #  return arg1 + arg2;
  #
  def run_chunk_args(script, args) do
    st0 = :luerl.init()
    st1 = init_functions(st0)
    {:ok, chunk, st2} = :luerl.load(script,st1)
    {result,st3} = :luerl.call_chunk(chunk,args,st2)
    {:ok, result}
  end
end
