for $a in doc("books.xml")/bookstore/book[count(author)>2]
return $a /title/text()