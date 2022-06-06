<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : prueba.xsl
    Created on : 6 de junio de 2022, 6:02
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="lib/libweb.xsl"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <xsl:call-template name="comentarios"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="concat('prueba.xml')"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,daw1,prueba'"/>
                    <xsl:with-param name="description" select="'Examen 3ª evaluacin LMSGI 2021-22'"/>
                </xsl:call-template>
            </head>
            <body>
                <xsl:for-each select="root/elemento">
                    <p>
                        <xsl:value-of select="current()"/>
                    </p>
                </xsl:for-each>
                <xsl:call-template name="footer"/>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
