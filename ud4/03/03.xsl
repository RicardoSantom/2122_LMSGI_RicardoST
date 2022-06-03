<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 23 de enero de 2022, 11:18
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                    <title>03.xsl Ricardo Santiago Tome;</title>
                    <link rel="stylesheet" href="03.css" type="text/css" />
                    <link rel="icon" type="image/png" sizes="32x32" href="../images/favicon/favicon-32x32.png"/>
                    <link rel="shortcut icon" type="image/png"  sizes="16x16" href="../images/favicon/R.png"/>
            </head>
            <body>
                <h1>HECHOS HISTÓRICOS</h1>
                <table>
                    <thead>
                        <tr id="cabecera">
                            <th rowspan="2" class="descripcion">Descripción</th>
                            <th colspan="3">Fecha</th>
                        </tr>
                        <tr>
                            <th class="fecha">Día</th>
                            <th class="fecha">Mes</th>
                            <th class="fecha">Año</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="hechoshistoricos/acontecimiento"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="hechoshistoricos/acontecimiento">
        <tr>
            <th class="datos">
                <xsl:value-of select="descripcion"/>
            </th>
            <td class="datos">
                <xsl:value-of select="fecha/dia"/>
            </td>
            <td class="datos">
                <xsl:value-of select="fecha/mes"/>
            </td>
            <td class="datos">
                <xsl:value-of select="fecha/anyo"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
