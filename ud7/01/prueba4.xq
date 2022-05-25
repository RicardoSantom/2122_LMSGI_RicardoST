for $a in doc('books')//title
where $a/../year='2003'
order by $a/../price
return $a/text()