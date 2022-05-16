for $a in doc('books')//bookstore/book
return $a/title/text()