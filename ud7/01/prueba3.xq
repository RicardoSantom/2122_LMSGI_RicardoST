for $a in doc('books')//title
where $a/../year='2003'
return $a/text()