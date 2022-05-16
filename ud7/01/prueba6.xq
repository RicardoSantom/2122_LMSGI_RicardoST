
<table>
<thead>
  <tr>
    <th>
      Título
    </th>
    <th>
      Autor
    </th>
  </tr>
</thead>
  <tbody>
     {for $a in doc('books')//title
      return <tr><td>{$a/text()}</td><td><ul>{for $a in doc('books')//author
      return 
            <li>
                {$a/text()}
            </li>
              }</ul></td>
         </tr>}
  </tbody>
</table> 