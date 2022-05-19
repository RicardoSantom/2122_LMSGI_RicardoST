<xml>
  <libros>
      {for $a in //book
    order by $a/title where $a/price <= 30
    return <libro>{$a/title/text()}</libro>}
    </libros>
</xml>