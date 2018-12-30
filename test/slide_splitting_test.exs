defmodule SlideSplittingSplit do
  use ExUnit.Case

  test "empty string is no slide" do
    assert Preslang.parse("") == []
  end

  test "nil is no slide" do
    assert Preslang.parse(nil) == []
  end

  test "> on first line is one slide" do
    assertCount(">content", 1)
  end

  test "two > in two lines are two slides" do
    assertCount(">content1\n>content2", 2)
  end

  test "> is not in the first column: Not recognizes as slide" do
    assertCount(">content1\n >content2", 1)
  end

  test "> in the content does not lead to extra slide" do
    assertCount(">content<>t\n>conten>t2<", 2)
  end

  test "real-world example" do
    code = """
    >Chapter: This is <i>the</i> title of the Chapter

    >Notes: Some notes to the prev chapter 
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

    assertCount(code, 5)
  end

  test "> in first line" do
    assertCount(">a:b", 1)
    assertCount(">a:b\n>c:d", 2)
    assertCount(">a:b\n>c:d\n>e:f", 3)
  end

  defp assertCount(code, expected) do
    assert Enum.count(Preslang.parse(code)) == expected
  end
end
