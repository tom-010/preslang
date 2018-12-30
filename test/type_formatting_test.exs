defmodule TypeFormattingTest do
  use ExUnit.Case

  test "type gets trimmed" do
    assert Preslang.format_type(" \na  ") == "a"
    assert Preslang.format_type("a   \n") == "a"
  end

  test "uppercase letters are converted to lowercase" do
    assert Preslang.format_type("AbC") == "abc"
  end

  test "whitespaces are converted to minus" do
    assert Preslang.format_type(" a b c ") == "a-b-c"
  end

  test "multiple following whitespaces are removed" do
    assert Preslang.format_type("a   b") == "a-b"
  end

  test "attributes are removed from the type" do
    assert Preslang.format_type("a(a,b)") == "a"
  end

  test "integration examples" do
    assert Preslang.format_type("Slide 1") == "slide-1"
    assert Preslang.format_type(" ABC      ") == "abc"

    assert Preslang.format_type("THiS    Is   A normal   Sentence        ") ==
             "this-is-a-normal-sentence"
  end

  test "spaces between name and attributes" do
    assert Preslang.format_type("type ()") == "type"
  end
end
