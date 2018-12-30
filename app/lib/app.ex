defmodule App do
  def main(args \\ []) do
    [preslang_file, template] = args
    Impress.create(preslang_file, template)
  end
end
