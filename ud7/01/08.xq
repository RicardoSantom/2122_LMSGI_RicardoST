<html>
  <title>07</title>
  <body>
    <h1>Listado de prácticas</h1>
      {for $tema in (2 to 7), $ejercicio in (1 to 3) return
    <div>
      <a href="../ud{$tema}/0{$ejercicio}.html">
      {concat("Tema",$tema," Ejercicio",$ejercicio)}
      </a>
    </div>
  }
  </body>
</html>