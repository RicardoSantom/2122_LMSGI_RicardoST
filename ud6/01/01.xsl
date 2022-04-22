<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>01.xsl</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>      
                <meta charset="UTF-8"/> 
                <meta name="author" content="Ricardo Santiago Tomé"/>
                <meta name="application-name" content="ïndice prácticas LMGSI"/>
                <meta name="description" content="primera practica xsl"/>
                <meta name="keywords" content="analítica web, seo, web semántica, seo semántico, analytics,
              html,xml,dtd,css,xsd,xpath,xsl"/>
                <meta name="robots" content="index, follow"/>      
                <link rel="stylesheet" href="css/reset.css" />
                <link rel="stylesheet" href="css/estilos.css"/>
                <link href="css/fonts.css"  rel="stylesheet"  type="text/css"/>
                <link rel="shortcut icon" type="image/png"  sizes="16x16" href="../images/favicon/R.png"/>
                <link rel="shortcut icon" type="image/ico"  sizes="16x16" href="../images/favicon/R.ico"/>
                <link rel="icon" type="image/png" sizes="192x192"  href="../images/favicon/android-icon-192x192.png"/>
                <link rel="icon" type="image/png" sizes="96x96" href="../images/favicon/favicon-96x96.png"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon/favicon-32x32.png"/>
                <link rel="icon" type="image/png" sizes="16x16" href="../images/favicon-/favicon16x16.png"/>
                <meta name="msapplication-TileColor" content="#ffffff"/>
                <meta name="msapplication-TileImage" content="../images/favicon/ms-icon-144x144.png"/>
            </head>
            <body>
                <h1>Información de las viviendas</h1>
                <xsl:apply-templates select="edificio/vivienda"/>
                <div>
                    Número de viviendas <xsl:value-of select='count(//vivienda)'/>
                </div>
                <div>
                    Número total de vecinos <xsl:value-of select='count(//nombre)'/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="edificio/vivienda">
        <div>
            <xsl:value-of select="concat('Piso:',piso,' Puerta:',puerta)"/>
            <ol>
                <xsl:apply-templates select="vecinos/nombre"/>
            </ol>
        </div>
    </xsl:template>
    <xsl:template match='vecinos/nombre'>
        <li>
            <xsl:value-of select="current()/text()"/>
        </li>
    </xsl:template>
</xsl:stylesheet>
