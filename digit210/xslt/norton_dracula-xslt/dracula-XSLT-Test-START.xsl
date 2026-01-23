<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="yes"/>
<!-- **************************************************************************-->
<!-- 2025-11-21 ebb: This XSLT starter file is for the XSLT test in DIGIT 110. 
    Do not alter the stylesheet root element or the output line. 
    
   Your task is to transform the source XML document of Bram Stoker's novel Dracula into HTML with a 
   table of contents linked to a reading view, and styled with CSS. Your XSLT code needs to 
   * process one source XML file and output one valid and well-formed HTML file;
   * contain an HTML table  for the table of contents featuring:
        * each chapter heading
        * each chapter's distinct sorted people/characters mentioned: <person> 
        * each chapter's distinct sorted technologies mentioned: <tech>
     
   * contain internal links from the chapter headings in the table of contents to the chapter headings;
   * contain span elements in the reading view to stylize the persons and technologies mentioned. 
   * Prepare CSS to style your HTML. The XSLT should output the CSS link line to your CSS file accurately. 
   
   
    -->  
    <!-- **************************************************************************-->
  
 <xsl:template match="/">
     <html>
         <head>
             <title>Dracula</title>
             <link rel="stylesheet" type="text/css" href="style.css"/>
         </head>
         <body>
           <h1 id="top"><xsl:apply-templates select="//title"/></h1>
             
             <!-- Table of contents. -->
             <section id="contents"> 
                 <table> 
                 <tr>
                     <th>Chapter Number</th>
                     <th>Tech mentioned</th>
                     <th>Locations mentioned</th>
                     <th>People mentioned</th>
                 </tr>
                     
                     
            <!-- ebb: prepare the table of contents representing each descendant chapter heading,
                   Hint: use <xsl:apply-templates with @mode here.  -->
                     <xsl:apply-templates select="//chapter" mode="contents"/>
                        
             </table>
             </section>
             
             <!--Reading view of the chapters here. -->
             <a href="#contents" class="menu-top">Return to Table of Contents</a>
             <section id="readingView">
                 <xsl:apply-templates select="//chapter" mode="readingView"/>
<!--                <xsl:apply-templates mode="readingView" select="descendant::chapTitle"/> -->
                 <!-- ebb: process the same descendant chapter heading elements here, but this time to start processing the reading view.  -->
             </section>
        </body>
        
     </html>
 </xsl:template> 
 <xsl:template match="chapter" mode="contents">
     <tr>
         <td><a href="#{string(replace(./chapTitle, ' ', ''))}"><xsl:apply-templates select="descendant::chapTitle"/></a></td>
         <td class="table-tech"><xsl:apply-templates select="descendant::tech => distinct-values() => string-join(' , ') => normalize-space()"/></td>
         <td class="table-loc"><xsl:apply-templates select="descendant::loc => distinct-values() => string-join(' , ') => normalize-space()"/></td>
         <td class="table-person"><xsl:apply-templates select="descendant::person => distinct-values() => string-join(' , ') => normalize-space()"/></td>
     </tr>
 </xsl:template>
   
    
    
 <xsl:template match="chapter" mode="readingView">
    <section class="chapter">
        <h2 id="{string(replace(descendant::chapTitle, ' ', ''))}"><xsl:apply-templates select="descendant::chapTitle"/></h2>
        <xsl:apply-templates select="descendant::p"/>
    </section>
</xsl:template>

<xsl:template match="p">
    <p><xsl:apply-templates/></p>
</xsl:template>

    <xsl:template match="tech">
        <span class="tech"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="loc">
        <span class="loc"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="date">
        <span class="date"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="time">
        <span class="time"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="person">
        <span class="person"><xsl:apply-templates/></span>
    </xsl:template>
   <!--ebb: Continue writing template rules, some with @mode for the table of contents, and some without it for the reading view.  -->
    
 
</xsl:stylesheet>