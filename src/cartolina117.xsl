<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:fn="http://www.w3.org/2005/xpath-functions">

	<xsl:output method="html"/>

    <xsl:template match="/tei:teiCorpus">
        <html>
            <head>
                <title>Progetto codifica di testi</title>
                <link href="style.css" rel="stylesheet" type="text/css"/>
                <script src="javascript-2.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/maphilight/1.4.0/jquery.maphilight.min.js"></script>
            </head>
            <body>
                <header>    
                    
                    <a class="pulsante" href="main.html">Torna alla Home</a>  
                </header>
                
                <div id="immagineFacs">
                    <img src="IMG/117retro.jpg" id="retro117" usemap="#retro117"/>
                    <map name="retro117">
                        <xsl:apply-templates select="tei:TEI[@xml:id='cartolina117']//tei:facsimile/tei:surface[@xml:id='retro117']"/>
                    </map>
                </div>
                
                    
                <div id="quadrato">
                    
                    <div id="testoFacs">
                        <div id="testoCartolina">
                            <h2><xsl:text>Testo presente sulla cartolina</xsl:text></h2>
                            <table class="cartolina">
                                <tr>
                                    <td>
                                    <div class="idnoFacs">
                                            <xsl:apply-templates select="tei:TEI[@xml:id='cartolina117']//tei:body//tei:div[@type='codice']"/>
                                        </div> 
                                        
                                        <div id="ruota" class="ruota">  
                                            <xsl:apply-templates select="//tei:text[@xml:id='c117']/tei:body//tei:div[@type='message']"/>
                                        </div>
                                    </td>
                                    <td>
                                        <xsl:apply-templates select="//tei:text[@xml:id='c117']/tei:body//tei:div[@type='message']//tei:stamp"/>
                                        <xsl:apply-templates select="//tei:text[@xml:id='c117']/tei:body//tei:div[@type='destination']//tei:address"/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <button id="pulsanteRuota">Ruota</button>
                        <div id="timbriCartolina">
                            <h2><xsl:text>Timbri e francobolli:</xsl:text></h2>
                            <xsl:apply-templates select="//tei:text[@xml:id='c117']/tei:body//tei:div[@type='destination']//tei:stamp"/>
                           
                            <br />
                            <xsl:apply-templates select="//tei:text[@xml:id='c117']/tei:body//tei:div[@type='timbrodue']//tei:stamp"/>
                           
                        </div>
                        
                    </div>
                    
                </div>
                <div id="testoCartolinaTypo">
                    <h2><xsl:text>Testo stampato sulla cartolina:</xsl:text></h2>
                    <div id="testoStampato">
                        <xsl:apply-templates select="//tei:text[@xml:id='c117']/tei:body//tei:div[@type='tipografia']"/>
                    </div>
                </div>
            </body> 
        </html>
    </xsl:template>

    <xsl:template match="tei:surface[@xml:id='retro117']">
		<xsl:for-each select="tei:zone">
			<area shape="rect" class="classearea1">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@xml:id"/>
                </xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="./@ulx"/>, 
					<xsl:value-of select="./@uly"/>,
					<xsl:value-of select="./@lrx"/>, 
					<xsl:value-of select="./@lry"/> 
				</xsl:attribute>
			</area>	
		</xsl:for-each>
	</xsl:template> 

    <xsl:template match="tei:stamp[@type='tipografia']">
        
        <span class="facs"> 
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>                
            <xsl:apply-templates/>   
        </span>
        

        <xsl:text>-</xsl:text>
        
    </xsl:template>

    <xsl:template match="tei:front//tei:p">
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:div[@type='message']//tei:span">
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:dateline">
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:addrLine">
        <br/>
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
        
    </xsl:template>

    <xsl:template match="tei:stamp[@type='postmark']">
        
        <strong><xsl:text>Testo presente sul timbro: </xsl:text></strong><span class="facs"><xsl:attribute name="id"><xsl:value-of select="./@facs"/></xsl:attribute><xsl:apply-templates select="./tei:mentioned"/><br/></span>
        <strong><xsl:text>Data spedizione: </xsl:text></strong><span class="facs"><xsl:attribute name="id"><xsl:value-of select="./@facs"/></xsl:attribute><xsl:apply-templates select="./tei:date"/><br/></span>
        <strong><xsl:text>Orario spedizione: </xsl:text></strong><span class="facs"><xsl:attribute name="id"><xsl:value-of select="./@facs"/></xsl:attribute><xsl:apply-templates select="./tei:time"/><br/></span>
   
    
    </xsl:template>
    <br />
   <xsl:template match="tei:stamp[@type='stamp']">
   <strong><xsl:text>Testo presente sul secondo timbro: </xsl:text></strong><span class="facs"><xsl:attribute name="id"><xsl:value-of select="./@facs"/></xsl:attribute><xsl:apply-templates select="./tei:mentioned"/><br/></span>
  </xsl:template>
    
    <xsl:template match="tei:gap">
        <div class="tooltip"> <span class="tooltiptext">incomprensibile</span><xsl:text>[...]</xsl:text></div>
    </xsl:template>




   
   
    

        
    <xsl:template match="tei:unclear[@reason='faded']">
        <div class="tooltip"> <span class="tooltiptext">non chiaro</span><span class="unclear"><xsl:value-of select="."/></span></div>
    </xsl:template>
    <xsl:template match="tei:unclear[@reason='ink blot']">
        <div class="tooltip"> <span class="tooltiptext"> macchia di inchiostro </span><span class="unclear"><xsl:value-of select="."/></span></div>
    </xsl:template>
    <xsl:template match="tei:damage[@agent='ink blot']">
        <div class="tooltip"> <span class="tooltiptext"> macchia di inchiostro </span><span class="unclear"><xsl:value-of select="."/></span></div>
    </xsl:template>
    

    <xsl:template match="tei:stamp[@type='postage']">
        <strong><xsl:text>Francobollo: </xsl:text></strong>
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:div[@facs='#secondotimbro117']">
        <strong><xsl:text>Testo presente sul secondo timbro: </xsl:text></strong>
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

    <xsl:template match="tei:expan">
        <span class="expan"><xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:lb">
        <br/><xsl:value-of select="."/>
    </xsl:template>

    <xsl:template match="tei:idno">
        <span class="facs">
            <xsl:attribute name="id">
                <xsl:value-of select="./@facs"/>
            </xsl:attribute>
            <xsl:value-of select="."/>
        </span>
    </xsl:template>

</xsl:stylesheet>