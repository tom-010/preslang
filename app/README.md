App
===

This component contains the actual main-method. You can build the impress-application with:

```
mix escript.build
```

This command outputs a binary called 'app.' This binary takes two arguments.

1. The pres-file with the description of the presentation
2. The template, which is a 'eex'-file. 

Running the application, it outputs to stdout, which you can redirect into a 'HTML'-File. Note: The files impress.js and impress.css have to be in the same directory as the redirected HTML-file!