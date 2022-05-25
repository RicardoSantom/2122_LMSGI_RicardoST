<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 23 de mayo de 2022, 9:27
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"/>
    <xsl:template match="consolas">
        <xsl:text>{
        &quot;</xsl:text>
        <xsl:value-of select="name()"/><xsl:text>&quot;: [
            {
        </xsl:text>
        <xsl:text></xsl:text><xsl:apply-templates select="consola"/>
    </xsl:template>
    <xsl:template match="consola">
        <xsl:value-of select="concat('&quot;',name(nombre),':')"></xsl:value-of>
        <xsl:value-of select="concat('&quot;',fabricante(nombre),':')"></xsl:value-of>
        <xsl:value-of select="concat('&quot;',anyo(nombre),':')"></xsl:value-of>
    </xsl:template>
</xsl:stylesheet>
