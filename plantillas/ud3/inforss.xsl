<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : infojson.xsl
    Created on : 30 de mayo de 2022, 6:30
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/libWebEnlaces.xsl"/>
    <xsl:output method="html" indent="yes" omit-xml-declaration="no"/>
    <xsl:include href="../../lib/libWebAuxiliar.xsl"/>
    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <xsl:call-template name="comentarios"/>
<xsl:text>
</xsl:text>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="concat('Información sobre ',unidad/@tipo)"/>
                    <xsl:with-param name="keywords" select="concat('rss,atom,opml,feed',',',unidad/@tipo)"/>
                    <xsl:with-param name="description" select="'Feeds y suscripciones a rss y atom'"/>
                </xsl:call-template>
                <xsl:call-template name="estiloInterno"/>
            </head>
            <body>
                <xsl:call-template name="info">
                    <xsl:with-param name="tituloPrincipal" select="unidad/@tipo"/>
                    <xsl:with-param name="tituloSecundario" select="'Feeds y suscripciones a rss y atom'"/>
                    <xsl:with-param name="parrafo" select="'Esta página web se ha generado aplicando una plantilla XSLT a un documento XML'"/>
                </xsl:call-template>
                <div>
                    <xsl:call-template name="enlaces">
                        <xsl:with-param name="enlacePlantilla" select="unidad/@tipo"/>
                    </xsl:call-template>
                </div>
                <div>
                    <xsl:apply-imports/>
                </div>
                <xsl:call-template name="botonMenu"/>
                <xsl:call-template name="footer"/>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
