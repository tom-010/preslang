defmodule App do
  def main(args \\ []) do
    [preslang_file, template] = args
    IO.puts(Impress.create(preslang_file, template))
  end
end
