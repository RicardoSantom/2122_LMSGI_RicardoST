for $a in doc('books')//bookstore/book
where $a/year='2003'
return $a/title/text()