<html>
<head>
<meta charset="UTF-8"/>
    <title>05</title>
      <link href="css/05.css"  rel="stylesheet"/>
  </head>
  <body>
  <h1>Bookstore</h1>
  <table>
    <thead>
      <th>Título</th>
      <th>Categoría</th>
  </thead>
    <tbody>
      {for $a in bookstore/book
    return 
    <tr>
      <td>{$a/title/text()}</td>
      <td>{data($a/@category)}</td>
    </tr>}
    </tbody>
  </table>
  <ul>
     {for $a in //book
    return <li  class="{data($a//@category)}"
    >{$a/title/text()}</li>}
  </ul>
    </body>
</html>