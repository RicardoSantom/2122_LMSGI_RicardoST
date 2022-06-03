<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/consolas">
    <xsl:value-of select="concat('{')"/>
    <xsl:text>
    </xsl:text>
        <xsl:value-of select="concat('&quot;',name(),'&quot;',':')"/>[
        <xsl:apply-templates select="consola"/>
        <xsl:text>
    </xsl:text>
        <xsl:value-of select="concat(']')"/>
    <xsl:text>
</xsl:text>
<xsl:value-of select="concat('}')"/>
<xsl:text>
</xsl:text>
    </xsl:template>
    <xsl:template match="consola">
        <xsl:value-of select="concat('{ ')"/>
        <xsl:apply-templates select="*"/>
        <xsl:value-of select="concat('}')"/>
        <xsl:if test="position()!=last()">
            <xsl:value-of select="concat(',')"/>
            <xsl:text>
        </xsl:text>
        </xsl:if>
    </xsl:template>
    <xsl:template match="*">
            <xsl:text>            
            </xsl:text>
            <xsl:value-of select="concat('&quot;',name(),'&quot;',':','&quot;')"/>
        <xsl:value-of select="current()"/>
        <xsl:value-of select="concat('&quot;')"/>
        <xsl:text><xsl:if test="position()!=last()"><xsl:value-of select="concat(',')"/></xsl:if>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
