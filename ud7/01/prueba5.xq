
<table>
  <tbody>
     {for $a in doc('books')//title
return <tr><th>{$a/text()}</th></tr>}
  </tbody>
</table> 