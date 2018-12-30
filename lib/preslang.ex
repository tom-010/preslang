defmodule Preslang do
  def parse(nil) do
    []
  end

  def parse(code) do
    code
    |> String.split("\n>")
    |> Enum.filter(&(String.length(&1) > 0))
  end
end
