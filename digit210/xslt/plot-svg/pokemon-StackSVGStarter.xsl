<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="xml"/>
    
    <xsl:variable name="xml-tree" select="doc('pokemonMoves.xml')"/>
    <xsl:variable name="totalCount" select="$xml-tree//category => count()"/>
    <xsl:variable name="pokemonCategories" select="$xml-tree//category => distinct-values()"/>
    <!-- text strings of the distinct categories -->
    <xsl:variable name="countCats" select="$pokemonCategories => count()"/>
    
    
    <xsl:template match="/">
        <svg xmlns="http://www.w3.org/2000/svg" height="100%" width="100%" viewbox="0 0 1000 1000">
            <g transform="translate(120, 350) scale(.45)">
                <xsl:comment>
                    Call some variables in here to see what they are.
                    Wait...what are the categories? <xsl:value-of select="$pokemonCategories"/>
                    Count of categories in Pokemon Moves file: <xsl:value-of select="$countCats"/>
                </xsl:comment>
                
                <!--Red "total" bubble and its labels-->
                <g>
                    <circle cx="0" cy="0" r="{$totalCount div 4}" fill="red"/>
                    <line x1="0" x2="140" y1="0" y2="250" style="stroke:red;stroke-width:10"/>
                    <text x="150" y="270" font-size="35"><xsl:value-of select="$totalCount"/> Total Moves</text>
                </g>
                <text x="-120" y="-480" font-size="70">Pokemon Move Types by Bubble</text>
                
                <xsl:variable name="sortedPokemon" as="xs:string+">
                    <xsl:for-each select="$pokemonCategories">
                        <xsl:sort select="$xml-tree//move[category=current()] => count()" 
                            order="descending"/>
                        <xsl:value-of select="current()"/>
                    </xsl:for-each>                   
                </xsl:variable>
                <xsl:comment>
                    SORTED pokemon:: <xsl:value-of select="$sortedPokemon"/>
                </xsl:comment>
                
                
                <xsl:for-each select="$sortedPokemon">
                    <xsl:variable name="currentValue" select="current()"/>
                    <xsl:variable name="currentCount" select="$xml-tree//move[category=current()] => count()"/>
                    <comment><xsl:value-of select="$currentValue"/><xsl:value-of select="$currentCount"/></comment>
                    
                    
                        
                    <xsl:variable name="sortPosition" select="position()"/>
                    <xsl:variable name="previousCounts" as="xs:integer+">
                        <xsl:choose>
                            <xsl:when test="$sortPosition gt 1">
                                <xsl:for-each select="$sortedPokemon[position() lt $sortPosition]">
                                    <xsl:value-of 
                                        select="$xml-tree//move[category=current()] => count()"/>
                                </xsl:for-each>
                            </xsl:when>  
                            <xsl:otherwise>
                                <xsl:value-of select="0"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    
                    <xsl:comment>              
                        All the previous counts: <xsl:value-of select="$previousCounts"/>
                    </xsl:comment>
                    
                    
                    <xsl:variable name="x-stacker" as="xs:float" select="sum($previousCounts) * 1.75"/>
                    <xsl:variable name="color" select="($xml-tree//move[category=current()] => count()) div ($xml-tree//move => count())"/>
                    <xsl:variable name="amplitude" select="(position()+1)*10"/>
                    <!-- Stacker mod made to stretch out text so it doesn't overlap -->
                    <xsl:variable name="stacker-mod" select="position() * position() * (position() div 20)"/>
                    <!-- line has one static end and the other animated in the same way as their respective bubble -->
                    <line x1="{$x-stacker + $stacker-mod}" x2="{$x-stacker}" y1="-300" y2="0" style="stroke:rgb({2550 * $color}, {1530 * $color}, 204);stroke-width:6">
                        <animate
                            attributeName="y2"
                            values="0;{$amplitude};0;{-$amplitude};0"
                            begin="{position() div 8}"
                            dur="4s"
                            repeatCount="indefinite"
                        />
                    </line>
                    <!-- This is the baby line under each number -->
                    <line 
                        x1="{$x-stacker - $currentCount div 2 + $stacker-mod}" 
                        x2="{$x-stacker + $currentCount div 2 + $stacker-mod}" 
                        y1="-300" y2="-300" 
                        style="stroke:rgb({2550 * $color}, {1530 * $color}, 204);stroke-width:6"/>
                    
                    <!-- Bubbles -->
                    <circle 
                        cx="{$x-stacker}" cy="0" 
                        r="{$currentCount}" 
                        fill="rgb({2550 * $color}, {1530 * $color}, 204)">
                        <animate
                            attributeName="cy"
                            values="0;{$amplitude};0;{-$amplitude};0"
                            begin="{position() div 8}"
                            dur="4s"
                            repeatCount="indefinite"
                        />
                    </circle>
                    
                    <!-- Numbered label items -->
                    <g transform="translate({$x-stacker + $stacker-mod},-335)">
                        <text text-anchor="middle" font-size="25"><xsl:value-of select="$currentValue"/></text>
                        <text text-anchor="middle" font-size="25" y="30"><xsl:value-of select="$currentCount"/></text>
                        
                    </g>
                </xsl:for-each>
                
                
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>