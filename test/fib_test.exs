defmodule FibTest do
  use ExUnit.Case
  doctest Fib

  test "Fib.Optimized #calc" do
    assert Fib.Optimized.calc(0) == 0
    assert Fib.Optimized.calc(4) == 3
    assert Fib.Optimized.calc(5) == 5
  end

  test "Fib.Naive #calc" do
    assert Fib.Optimized.calc(0) == 0
    assert Fib.Optimized.calc(4) == 3
    assert Fib.Optimized.calc(5) == 5
  end
end
