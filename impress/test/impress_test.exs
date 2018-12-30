defmodule ImpressTest do
  use ExUnit.Case
  doctest Impress

  test "main" do
    File.write!(
      "out/presentation.html",
      Impress.create("example.pres", "templates/impress.html.eex")
    )
  end
end
