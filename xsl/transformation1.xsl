<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  
  <!-- Variable to store catalog data -->
  <xsl:variable name="catalog" select="document('../xml/data.xml')"/>
  
  <!-- Template to match catalog and display products/services -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Product Catalog</title>
      </head>
      <body>
        <h1>Product Catalog</h1>
        <!-- List of products/services -->
        <ul>
          <xsl:value-of select="$catalog/category/products/product"/>
        </ul>
        <!-- Total number of products/services -->
        <p>Total number of products/services: <xsl:value-of select="count($catalog/category/products/product)"/></p>

    
        <!-- Template to match each product and display details -->
        <xsl:for-each select="$catalog/catalog">
            <li>
            <a href="{url}">
                <xsl:value-of select="name"/>
            </a>
            <!-- Price -->
            <p>Price: <xsl:value-of select="price"/></p>
            <!-- Price after VAT tax -->
            <p>Price after VAT tax: <xsl:value-of select="price * 1.2"/></p>
            <!-- Discount -->
            <p>Price after 30% discount: <xsl:value-of select="price * 0.7"/></p>
            <xsl:choose>
              <xsl:when test="price > 1000">
                <p style="color: green;">SALE</p>
              </xsl:when>
              
              <xsl:otherwise>
                <p style="color: red;">Limited time</p>
              </xsl:otherwise>
            </xsl:choose>
            </li>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
