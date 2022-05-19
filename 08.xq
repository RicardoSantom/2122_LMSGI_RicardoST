<html>
  <title>07</title>
  <body>
    <h1>Listado de prácticas</h1>
    {for $ud in (2), $ejercicio in (1 to 9) return
    <div>
      <a href="ud{$ud}/0{$ejercicio}/index.html">
      {concat("Tema",$ud," Ejercicio",$ejercicio)}
      </a>
    </div>
  }
  {for $ud in (2), $ejercicio in (10 to 12) return
    <div>
      <a href="ud{$ud}/{$ejercicio}/index.html">
      {concat("Tema",$ud," Ejercicio",$ejercicio)}
      </a>
    </div>
  }
      {for $ud in (3 to 7), $ejercicio in (1 to 9) return
    <div>
      <a href="ud{$ud}/0{$ejercicio}/index.html">
      {concat("Tema",$ud," Ejercicio",$ejercicio)}
      </a>
    </div>
  }
  </body>
</html>