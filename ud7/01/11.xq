<libros>
{for $a in doc('books')/bookstore/book
let $autor := $a/author
return 
<libro>{$a/title}{$autor}</libro>}
</libros>

