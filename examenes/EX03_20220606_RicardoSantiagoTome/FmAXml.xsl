<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : FmAXml.xsl
    Created on : 6 de junio de 2022, 10:05
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/lfm">
        <xsl:element name="{name(topalbums)}">
            <xsl:apply-templates select="topalbums/album"/>
        </xsl:element>
    </xsl:template>
    <xsl:template match="topalbums/album">
        <xsl:element name="{name(.)}">
            <xsl:attribute name="artista">
                <xsl:value-of select="topalbums/@artist"/>
            </xsl:attribute>
            <xsl:element name="{name(name)}">
                <xsl:value-of select="name"/>
            </xsl:element>
            <xsl:element name="{name(playcount)}">
                <xsl:value-of select="playcount"/>
            </xsl:element>
            <xsl:element name="{name(url)}">
                <xsl:value-of select="url"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
