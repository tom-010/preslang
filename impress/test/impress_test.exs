defmodule ImpressTest do
  use ExUnit.Case
  doctest Impress

  test "greets the world" do
    assert Impress.hello() == :world
  end
end
