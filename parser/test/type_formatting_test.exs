defmodule TypeFormattingTest do
  use ExUnit.Case

  test "type gets trimmed" do
    assert PreslangParser.format_type(" \na  ") == "a"
    assert PreslangParser.format_type("a   \n") == "a"
  end

  test "uppercase letters are converted to lowercase" do
    assert PreslangParser.format_type("AbC") == "abc"
  end

  test "whitespaces are converted to minus" do
    assert PreslangParser.format_type(" a b c ") == "a-b-c"
  end

  test "multiple following whitespaces are removed" do
    assert PreslangParser.format_type("a   b") == "a-b"
  end

  test "attributes are removed from the type" do
    assert PreslangParser.format_type("a(a,b)") == "a"
  end

  test "integration examples" do
    assert PreslangParser.format_type("Slide 1") == "slide-1"
    assert PreslangParser.format_type(" ABC      ") == "abc"

    assert PreslangParser.format_type("THiS    Is   A normal   Sentence        ") ==
             "this-is-a-normal-sentence"
  end

  test "spaces between name and attributes" do
    assert PreslangParser.format_type("type ()") == "type"
  end
end
