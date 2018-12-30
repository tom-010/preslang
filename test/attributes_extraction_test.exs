defmodule AttributesExtractionTest do
  use ExUnit.Case

  test "no attributes given, empty list" do
    assert Preslang.extract_attributes("type without attributes") == []
  end

  test "single attribue" do
    assert Preslang.extract_attributes("a(b)") == ["b"]
  end

  test "two attribues" do
    assert Preslang.extract_attributes("a(b,c)") == ["b", "c"]
  end

  test "multiple attribues with whitspaces" do
    assert Preslang.extract_attributes("a(b ,c, d  ,  e)") == ["b", "c", "d", "e"]
  end

  test "attributes are formatted like a type" do
    assert Preslang.extract_attributes("a(Bb, c C, D   d)") == ["bb", "c-c", "d-d"]
  end
end
