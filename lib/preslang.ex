defmodule Preslang do
  def parse(nil) do
    []
  end

  def parse("") do
    []
  end

  def parse(code) do
    code
    |> augment_leading_new_line
    |> String.split("\n>")
    |> Enum.filter(&(String.length(&1) > 0))
    |> Enum.map(&split_type/1)
    |> Enum.map(&construct_type/1)
  end

  def augment_leading_new_line(code) do
    if(String.starts_with?(code, "\n")) do
      code
    else
      "\n#{code}"
    end
  end

  def split_type(slide) do
    String.split(slide, ":")
  end

  def construct_type(type_as_arr) do
    %{
      type: format_type(Enum.at(type_as_arr, 0)),
      content: format_content(Enum.at(type_as_arr, 1)),
      attributes: extract_attributes(Enum.at(type_as_arr, 0))
    }
  end

  def format_type(type) do
    type
    |> String.trim()
    |> String.downcase()
    |> String.replace("  ", " ")
    |> String.replace(~r/ +/, "-")
    |> String.replace(~r/\(.*\)/, "")
  end

  def format_content(content) do
    content =
      if(content == nil) do
        ""
      else
        content
      end

    String.trim_leading(content, " ")
  end

  def extract_attributes(type) do
    Regex.scan(~r/\(.*\)/, type)
    |> handle_attributes()
  end

  def handle_attributes([[attrs | _] | _]) do
    attrs
    |> String.replace("(", "")
    |> String.replace(")", "")
    |> String.split(",")
    |> Enum.map(&format_type/1)
  end

  def handle_attributes(_) do
    []
  end

  def example() do
    """
    >Chapter(main, title): This is <i>the</i> title of the Chapter

    >Notes(important): Some notes to the prev chapter 
    >Slide: 
      * <b>Point 1</b>
      * Point 2
      * Point 3
    >Slide: One-Liner, with <html></html>
    >Slide: Html-Slide
      <ul>
        <li>One</li>
        <li>Two</li>
    </ul>
    """
  end
end
