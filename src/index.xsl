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
                <script src="javascript.js"></script>
            </head>
            
            

<main id="main">
</main>

            
                <body>
                <header class="titolo">
                    <xsl:value-of select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </header>
                <div id="corpo">
                    <xsl:for-each select="tei:TEI">
                    <br/>   
                             <br/>
                             <br/>   
                             <br/>
                        <div class="cartolina">

                            <xsl:call-template name="titoli"/>
                             <br/>   
                             <br/> 
                            <div class="immagini">
                                <span class="fronte"><xsl:apply-templates select="tei:facsimile/tei:surface[@type='fronte']/tei:graphic"/> </span>
                                
                                
                            </div>
                            
                            
                                    
                            <table>
                                
                                <tr>
                                    <td>
                                        <div class="descrizioneImmagini">
                                            <h2><xsl:text>Descrizione Cartolina: </xsl:text> </h2> <xsl:value-of select="tei:text/tei:body//tei:figDesc"/>
                                            <div class="note">
                                        <h2> <xsl:text>Note: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:notesStmt/tei:note"/>
                                    </div>   
                                         </div>
                                    </td>
                                         <td>
                                        <div class="informazioni">
                                            <h2><xsl:text>Codice identificativo: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:idno"/><br/> <br/>
                                            <h2><xsl:text>Collocazione: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:repository"/> <xsl:text>, </xsl:text>
                                            <xsl:value-of select="tei:teiHeader//tei:settlement"/><xsl:text>, </xsl:text>
                                            <xsl:value-of select="tei:teiHeader//tei:country"/>

                                            <br/> <br/>
                                            <h2><xsl:text>Tipologia: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:summary"/><br/> <br/>
                                            <h2><xsl:text>Lingua: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:language"/><br/> <br/>
                                            <h2><xsl:text>Dimensioni: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:dimensions//tei:height"/>
                                            <xsl:text> x </xsl:text> <xsl:value-of select="tei:teiHeader//tei:dimensions//tei:width"/> <xsl:text> cm </xsl:text> <br/> <br/>
                                            <h2><xsl:text>Materiale: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:material"/> <br/> <br/>
                                            <h2><xsl:text>Condizioni: </xsl:text></h2><xsl:value-of select="tei:teiHeader//tei:condition"/><br/> <br/>
                                            <h2><xsl:text>Spedizione: </xsl:text></h2><xsl:text>La cartolina è stata spedita da </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='sent']/tei:persName"/><xsl:text> presso </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='sent']/tei:placeName"/><xsl:text> a 
                                            </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='received']/tei:persName"/>
                                            <xsl:text> presso </xsl:text><xsl:value-of select="tei:teiHeader//tei:profileDesc//tei:correspAction[@type='received']/tei:placeName"/>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="corpoTesto">
                                                
                                            <h2><xsl:text>Testo cartolina:</xsl:text></h2>
                                            <p class="estendi"><i class="clickExpan"><xsl:text>Clicca qui</xsl:text></i><xsl:text> per estendere le </xsl:text><u><xsl:text>abbreviazioni</xsl:text></u></p>
                                            <p class="abbrevia"><i class="clickAbbr"><xsl:text>Clicca qui</xsl:text></i><xsl:text> per abbreviare </xsl:text><u><xsl:text>le parole</xsl:text></u></p>
                                            <div class="text">
                                                <div class="codiceIdno">
                                                    <xsl:value-of select="tei:text/tei:body//tei:div[@type='codice']"/>
                                                </div>
                                                 <xsl:apply-templates select="tei:text/tei:body//tei:div[@type='message']"/>
                                             
                                                <div class="linea"/>
                                               <h2>  <xsl:text>  Indirizzo spedizione e Timbro  </xsl:text> </h2>
                                                <div class="spedizione">
                                                    <xsl:apply-templates select="tei:text/tei:body//tei:div[@type='destination']"/>  
                                                </div>
                                               
                                            </div>
                                                
                                        </div>
                                    </td>
    
                                </tr>
                                 
                            </table> 
                            <div class="bloccoFacsimile">
                                <xsl:call-template name="originali"/>
                                
                            </div>
                        </div>
                        <div class="divisore"/>
                    </xsl:for-each>
                    <br/>
                    <br/>
                    <br/>
                    <br/>
                    <br/>

                    
                    <div id="footer2">
                        <xsl:text>Sito realizzato per l'esame di </xsl:text> <xsl:text>Codifica di testi a.a. 2020/2021</xsl:text>
                        <p><xsl:value-of select="tei:teiHeader//tei:respStmt"/></p>
                        <xsl:for-each select="tei:teiHeader//tei:editionStmt//tei:respStmt">
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                        <p><xsl:value-of select="tei:teiHeader//tei:edition"/></p>
                        <br/>
                        <br/>
                        <br/>
                       
                    </div>
                    <div id="footer3">
                        <p><xsl:value-of select="tei:teiHeader//tei:publicationStmt/tei:publisher"/><xsl:text> - </xsl:text><xsl:value-of select="tei:teiHeader//tei:publicationStmt/tei:pubPlace"/></p>
                        <p><xsl:value-of select="tei:teiHeader//tei:publicationStmt//tei:availability"/></p>
                    </div>
                    <div class="divisore"/>
                </div>
                
            </body> 
        </html>
    </xsl:template>
    <xsl:template match="tei:opener">
		<xsl:apply-templates select="./tei:dateline"/><br/>
                       
	</xsl:template>
    <xsl:template name="titoli" match="tei:teiCorpus/tei:TEI">
        <div class="titolo" id="{@xml:id}">
            <h1><xsl:value-of select="tei:teiHeader//tei:title"/></h1>
        </div>
    </xsl:template>

    <xsl:template match="tei:graphic">    
        <img src="{@url}" />
    </xsl:template>

    

    

    <xsl:template match="tei:lb">
        <xsl:value-of select="."/> <br/>
    </xsl:template>

    <xsl:template match="tei:stamp[@type='postmark']">
        
        <xsl:text>  Testo presente sul timbro: </xsl:text><xsl:apply-templates select="./tei:mentioned"/><br/>
        <xsl:text>  Data spedizione:  </xsl:text><xsl:apply-templates select="./tei:date"/><br/>
        <xsl:text>  Orario spedizione:  </xsl:text><xsl:apply-templates select="./tei:time"/><br/>
        <div class="linea"/>
    </xsl:template>

    <xsl:template match="tei:gap">
        <xsl:text>[ ]</xsl:text>
    </xsl:template>

    <xsl:template match="tei:unclear">
        <span class="unclear"> <xsl:value-of select="."/></span>
    </xsl:template>

    <xsl:template match="tei:stamp[@type='postage']">
        <xsl:value-of select="."/>
        <div class="linea"/>
    </xsl:template>

    <xsl:template match="tei:address">
        <xsl:for-each select="tei:addrLine">
            <xsl:apply-templates select="."/><br/>
        </xsl:for-each>
            
    </xsl:template>

    <xsl:template match="tei:choice">
        <span class="choice"><span class="abbr"><xsl:value-of select="tei:abbr"/></span><span class="expan"><xsl:value-of select="tei:expan"/></span></span>
    </xsl:template>

    

    <xsl:template name="originali" match="tei:teiCorpus/tei:TEI">
        <a class="pulsante" href="{@xml:id}.html"> Retro cartolina </a>
    </xsl:template>
</xsl:stylesheet>
