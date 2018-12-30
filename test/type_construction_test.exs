defmodule TypeConstructionTest do
  use ExUnit.Case

  test "slide datastructure is constructed correctly" do
    assert Preslang.parse("\n>type:content") == [
             %{type: "type", content: "content", attributes: []}
           ]
  end

  test "no content in input, input is set to empty string" do
    assert Preslang.parse("\n>type") == [%{type: "type", content: "", attributes: []}]
  end

  test "handles whitespaces between type and content" do
    assert Preslang.parse(">type:content") == [
             %{type: "type", content: "content", attributes: []}
           ]

    assert Preslang.parse(">type :content") == [
             %{type: "type", content: "content", attributes: []}
           ]

    assert Preslang.parse(">type: content") == [
             %{type: "type", content: "content", attributes: []}
           ]

    assert Preslang.parse(">type : content") == [
             %{type: "type", content: "content", attributes: []}
           ]

    assert Preslang.parse(">type   :      content") == [
             %{type: "type", content: "content", attributes: []}
           ]

    assert Preslang.parse(">type:  \n content") == [
             %{type: "type", content: "\n content", attributes: []}
           ]

    assert Preslang.parse(">type: \t content") == [
             %{type: "type", content: "\t content", attributes: []}
           ]

    assert Preslang.parse(">type: content    ") == [
             %{type: "type", content: "content    ", attributes: []}
           ]
  end

  test "attributes are set" do
    assert Preslang.parse(">type(a,b,c):content") == [
             %{type: "type", content: "content", attributes: ["a", "b", "c"]}
           ]
  end
end
