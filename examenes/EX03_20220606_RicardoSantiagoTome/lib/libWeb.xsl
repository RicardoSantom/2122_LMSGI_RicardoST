<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : libWeb.xsl
    Created on : 04/05/2022
    Author     : Ricardo
    Description:
       Plantillas comunes a todas las páginas web
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!--  Escribir las tag META de la web y el favicon    -->
    <xsl:template name="metaWeb">
        <xsl:param name="titulo"/>
        <xsl:param name="keywords"/>
        <xsl:param name="description"/> 
       
        <!--Etiquetas meta-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>       
        <meta name="author" content="Ricardo Santiago Tomé"/>
        <meta name="application-name" content="AppWeb de LMSGI"/>
        <meta name="description">
            <xsl:attribute name="content">
                <xsl:value-of select="$description"/>
            </xsl:attribute>
        </meta>
        <meta name="keywords">
            <xsl:attribute name="content">
                <xsl:value-of select="$keywords"/>
            </xsl:attribute>
        </meta>
        <meta name="robots" content="index, follow"/>      
        <link href="css/estilos.css"  rel="stylesheet" type="text/css" />
        <link href="css/fonts.css"  rel="stylesheet"  type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <link rel="shortcut icon" type="image/png"  sizes="16x16" href="../../images/favicon/R.png"/>
        <link rel="shortcut icon" type="image/ico"  sizes="16x16" href="../../images/favicon/R.ico"/>
        <link rel="icon" type="image/png" sizes="192x192"  href="../../images/favicon/android-icon-192x192.png"/>
        <link rel="icon" type="image/png" sizes="96x96" href="../../images/favicon/favicon-96x96.png"/>
        <link rel="icon" type="image/png" sizes="32x32" href="../../images/favicon/favicon-32x32.png"/>
        <link rel="icon" type="image/png" sizes="16x16" href="../../images/favicon-/favicon16x16.png"/>
        <title>
            <xsl:value-of select="$titulo"/>
        </title>
    </xsl:template>
    <!-- Escribir el DocType -->
    <xsl:template name="DocTipo">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    </xsl:template>
    <!-- Copiar los comentarios -->
    <xsl:template match="comment()" name="comentarios">
        <xsl:text xml:space="preserve">
        <xsl:comment>
            <xsl:value-of select="comment()"/>
        </xsl:comment>
        </xsl:text>
    </xsl:template>
    <xsl:template name="footer">
        <xsl:element name="footer">
            <xsl:element name="address">
                <xsl:value-of select="concat('2021-22  IES LOS SAUCES . Todos los derechos reservados ©. ')"/>
                <xsl:element name="a">
                    <xsl:attribute name="href">
                        <xsl:value-of select="concat('mailto:ricardo.santom@educa.jcyl.es')"/>
                    </xsl:attribute>
                    <xsl:value-of select="concat('Ricardo Santiago Tomé')"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('https://github.com/RicardoSantom/2122_LMSGI_RicardoST')"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('enlaces')"/>
                </xsl:attribute>
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('github')"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="concat('RicandoSantom en GitHub')"/>
                </xsl:attribute>
            </xsl:element>
            <xsl:element name="a">
                <xsl:attribute name="id">
                    <xsl:value-of select="concat('rss')"/>
                </xsl:attribute>
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('enlaces')"/>
                </xsl:attribute>
                <xsl:attribute name="type">
                    <xsl:value-of select="concat('application/rss+xml')"/>
                </xsl:attribute>
                <xsl:attribute name="href">
                    <xsl:value-of select="concat('http://daw106.ieslossauces.es/ud3/01/novedades.xml')"/>
                </xsl:attribute>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>
