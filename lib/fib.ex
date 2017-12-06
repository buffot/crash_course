defmodule Fib do
  defmodule Naive do
    @moduledoc """
    Documentation for Fib.
    """
    def calc(0), do: 0
    def calc(1), do: 1
    def calc(n) do
      calc(n - 1) + calc(n - 2)
    end
  end

  defmodule Optimized do
    def calc(n), do: calc(n, 1, 0)
    defp calc(0, _, result), do: result
    defp calc(n, next, result), do: calc(n - 1, next + result, next)
  end
end
