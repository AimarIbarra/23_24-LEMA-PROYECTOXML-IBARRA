<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- Import the document -->
  <xsl:variable name="catalog" select="document('../xml/data.xml')"/>
  <!-- Apply the import -->
  <xsl:template match="/">
    <xsl:apply-templates select="$catalog/catalog"/>
  </xsl:template>
  
  <xsl:template match="catalog">
    <xsl:variable name="vat">21</xsl:variable>
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <title>UD6: Proyecto dirigido a la validación, formateo y transformación de documentos XML</title>
        <link rel="stylesheet" type="text/css" href="/assets/css/main.css"/> 
      </head>
      <body>
        
        <!-- Header -->
        <header id="header">
          <div class="inner">
            <a href="#" class="logo">Cocoa Products</a>
            <nav id="nav">
              <a href="/index.html">Homepage</a>
              <a href="/web/catalog.html">Catalog</a>
              <a href="/web/smartphone.html">Smartphones</a>
              <a href="/web/audio-devices.html">Audio Devices</a>
              <a href="/web/laptops.html">Laptops</a>
              <a href="/web/contact.html">Contact Us</a>
            </nav>
          </div>
        </header>
        <a href="#menu" class="navPanelToggle"><span class="fa fa-bars"></span></a>
        
        <section id="main">
          <xsl:for-each select="products">  
            <p>Total number of products/services: <xsl:value-of select="count(product)"/></p> 
          </xsl:for-each>
          <table>
            <tr>
              <th>Name</th>
              <th>Brand</th>
              <th>Price</th>
              <th>Discount (if any)</th>
              <th>Final price (VAT included)</th>
              <th>Description</th>
            </tr>

            <!-- Match only desired category -->
            <xsl:for-each select="category[categoryName = 'Laptops']/products/product">
              <tr>
                <td><xsl:value-of select="productName"/></td>
                <xsl:variable name="brandid" select="@brand"/>
                <td><xsl:value-of select="/catalog/brands/brand[@id=$brandid]"/></td>
                <xsl:variable name="price" select="price"/>

                <!-- If an element has a discount or not, display it or not, if it has a discount
                    the price has the discount applied -->
                <xsl:choose>
                  <xsl:when test="exists(discount)">
                    <td><xsl:value-of select="$price + discount"/></td>
                    <td><xsl:value-of select="discount"/></td>
                  </xsl:when>
                  <xsl:otherwise>
                    <td colspan="2"><xsl:value-of select="$price"/></td>
                  </xsl:otherwise>
                </xsl:choose>
                <td><xsl:value-of select="round($price * (1 + $vat div 100) * 100) div 100"/></td>
                <td><a href="{url}" target="_blank"><img alt="{image}" src="{concat('/images/', image)}" /></a></td>
              </tr>
            </xsl:for-each>
          </table>
        </section>
        
        <!-- Footer -->
        <footer id="footer">
          <div class="inner">
            <div class="copyright">
              &#xA9; 2024 <xsl:value-of select="@authors"/>
              <ul class="icons">
                <!-- Repository where the project is hosted -->
                <li><a href="https://github.com/AimarIbarra/23_24-LEMA-PROYECTOXML-IBARRA/tree/main" class="icon fa-github"><span class="label">Github</span></a></li>
              </ul>
              Visit the source code of this page!
            </div>
          </div>
        </footer>
        
        <!-- Scripts -->
        <script src="/assets/js/jquery.min.js"></script>
        <script src="/assets/js/skel.min.js"></script>
        <script src="/assets/js/util.js"></script>
        <script src="/assets/js/main.js"></script>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>