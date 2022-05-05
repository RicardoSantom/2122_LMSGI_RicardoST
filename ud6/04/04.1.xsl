<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.1.xsl
    Created on : 5 de mayo de 2022, 9:32
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:call-template name="comentarios"/>
    <xsl:output method="html"/>
    <xsl:include href="../lib/libweb.xsl"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="concat('04 XSLT',' ')"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,coches,garajes,reparaciones'"/>
                    <xsl:with-param name="description" select="'informacion de reparaciones de coches'"/>
                    <xsl:with-param name="des" select=""/>
                </xsl:call-template>
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
                        <th class="matricula">Matrícula</th>
                        <th class="reparaciones">Reparaciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="valorMatricula">
                            <xsl:value-of select="matricula"/>
                        </td>
                        <td>
                            <xsl:apply-templates select="//reparacion[current()/matricula=matricula]"/>
                        </td>
                    </tr>
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
        <p class="codigoStrong">
            <strong>
                <xsl:value-of select="current()/@codigo"/>
            </strong>
        </p>
        <ul>
            <li class="elemento">
                <xsl:value-of select="descripcion"/>
            </li>
            <li class="elemento">
                <xsl:value-of select="concat('Fecha de entrada: ',fecha_entrada)"/>
            </li>
            <li class="elemento">
                <xsl:value-of select="concat('Fecha de salida: ',fecha_salida)"/>
            </li>
            <li class="elemento">
                <xsl:value-of select="concat(horas,' ',name(horas))"/>
            </li>
        </ul>
        <div class="totales">
            <div>
                Número de reparaciones: <xsl:value-of select="count(//reparacion[current()/matricula=matricula])"/>
            </div>
            <div class="calculado">
                Total Horas:<xsl:value-of select="sum(//reparacion[current()/matricula=matricula]/horas)"/>
            </div>
            <div>
                Total a pagar:<xsl:value-of select="sum(//reparacion[current()/matricula=matricula]/horas)*12"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
