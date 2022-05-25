for $a in doc("books.xml")//book
where $a/price>30
order by $a/title
return concat(data($a/title/text()),':',data($a/price),'$')