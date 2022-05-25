<html>
  <body>
  <ol>
     {for $a in //book
    order by $a/title where $a/price <= 30
    return <li>{$a/title/text()}</li>}
  </ol>
    </body>
</html>