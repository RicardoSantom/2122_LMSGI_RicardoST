<books>
{for $a at $b in doc("books.xml")/bookstore/book
return
  <book>
    {concat($b,'.',$a/title/text())}
  </book>}
</books>