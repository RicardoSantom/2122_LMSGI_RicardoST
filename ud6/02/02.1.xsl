<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl
    Created on : 4 de abril de 2022, 9:06
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>02.1.xsl</title>
                <link rel="stylesheet" href="css/estilos.css" type="text/css" />
                <link href="css/fonts.css"  rel="stylesheet"  type="text/css" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
                <meta name="author" content="Ricardo Santiago Tomé"/>
                <meta name="application-name" content="FONTS HTML"/>
                <meta name="description" content="FONTS HTML"/>
                <meta name="keywords" content="font,fonts,fuente,fuentes,font-family,div,figure,a,span,logo,class,styles,html,css" />
                <meta name="robots" content="index,nofollow"/>
                <link rel="shortcut icon" type="image/png"  sizes="16x16" href="../../images/favicon/R.png"/>
                <link rel="shortcut icon" type="image/ico"  sizes="16x16" href="../../images/favicon/R.ico"/>
                <link rel="icon" type="image/png" sizes="192x192"  href="../../images/favicon/android-icon-192x192.png"/>
                <link rel="icon" type="image/png" sizes="96x96" href="../../images/favicon/favicon-96x96.png"/>
                <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon/favicon-32x32.png"/>
                <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon-/favicon16x16.png"/>
                <link rel="manifest" href="/favicon/manifest.json"/>
                <meta name="msapplication-TileColor" content="#ffffff"/>
                <meta name="msapplication-TileImage" content="../../images/favicon/ms-icon-144x144.png"/>
                <meta name="theme-color" content="#ffffff"/>
            </head>
            <body>
                <h1>Información de tickets</h1>
                <h2>Listado de tickets</h2>
                <xsl:for-each select="listatickets/ticket">
                     <xsl:sort select="numero" datatype="number" order="descending"/>
                    <div>
                        <xsl:value-of select= "concat('Tickets ',numero/text())"/>
                        <table>
                            <thead>
                                <tr>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <xsl:for-each select="producto">
                                    <xsl:sort select="nombre" datatype="text" order="descending"/>
                                    <tr>
                                        <td>
                                            <xsl:value-of select="nombre"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="precio"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Total:</th>
                                    <th>
                                        <xsl:value-of select="total"/>
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="fecha">
                            <xsl:value-of select="fecha/text()"/>
                        </div>
                    </div>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>

