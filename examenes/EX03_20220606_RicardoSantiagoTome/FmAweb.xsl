<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : prueba.xsl
    Created on : 6 de junio de 2022, 8:32
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
    <xsl:template match="/lfm">
        <xsl:call-template name="DocTipo"/>
        <xsl:call-template name="comentarios"/>
        <html lang='es'>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="concat(//@artist,' - RicardoSantiagoTome')"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,daw1,examen3Evaluacion'"/>
                    <xsl:with-param name="description" select="'Examen 3ª evaluacin LMSGI 2021-22'"/>
                </xsl:call-template>
            </head>
            <body>
                <div class="titulo">
                    <h1>
                        <xsl:value-of select="concat('last.fm')"/>
                    </h1>
                </div>
                <h3>
                    <xsl:value-of select="topalbums/@artist"/>
                </h3>
                <p>
                    <xsl:value-of select="concat('Álbumes')"/>
                </p>
                <div>
                    <xsl:apply-templates select="topalbums/album"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="topalbums/album">
        <div class="elemento">
            <xsl:choose>
                <xsl:when test="image=''">
                    <figure class="vacia">
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="concat('../../images/pantallazoIndex.png')"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="concat('Imagen de portada')"/>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="url"/>
                            </xsl:attribute>
                            <xsl:value-of select="name"/>
                        </xsl:element>
                    </figure>
                </xsl:when>
                <xsl:otherwise>
                    <figure class="imagen">
                        <xsl:element name="img">
                            <xsl:attribute name="src">
                                <xsl:value-of select="image[@size='large']"/>
                            </xsl:attribute>
                            <xsl:attribute name="alt">
                                <xsl:value-of select="concat('Imagen de portada')"/>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="url"/>
                            </xsl:attribute>
                            <xsl:value-of select="name"/>
                        </xsl:element>
                    </figure>
                </xsl:otherwise>
            </xsl:choose>
            <p>
                <xsl:value-of select="../@artist"/>
            </p>
        </div>
    </xsl:template>

</xsl:stylesheet>
