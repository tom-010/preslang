defmodule Impress do
  def hello do
    EEx.eval_file("templates/impress.html.eex", foo: "Tom")
  end
end
