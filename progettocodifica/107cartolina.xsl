<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"> 
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">

    <html>
        <head>
            <link rel= "stylesheet" href="stile.css"/>

            
        </head>

    <script src="javascript.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/maphilight/1.4.0/jquery.maphilight.min.js"></script>
    <body>
        
        <header>
           <nav role="navigation">
                <div id="menu-hamburger">
                <input type="checkbox" />
                <span> </span>
                <span> </span>
                <span> </span>
                
            <ul id="menu">
            <a href="index.html"><li>Home</li></a>
      <a href="107.html"><li>Cartolina 107</li></a>
      <a href="117.html"><li>Cartolina 117</li></a>
      
    </ul>
  </div>
</nav>
<h1 id="titolo-generico" class="titolo-generico">
   <xsl:value-of select="//tei:TEI[1]/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
</h1>
<br/>
<br/>
</header>
<div class="sottotitolo">
Passa il cursore sopra la cartolina per evidenziare le corrispondenti parti di testo.
Le parole tra parentesi rappresentano le forme estese della corrispondente parola sulla cartolina.
Le parentesi [..] rappresentano parti di testo non chiare.
<br/>
<br/>

</div>
<div id="immagine-facsimile-retro">
                    <img src="IMG/107retro.jpg" id="retro107" usemap="#retro107"/>
                    <map name="retro107">
                        <xsl:apply-templates select="//tei:TEI[1]//tei:facsimile//tei:surface[@type='retro']"/>
                    </map>
</div>
<div id="informazioni-cartolina">
<h2> Informazioni </h2>

<xsl:for-each select="tei:teiCorpus/tei:TEI[1]">
<xsl:apply-templates select="."/>

</xsl:for-each>
</div> 


<div id="immagine-facsimile-fronte">
                    <img src="IMG/107fronte.jpg" id="fronte107" usemap="#fronte107" class="fronte107"/>
                    
                        
                    
</div>

<footer>
    <div id="contenuto-footer">
    
        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:resp"/> <xsl:text> : 
        </xsl:text>        
        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt[2]/tei:name"/> <br/>
        <xsl:apply-templates select="tei:teiCorpus/tei:teiHeader/tei:fileDesc"/> <br/>
        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:editionStmt/tei:respStmt[4]" /> 
    </div>
    <div id="contenuto-footer-due">
    <h3> Distribuito da  <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:distributor" /> -
    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine[1]" /> -
    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:address/tei:addrLine[2]" />
    </h3>
     ©  <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:publicationStmt/tei:availability/tei:p" /> © 
    <br/>
    
    
        </div>
        </footer>     
    </body>
 </html>
 </xsl:template>

<!--template cartolina-->
<xsl:template match="tei:teiCorpus/tei:TEI">
<div id="prova">
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']/tei:div[@type='codice']/tei:p/tei:num"/>
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='stamp']//tei:p[1]/tei:stamp"/>
       <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='stamp']//tei:p[2]/tei:stamp"/>
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='message']/tei:opener"/>
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='message']//tei:closer/tei:salute"/>
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='message']//tei:closer//tei:signed"/>
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='destination']"/>
        <xsl:apply-templates select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='francobolli']/tei:p"/>
         <xsl:apply-templates select="tei:teiHeader/tei:fileDesc//tei:notesStmt/tei:note"/>
         </div>
</xsl:template>




        

  <!--template footer-->
    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        <xsl:apply-templates select="tei:editionStmt/tei:respStmt[1]" />
        <xsl:apply-templates select="tei:editionStmt/tei:respStmt[2]" />
        <xsl:apply-templates select="tei:editionStmt/tei:respStmt[3]" /> 
        <xsl:apply-templates select="tei:titleStmt/tei:respStmt[1]" />  
    </xsl:template>

<!--template edizione-->
   <xsl:template match="tei:editionStmt/tei:edition">
       
        <xsl:value-of select="."/> <br/>
   </xsl:template>

    <!--template resposabili edizione-->
 <xsl:template match="tei:editionStmt/tei:respStmt">
    
   <xsl:value-of select="tei:resp"/> :
   <xsl:value-of select="tei:name"/> 
   <br/>
 </xsl:template>


<!-- cartolina facsimile-->

		 <xsl:template match="//tei:TEI[1]//tei:facsimile//tei:surface[@type='retro']">
		<xsl:for-each select="tei:zone">
			<area shape="rect" >
                <xsl:attribute name="id">
                    <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
				<xsl:attribute name="coords">
					<xsl:value-of select="@ulx"/>, 
					<xsl:value-of select="@uly"/>,
					<xsl:value-of select="@lrx"/>, 
					<xsl:value-of select="@lry"/> 
				</xsl:attribute>
			</area>	
		</xsl:for-each>
	</xsl:template> 
<!--  testo tipografia  -->

<xsl:template match="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='stamp']//tei:p[2]/tei:stamp">
    
      <div class="facsimile">  
                        <xsl:attribute name="id">
                        <xsl:value-of select="@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
        </div>
<br/>
</xsl:template>
<xsl:template match="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='stamp']//tei:p[1]/tei:stamp">
      <div class="titoli-informazioni">  <xsl:text> Tipografia: </xsl:text> </div>
      <div class="facsimile">  
                        <xsl:attribute name="id">
                        <xsl:value-of select="@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
        </div>
 
</xsl:template>

<!-- numero cartolina-->
<xsl:template match="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='codice']/tei:p/tei:num">
     <br /> <div class="titoli-informazioni"> <xsl:text> Codice identificativo: </xsl:text> </div>
         <div class="facsimile">  <xsl:attribute name="id">
                        <xsl:value-of select="../../@facs"/>
                    </xsl:attribute>
                    <xsl:value-of select="."/>
        </div>
       
</xsl:template>

    
    
    <!-- messaggio apertura/chiusura/firma-->
<xsl:template match="//tei:text[@xml:id='c107']//tei:div[@type='message']/tei:opener">
    <div class="titoli-informazioni">  <xsl:text> Messaggio: </xsl:text> </div>
      
                <div class="facsimile">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/> <br/>
                 
                 </div> 
</xsl:template>
        
    
    <xsl:template match="//tei:text[@xml:id='c107']//tei:div[@type='message']//tei:closer/tei:salute">
    <div class="facsimile">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/> <br/>
                 </div> 
    </xsl:template>

    <xsl:template match="//tei:text[@xml:id='c107']//tei:div[@type='message']//tei:closer//tei:signed">
    <div class="facsimile">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:value-of select="."/> <br/>
                 </div> 
           

       <br/>
    </xsl:template>




<!-- francobollo e timbro -->
<xsl:template match="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='francobolli']/tei:p//tei:stamp[1]">
      <div class="titoli-informazioni"> <xsl:text> Francobollo e Timbro: </xsl:text> </div>
                        
                <div class="facsimile">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                   
                     
                     <xsl:text> Testo Timbro: </xsl:text>
                        <xsl:value-of select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='francobolli']/tei:p//tei:stamp[1]/tei:mentioned"/>
                        <xsl:choose>
                        <xsl:when test="//tei:gap">
                        <xsl:text> [..] </xsl:text>
                        </xsl:when>
                        </xsl:choose>
                    <br/>
                     <xsl:text> Data Timbro: </xsl:text>
                        <xsl:value-of select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='francobolli']/tei:p//tei:stamp[1]//tei:date"/>
                   <br/>
                   
                     <xsl:text> Orario Timbro: </xsl:text>
                        <xsl:value-of select="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='francobolli']/tei:p//tei:stamp[1]//tei:time"/>
                      
                 
                 </div> 
            
</xsl:template>
<xsl:template match="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='francobolli']/tei:p//tei:stamp[2]">
     
                        
                <div class="facsimile">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                <xsl:value-of select="."/>
                <br/>

</div> 
            
</xsl:template>
                    
<!-- indirizzo-->
<xsl:template match="//tei:text[@xml:id='c107']/tei:body//tei:div[@type='retro']//tei:div[@type='destination']">
<div class="titoli-informazioni">   <xsl:text> Indirizzo: </xsl:text> </div>
   <xsl:for-each select="//tei:text[@xml:id='c107']//tei:div[@type='destination']/tei:p/tei:address/tei:addrLine">
                <div class="facsimile">  
                        <xsl:attribute name="id">
                            <xsl:value-of select="@facs"/>
                        </xsl:attribute>
                        <xsl:choose> 
                        <xsl:when test="tei:choice">
                        <xsl:for-each select="tei:choice/tei:abbr">
                                    <xsl:value-of select="."/>
                        </xsl:for-each>
                        [<xsl:for-each select="tei:choice/tei:expan">
                                    <xsl:value-of select="."/>
                        </xsl:for-each>]
                        </xsl:when>
                        <xsl:when test="tei:hi[@rend='underline']">   
                        <div class="sottolineato"> <xsl:value-of select="."/>
                        <br/>
                        </div>
                        </xsl:when> 
                            <xsl:otherwise>
                            <xsl:value-of select="."/>
                            </xsl:otherwise>
                        
                        </xsl:choose>
                 </div> 
            </xsl:for-each> 
</xsl:template>

<!-- note-->
<xsl:template match="tei:teiHeader/tei:fileDesc//tei:notesStmt/tei:note">
  <div class="titoli-informazioni"> <xsl:text> Note: </xsl:text> </div>
  <div class="facsimile-note">    
                <xsl:value-of select="."/>
  </div>
</xsl:template>




</xsl:stylesheet>