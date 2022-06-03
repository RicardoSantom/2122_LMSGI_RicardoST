<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : libWebEnlaces.xsl
    Created on : 31 de mayo de 2022, 3:27
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:template match="unidad">
        <xsl:for-each select="practica">
            <xsl:element name="ul">
                <xsl:attribute name="class">
                    <xsl:value-of select="concat('practica',@numero)"/>
                </xsl:attribute>
                <xsl:for-each select="archivo">
                    <xsl:element name="li">
                        <xsl:attribute name="id">
                            <xsl:value-of select="concat('solucion',current())"/>
                        </xsl:attribute>
                        <xsl:element name="a">
                            <xsl:attribute name="href">
                                <xsl:value-of select="concat('../../ud',//unidad/@numero,'/',ancestor-or-self::practica/@numero,'/',current())"/>
                            </xsl:attribute>
                            <xsl:value-of select="current()"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
