<libros>
{for $a in doc("books")/bookstore/book
let $autor := $a/author
  return
  <libro>
  <title lang="{data($a//@lang)}">{$a/title/text()}</title>
{$autor}
</libro>}
</libros>