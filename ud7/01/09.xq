for $i in doc("books")/bookstore/book
where count($i/author)>2
return $i/title/text()