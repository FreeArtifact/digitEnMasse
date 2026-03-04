<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="30"/>
    
    <xsl:template match="/">
        <svg viewBox="0 0 600 1000" xmlns="http://www.w3.org/2000/svg">
            <g transform="translate(-500, 300)">
                <xsl:for-each select="//section">
                    <xsl:variable name="wordCounts" select="./text/@WC"/>
                    <xsl:comment><xsl:value-of select="$wordCounts"/></xsl:comment>
                    <rect x="{position() * $x-spacer}" y="0" height="200" width="20" fill="green"/>
                </xsl:for-each>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>