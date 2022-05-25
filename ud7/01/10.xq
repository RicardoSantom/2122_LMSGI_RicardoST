<libros>
{for $a in doc("books")/bookstore/book
  return
  <libro autores="{$a/count($a/author)}">{$a/title/text()}</libro>}
</libros>