<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl
    Created on : 28 de abril de 2022, 11:35
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
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;
        </xsl:text>
        <xsl:apply-templates select="comment()"/>
        <xsl:text>
        </xsl:text>
        <html>
            <head>
                <title>04.xsl</title>
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
                <h1>Práctica 4<br/>Información de garajes</h1>
                <xsl:apply-templates select="garaje/coches/coche"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="garaje/coches/coche">
        <xsl:if test="count(//reparacion[current()/matricula=matricula])&gt;0">
            <table>
                <thead>
                    <tr>
                        <th>Matrícula</th>
                        <th>Reparaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <xsl:value-of select="matricula"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="//reparacion[current()/matricula=matricula]"/>
                        </td>
                    </tr>
                    <div>
                        Número de reaparaciones: <xsl:value-of select="count(//reparacion[current()/matricula=matricula])"/>
                    </div>
                    <div>
                        Total Horas:<xsl:value-of select="sum(//reparacion[current()/matricula=matricula]/horas)"/>
                    </div>
                    <div>
                        Total a pagar:<xsl:value-of select="sum(//reparacion[current()/matricula=matricula]/horas)*12"/>
                    </div>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>
    <xsl:template match="comment()">
        <xsl:text xml:space="preserve">
        <xsl:comment>
            <xsl:value-of select="."/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
    <xsl:template match="//reparacion[current()/matricula=matricula]">
        <p>
            <strong>
                <xsl:value-of select="current()/@codigo"/>
            </strong>
        </p>
        <ul>
            <li>
                <xsl:value-of select="descripcion"/>
            </li>
            <li>
                <xsl:value-of select="concat('Fecha de entrada: ',fecha_entrada)"/>
            </li>
        </ul>
    </xsl:template>

</xsl:stylesheet>
