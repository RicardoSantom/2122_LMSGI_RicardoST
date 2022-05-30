<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : infojson.xsl
    Created on : 30 de mayo de 2022, 6:30
    Author     : Usuario
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    <xsl:include href="../../lib/libweb.xsl"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:call-template name="DocTipo"/>
        <xsl:call-template name="comentarios"/>
        <html>
            <head>
                <xsl:call-template name="metaWeb">
                    <xsl:with-param name="titulo" select="concat('Información sobre JSON',' ')"/>
                    <xsl:with-param name="keywords" select="'xml,xslt,JSON'"/>
                    <xsl:with-param name="description" select="'Almacenamiento de datos en un formato ligero'"/>
                    <xsl:with-param name="des" select=""/>
                </xsl:call-template>
                <style>
                    body{
                    background-color: #cccccc;
                    color: #6699ff;
                    font-size: 2em;
                    text-align: center;
                    }
                    div{
                    padding-top: 2em;
                    }
                    ul li{
                    list-style: none;}
                    footer{
                    background-color: #84a578;
                    color:#000;
                    font-size: 0.5em;
                    position: fixed;
                    bottom: 0;
                    width: 100%;
                    }
                    #botonHTML{
                    border-style: solid;
                    border-width: 3px;
                    border-color: #606898;
                    outline: none;
                    background-color: #84a578;
                    color: #0000cc;
                    cursor: pointer;
                    border-radius: 10px;
                    font-size:0.75em;
                    display: block;
                    position: relative;
                    width: 4.5em;
                    margin-bottom: 0.75em;
                    margin-left: 3%;
                    }
                </style>
            </head>
            <body>
                <h1>JSON</h1>
                <h2>Almacenamiento de información en formato ligero</h2>
                <p>Esta página web se ha generado aplicando una plantilla XSLT a un documento XML</p>
                <ul>
                    <li>
                        <a href="infojson.xml">Enlace a XML origen</a>
                    </li>
                    <li>
                        <a href="infojson.xsl">Enlace a plantilla XSL</a>
                    </li>
                </ul>
                <div>
                    <xsl:apply-templates select="unidad"/>
                </div>
                <div>
                    <a href="../../index.html" title="HTML" id="botonHTML">Menú principal</a>
                </div>
                <footer>
                    <address>"2021-22  IES LOS SAUCES. ©Todos los derechos reservados.<a href="mailto:ricardo.santom@educa.jcyl.es" target="_top">Ricardo Santiago Tomé"</a></address>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="unidad">
        <ul>
            <xsl:attribute name="class">
                <xsl:value-of select="@numero"/>
            </xsl:attribute>
            <xsl:for-each select="practica">
                <xsl:element name="li">
                    <xsl:attribute name="id">
                        <xsl:value-of select="@numero"/>
                    </xsl:attribute>
                    <xsl:element name="a">
                        <xsl:attribute name="href">
                            <xsl:value-of select="concat('../../ud8/',@numero,'/',archivo)"/>
                        </xsl:attribute>
                        <xsl:value-of select="archivo"/>
                    </xsl:element>    
                </xsl:element>
            </xsl:for-each>
        </ul>
    </xsl:template>

</xsl:stylesheet>
