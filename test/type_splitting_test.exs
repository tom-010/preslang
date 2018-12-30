defmodule TypeSplittingTest do
  use ExUnit.Case

  test "type splitting with empty string, resulting array is not extended" do
    assertPartsCount("", 1)
  end

  test "type given: the first element is the type, the second the rest" do
    assert Preslang.split_type("type:content") == ["type", "content"]
  end

  test "two : given, it is not splitted by second" do
    assert Preslang.split_type("type:content1:content2") == ["type", "content1", "content2"]
  end

  defp assertPartsCount(slide, expected) do
    assert Enum.count(Preslang.split_type(slide)) == expected
  end
end
