<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 05.xsl
    Created on : 20 de abril de 2022, 19:25
    Author     : Usuario
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
                <title>05.xsl</title>
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
                <xsl:apply-templates select="listatickets/ticket">
                    <xsl:sort select="numero" datatype="number" order="descending"/>
                </xsl:apply-templates>
                <xsl:apply-templates select="listatickets/ticket" mode="lista">
                    <h2>Plantilla con atributo mode</h2>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="listatickets/ticket">
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
                    <xsl:apply-templates select="producto">
                        <xsl:sort select="nombre" datatype="text" order="descending"/>
                    </xsl:apply-templates>
                </tbody>
                <tfoot>
                    <xsl:if test="total=sum(producto/precio)">
                        <tr>
                            <th>Total:</th>
                            <th>
                                <xsl:value-of select="total"/>
                            </th>
                        </tr>
                    </xsl:if>
                    <xsl:if test="total!=sum(producto/precio)">
                        <tr>
                            <th>Total corregido ticket <xsl:value-of select="numero"/>: </th>
                            <th>
                                <xsl:value-of select="sum(producto/precio)"/>
                            </th>
                        </tr>
                    </xsl:if>
                </tfoot>
            </table>
            <div class="fecha">
                <xsl:value-of select="fecha/text()"/>
            </div>
        </div>
    </xsl:template>
    <xsl:template match="producto">
        <tr>
            <td>
                <xsl:value-of select="nombre"/>
            </td>
            <td>
                <xsl:value-of select="precio"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="listatickets/ticket" mode="lista">
        <xsl:template match="listatickets/ticket">
            <div>
                <xsl:value-of select= "concat('Tickets ',numero/text())"/>
                <ol>
                    <xsl:for-each select="ticket/producto">
                        <p>Producto nº:<xsl:value-of select="count(producto)"/></p>
                    </xsl:for-each>
                    <xsl:for-each select="producto">
                        <li>
                            <xsl:value-of select="concat('Nombre: ',nombre/text(),' -- Precio: ',precio/text())"/>
                        </li>
                    </xsl:for-each>
                </ol>
                <ul style="list-style:none">
                    <li>
                        <xsl:value-of select="concat('Total productos:',count(producto))"/>
                    </li>
                    <li>
                        <xsl:value-of select="concat('Total precio:',sum(producto/precio))"/>
                    </li>
                </ul>
                <div class="fecha">
                    <xsl:value-of select="fecha/text()"/>
                </div>
            </div>
        </xsl:template>
    </xsl:template>
</xsl:stylesheet>
