PresLang
========

![Preslang](media/logo.svg)

Preslang is a (markup) language for describing presentations, which are converted to actual presentations via (elixir) templates. 

Welcome this repository. I am quite happy that you came here! As a readme is a unidirectional conversation, I have to assume what background you have. Either you were told by someone, that this project exists (cheers to him) or you found it by yourself. 

What is PresLang?
-----------------

Either way, I think you had some trouble with clicky clicky presentation creation ala PowerPoint in the past. I had the same! I recognized that I prepared my presentations entirely in a '.txt'-File in the past. As I finished my work, I "converted" my presentation in a "real" presentation. 

After doing this many times, I've built some patterns, how to write the test-files. Preslang is a language, which formalized these patterns and provides a parser, that creates an easy to process data structure from it. 

Getting Started
---------------

Create a file 'example.pres' with:

``` 
>Chapter: My first chapter

>Slide: My first slide

>Slide(important): My second (and important) slide

>Slide(important, hover):
This is 
a multiline
slide

>Notes: 
- Some notes for the previous slide
- I can add arbitrary text
``` 

* Whenever, there is a '>' as the first character of a line, a new slide begins. 
* The string until ':' is the type of the slide. The types are provided (and documented) by the template. The language allows any type.
* The type can be followed by '(...)' which contains a list of tags/attributes. The semantics of the attributes are specified by the template as well. 
* Everything that follows the ':' is the content of the slide

That's it! A straightforward way to describe a presentation. The template adds all the powerful features, you need. However, you can choose the template and therefore the bundle of features!

To compile the presenation to an 'impress.js'-presenation do (assuming your example.pres is in the preslang-root-folder):

``` 
./preslang example.pres impress/templates/impress.html.eex > impress/out/presentation.html
```

The compiler writes its results to stdout, which we redirect to an HTML-Folder, where the necessary files for 'impres.js' are already are. We specify a simple template and the pres-file as input. Now we can open 'impress/out/presentation.html' in a web browser and see the final presentation!

Why no Markdown?
----------------

As I prepared presentations in text-files in the past, I tried Markdown once or twice. However, it was too much effort compared to the advantages. Markdown works better for me for documents like this than for Slides. Besides to this, it is much more harmful to parse and extend. 

ParseLang is going to get Markdown- and LaTex-Support as well, so you can write Markdown within your slides if you want (or HTML, or LaTex, or Plaintext).

Backend
-------

The backend is responsible for converting the Preslang-Files into an easy-to-process data structure. The parser is written in Elixir. It should not affect you very much. As soon, as you write a template (see below), you need embedded Elixir, what is quite easy to learn. You can connect different frontends to the backend very easily.

Frontend
--------

Currently, the only frontend is for 'impress.js' with a templating system. I choose 'impress.js' because it is straightforward to generate (HTML), quite powerful, and easy to extend with web-technologies. 

The only downside of 'impress.js' is, that is harmful to write plain HTML, which is solved by ParseLang.

Writing a template
------------------

To write a new template, you have to create a new 'eex'-file, which stands for embedded Elixir. 

The frontend executes the template while passing a data-structure with the name slides to the template. The best way to learn more about the data structure is to use 'IO.inspect':

```
$ cat template.html.eex

IO.inspect slides
```

Feel free to check out the example-template in the repository ('impress/templates/impress.html.eex'). Here you can see the use of classes and counters as well.
