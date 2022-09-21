<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : FmATxt.xsl
    Created on : 6 de junio de 2022, 10:19
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/lfm">
        <xsl:value-of select="concat('{')"/>
        <xsl:text>
        </xsl:text>
        "artista":<xsl:value-of select="concat('&quot;',topalbums/@artist,'&quot;')"/>,
        <xsl:value-of select="concat('&quot;',name(topalbums/album),'&quot;',':')"/>[
        <xsl:apply-templates select="topalbums/album"/>
    </xsl:template>
    <xsl:template match="topalbums/album">
        <xsl:text>
         </xsl:text>
        <xsl:value-of select="concat('{ ')"/>
        <xsl:apply-templates select="*"/>
        <xsl:value-of select="concat('}')"/>
        <xsl:if test="position()!=last()">,
            <xsl:text>
            </xsl:text>
        </xsl:if>
        <xsl:text>
        </xsl:text>
        <xsl:value-of select="concat('&quot;',name(),'&quot;',':')"/>[
        <xsl:text>
        </xsl:text>
    </xsl:template>
    <xsl:template match="*">
        <xsl:text>            
        </xsl:text>
        <xsl:value-of select="concat('&quot;',name(),'&quot;',':','&quot;')"/>
        <xsl:value-of select="current()"/>
        <xsl:value-of select="concat('&quot;')"/>
        <xsl:text>
            <xsl:if test="position()!=last()">
                <xsl:value-of select="concat(',')"/>
            </xsl:if>
        </xsl:text>
    </xsl:template>

</xsl:stylesheet>
