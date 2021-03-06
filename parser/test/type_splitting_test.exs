defmodule TypeSplittingTest do
  use ExUnit.Case

  test "type splitting with empty string, resulting array is not extended" do
    assertPartsCount("", 1)
  end

  test "type given: the first element is the type, the second the rest" do
    assert PreslangParser.split_type("type:content") == ["type", "content"]
  end

  test "two : given, it is not splitted by second" do
    assert PreslangParser.split_type("type:content1:content2") == ["type", "content1:content2"]
  end

  test "nothing" do
    assert PreslangParser.split_type(">Slide(important): [List](http://www.google.com)") == [
             ">Slide(important)",
             " [List](http://www.google.com)"
           ]
  end

  defp assertPartsCount(slide, expected) do
    assert Enum.count(PreslangParser.split_type(slide)) == expected
  end
end
