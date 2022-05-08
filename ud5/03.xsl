<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Carreras</title>
            </head>
            <body>
                <xsl:apply-templates select="//carreras/carrera">
                    <xsl:with-param name="numCre"   select="200"/>
                 </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

<xsl:template match="carrera">
    <xsl:param name="numCre"/>
    <xsl:if test="creditos&lt;$numCre">
        <p>
            <xsl:value-of select="nombre"/>
        </p>
    </xsl:if>
</xsl:template>    
</xsl:stylesheet>
