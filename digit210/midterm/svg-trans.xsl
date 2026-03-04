<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:variable name="x-spacer" select="10"/>
    <xsl:variable name="avg-words" select="1368 div 159"/>
    
    <xsl:template match="/">
        <svg viewBox="0 0 600 1000" xmlns="http://www.w3.org/2000/svg">
            <g transform="translate(-650, 300)">
                <text y="80" font-size="40">Word Count Per Section</text>
                
                <g transform="translate(0, 480)">
                    <line x1="0" y1="-{$avg-words * 25}" x2="1650" y2="-{$avg-words * 25}" style="stroke: maroon; stroke-width:1px"/>
                <text x="1660" y="-{$avg-words * 25 - 4}" font-size="16">Avg. Word Count: 8.6</text>
                <!-- section squares -->
                <xsl:for-each select="//section">
                    <xsl:variable name="wordCounts" select="./text/@WC"/>
                    <xsl:variable name="curSum" select="sum($wordCounts)"/>
                    <xsl:comment><xsl:value-of select="$curSum"/></xsl:comment>
                    <rect x="{position() * $x-spacer}" y="-{$curSum * 25}" height="10" width="10" fill="green"/>
                </xsl:for-each></g>
            </g>
        </svg>
    </xsl:template>
</xsl:stylesheet>