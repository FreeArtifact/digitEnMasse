<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="4.0">
    <xsl:mode on-no-match="shallow-copy"/>
    
    <xsl:template match="text()">
        <!-- Finding all strings that preceed a semi-colon (so the speakers ideally) -->
        <xsl:analyze-string select="." regex="(^.+?:)">
            <xsl:matching-substring>
                <spkr><xsl:value-of select="regex-group(1)"/></spkr>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                
                <xsl:analyze-string select="." regex="&lt;sp&gt;(\n\[.*?\]\n)&lt;/sp&gt;" flags="s">
                    <xsl:matching-substring>
                        <nsp><xsl:value-of select="regex-group(1)"/></nsp>
                    </xsl:matching-substring>
                    <xsl:non-matching-substring>
                        <xsl:apply-templates select="."/>
                    </xsl:non-matching-substring>
                </xsl:analyze-string>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>
    </xsl:template>
</xsl:stylesheet>