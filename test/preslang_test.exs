defmodule PreslangTest do
  use ExUnit.Case
  doctest Preslang

  test "greets the world" do
    assert Preslang.hello() == :world
  end
end
