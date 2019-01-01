defmodule MarkdownTest do
  use ExUnit.Case

  test "slide-content is converted from Markdown To Html" do
    slide =
      Impress.parse_string(">slide: # Header")
      |> Enum.at(0)

    assert String.trim(slide.content) == "<h1>Header</h1>"
  end

  test "hanldes unorderd list" do
    content = """
    > slide: 
    * one
    * two 
    * three
    """

    expected = """
    <ul>
        <li>one</li>
        <li>two</li>
        <li>three</li>
    </ul>
    """

    slide =
      Impress.parse_string(content)
      |> Enum.at(0)

    result = slide.content

    expected = expected |> String.replace(" ", "") |> String.replace("\n", "")
    result = result |> String.replace(" ", "") |> String.replace("\n", "")

    assert expected == result
  end
end
