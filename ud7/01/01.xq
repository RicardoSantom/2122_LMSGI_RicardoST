<xml>
  <libros>
      {for $a in //book
    order by $a/title
    return <libro>{$a/title/text()}</libro>}
    </libros>
</xml>