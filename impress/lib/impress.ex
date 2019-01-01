defmodule Impress do
  def create(preslang_file, template) do
    preslang_file
    |> File.read!()
    |> parse_string()
    |> insert_into_templat(template)
  end

  def parse_string(preslang_string) do
    preslang_string
    |> PreslangParser.parse()
    |> markdown_to_html()
  end

  def insert_into_templat(slides, template_path) do
    EEx.eval_file(template_path, slides: slides)
  end

  def markdown_to_html(slides) do
    slides |> Enum.map(&slide_to_html/1)
  end

  def slide_to_html(slide) do
    {:ok, html, []} = Earmark.as_html(slide.content)
    %{slide | content: html}
  end
end
