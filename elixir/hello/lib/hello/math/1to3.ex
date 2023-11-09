defmodule One2Three do
  #
  #  add
  #  origin is xxx ,  tens  a as c, units b as d, result is yyy
  #  find the origin xxx
  #
  def generate_add(a,b,c,d,yyy) do
    m = yyy - (c*10+d)
    xxx = m + (a*10+b)
  end

  #
  # subtract
  #
  #
  def generate_sub(a,b,c,d,yyy) do
    m = yyy + (c*10+d)
    xxx = m - (a*10+b)
  end

  def generate_a_sub() do
    a = Enum.random(1..9)
    b = Enum.random(0..9)
    c = Enum.random(1..9)
    d = Enum.random(0..9)
    yyy = Enum.random(100..999)
    {a,b,c,d,yyy,generate_sub(a,b,c,d,yyy)}
  end
  def generate_a_add() do
    a = Enum.random(1..9)
    b = Enum.random(0..9)
    c = Enum.random(1..9)
    d = Enum.random(0..9)
    yyy = Enum.random(100..999)
    {a,b,c,d,yyy,generate_add(a,b,c,d,yyy)}
  end

end
