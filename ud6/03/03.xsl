<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 21 de abril de 2022, 10:33
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes" version="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
        </xsl:text>
        <!--<xsl:for-each select="peliculas/preceding-sibling::comment()">
                    <xsl:comment>
                        <xsl:value-of select="current()"/>
                    </xsl:comment>
                </xsl:for-each>
        <xsl:text>
        </xsl:text>-->
        <xsl:apply-templates select="comment()"/>
        <xsl:text>
        </xsl:text>
        <html>
            <head>
                <title>03 xslt Ricardo Santiago Tomé</title>
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
                <h1>Información de películas</h1>
                <div id="contenedor">
                    <xsl:for-each select="peliculas/pelicula">
                        <xsl:sort select="publico" datatype="text" order="ascending"/>
                        <xsl:sort select="valoracion/@puntos" datatype="number" order="ascending"/>
                        <xsl:sort select="nombre" datatype="text" order="ascending"/>
                        <div class="caja">
                            <div class="nombre">
                                <xsl:value-of select="nombre"/>
                            </div>
                            <div>
                                <xsl:choose>
                                    <xsl:when test="valoracion/@puntos=1 or valoracion/@puntos=2">
                                        <p class="Baja">
                                            Puntuacion: Bajo
                                        </p>
                                    </xsl:when>
                                    <xsl:when test="valoracion/@puntos=3 or valoracion/@puntos=4">
                                        <p class="Media">
                                            Puntuacion: Media
                                        </p>
                                    </xsl:when>
                                    <xsl:when test="valoracion/@puntos&gt;4">
                                        <p class="Alta">
                                            Puntuacion: Alta
                                        </p>
                                    </xsl:when>
                                </xsl:choose>
                            </div>
                            <div>
                                <xsl:value-of select="concat('Dirigido a: ',publico)"/>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <footer>
                    <p>
                        <xsl:value-of select="concat('Número total de películas ',count(//pelicula))"/>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>

</xsl:stylesheet>
