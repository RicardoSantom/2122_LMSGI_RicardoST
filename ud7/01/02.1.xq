<xml>
  <libros>
      {for $a in //book[price<=30]
    order by $a/title
    return <libro>{$a/title/text()}</libro>}
    </libros>
</xml>