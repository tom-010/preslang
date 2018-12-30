defmodule E2ETests do
  use ExUnit.Case

  # @tag :skip
  test "chapter, notes, slides" do
    code = """
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
        >this is not a type
    > even_this is a   type (some   wired attrs, and-here-it is): with < > some >>    content
    """

    assert Preslang.parse(code) == [
             %{
               attributes: ["main", "title"],
               content: "This is <i>the</i> title of the Chapter\n",
               type: "chapter"
             },
             %{
               attributes: ["important"],
               content: "Some notes to the prev chapter ",
               type: "notes"
             },
             %{
               attributes: [],
               content: "\n  * <b>Point 1</b>\n  * Point 2\n  * Point 3",
               type: "slide"
             },
             %{
               attributes: [],
               content: "One-Liner, with <html></html>",
               type: "slide"
             },
             %{
               attributes: [],
               content:
                 "Html-Slide\n  <ul>\n    <li>One</li>\n    <li>Two</li>\n  </ul>\n    >this is not a type",
               type: "slide"
             },
             %{
               attributes: ["some-wired-attrs", "and-here-it-is"],
               content: "with < > some >>    content\n",
               type: "even_this-is-a-type"
             }
           ]
  end
end
