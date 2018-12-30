defmodule Impress do
  def create(preslang_file, template) do
    slides =
      preslang_file
      |> File.read!()
      |> PreslangParser.parse()

    EEx.eval_file(template, slides: slides)
  end
end
