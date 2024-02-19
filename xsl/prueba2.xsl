<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:variable name="catalog" select="document('../xml/data.xml')"/>
  <xsl:variable name="b001" select="'TechMaster'"/>
  <xsl:variable name="b002" select="'InnoBook'"/>
  <xsl:variable name="b004" select="'GameBeast'"/>
  <xsl:variable name="b005" select="'EvoTech'"/>
  <xsl:variable name="b008" select="'SpeedLink'"/>
  <xsl:variable name="b009" select="'PixelPro'"/>
  <xsl:variable name="b010" select="'SoundSync'"/>
  <xsl:variable name="b011" select="'BeatWave'"/>

<xsl:template match="/">
  <html lang="en">
     <head>
        <meta charset="UTF-8"/>
		<title>UD6: Proyecto dirigido a la validación, formateo y transformación de documentos XML</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/main.css"/> 
    </head>
    <main>

<xsl:for-each select="$catalog/catalog/category"> 
    <p><strong><xsl:value-of select="name"/></strong></p>
    <p>   ------------------------------------------------------------------------------</p>
    <ul>
    <xsl:for-each select="products/product"> 
        <p>------------------------------------------------------------------------------</p>
            <li><p><strong>Nombre:</strong><xsl:value-of select="name"/></p></li>
        
            <xsl:if test="brand/@id='b001'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b001"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b002'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b002"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b004'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b004"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b005'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b005"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b008'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b008"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b009'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b009"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b010'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b010"/></p></li>
            </xsl:if>
            <xsl:if test="brand/@id='b011'">
            <li><p><strong>Marca:</strong><xsl:value-of select="$b011"/></p></li>
            </xsl:if>
            <li><p><strong>Precio:</strong><xsl:value-of select="price"/></p></li>
            <xsl:if test="discount > 0">
            <li><p><strong>Descuento:</strong><xsl:value-of select="discount"/> </p></li>
            <li><p><strong>Precio con Descuento:</strong><xsl:value-of select="price"/>-<xsl:value-of select="discount"/> </p></li>         
            </xsl:if>
            <li><p><strong>Precio con IVA:</strong><xsl:value-of select="price"/>+<xsl:value-of select="price"/>/100*21</p></li>
            
            <xsl:choose>
              <xsl:when test="price &lt; 150">
                <li><p style="color: purple;">(Posible oferta)</p></li>
              </xsl:when>
              <xsl:otherwise>
                <li><p style="color: blue;">(Precio Tope de Gama)</p></li>
              </xsl:otherwise>
            </xsl:choose>

            <li><p><strong>Imagen:<img src="{image}" /></strong></p></li>
            <li><p><strong>Url:</strong><xsl:value-of select="url"/></p></li>
            
            
        
        </xsl:for-each>
        </ul>
  </xsl:for-each>
  
    </main>
     <footer>
          <p>Ryan Trujillo and Aimar Ibarra</p>
     </footer>
  </html>
</xsl:template>
</xsl:stylesheet>