<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : examen.xsl
    Created on : 9 de mayo de 2022, 8:54
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:param name="solucion" select="'no'"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>examen.xsl</title>
                <link rel="stylesheet" href="css/meses.css" type="text/css" />
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
                <h1>
                    <xsl:value-of select="examen/datos/nombreCiclo"/>
                </h1>
                <h2>
                    <xsl:value-of select="examen/datos/nombreModulo"/>
                </h2>
                <h3>
                    <xsl:value-of select="concat('Fecha: ',//dia,' de ',document('meses.xml')/meses/mes[@id=current()/examen/datos/fecha/mes],' de ',//anyo)"/>
                </h3>
                <form action="/action_page.php"  method="POST" name="examen" id="formularioExamen" autocomplete="off">
                    <xsl:for-each select="examen/preguntas/pregunta">
                        <fieldset class="pregunta">
                            <div class="enunciado">
                                <xsl:value-of select="concat(@id,'.-',enunciado)"/>
                            </div>
                            <xsl:for-each select="respuestas/respuesta">
                                <div class="respuestas">
                                    <xsl:if test="$solucion='si'">
                                        <xsl:attribute name="class">
                                            respuestas sombra
                                        </xsl:attribute>
                                    </xsl:if>
                                    <label>
                                        <input type="radio" name="pregunta" class="pregunta">
                                            <xsl:attribute name="id">
                                                <xsl:value-of select="concat('pregunta',../../@id,position())"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="name">
                                                <xsl:value-of select="concat('pregunta',../../@id)"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="value">
                                                <xsl:value-of select="position()"/>
                                            </xsl:attribute>
                                            <xsl:if test="$solucion!='no'">
                                                <xsl:attribute name="disabled">
                                                    <xsl:value-of select="disabled"/>
                                                </xsl:attribute>
                                                <xsl:if test="@correcta='correcta'">
                                                    <xsl:attribute name="checked">
                                                        <xsl:value-of select="checked"/>
                                                    </xsl:attribute>
                                                </xsl:if>
                                            </xsl:if>
                                        </input>
                                        <xsl:value-of select="current()"/>
                                    </label>
                                </div>
                            </xsl:for-each>
                        </fieldset>
                    </xsl:for-each>
                    <xsl:if test="$solucion!='si'">
                        <fieldset id="botones">
                            <input type="submit" value="Enviar formulario" id="botonEnviar"/>
                            <input type="reset" value="Borrar formulario" id="botonBorrar"/>
                        </fieldset>
                    </xsl:if>
                </form>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
