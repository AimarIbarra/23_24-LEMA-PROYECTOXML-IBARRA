<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/catalog">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <title>UD6: Proyecto dirigido a la validación, formateo y transformación de documentos XML</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/main.css"/> 
      </head>
      <body>
        <xsl:for-each select="products">  
          <p>Total number of products/services: <xsl:value-of select="count(product)"/></p> 
        </xsl:for-each>
        <ul>
          <xsl:for-each select="category/products/product">
            <div>
            <li><b>Nombre:</b><xsl:value-of select="productName"/></li>
            <li><b>Marca:</b><xsl:value-of select="/catalog/brands/brand[@id=@brand]"/></li>
            <li><b>Precio:</b><xsl:value-of select="price"/></li>
            <xsl:if test="exists(discount)">
              <li><b>Descuento:</b><xsl:value-of select="discount"/></li>
              <li><b>Precio con Descuento:</b><xsl:value-of select="price"/>-<xsl:value-of select="discount"/></li>         
            </xsl:if>
            <li><b>Precio con IVA:</b><xsl:value-of select="price"/>+<xsl:value-of select="price"/>/100*21</li>
            
            <xsl:choose>
              <xsl:when test="price &lt; 150">
                <li style="color: purple;">(Posible oferta)</li>
              </xsl:when>
              <xsl:otherwise>
                <li style="color: blue;">(Precio Tope de Gama)</li>
              </xsl:otherwise>
            </xsl:choose>
            
            <li><b>Imagen:</b><img alt="{image}" src="{concat('/images/', image)}" /></li>
            <li><b>Url:</b><xsl:value-of select="url"/></li>
            </div>
            
            
          </xsl:for-each>
        </ul>
        <footer>
          <p><xsl:value-of select="@authors"/></p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>