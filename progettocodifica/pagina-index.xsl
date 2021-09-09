<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"> 
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/">

    <html>
        <head>
            <link rel= "stylesheet" href="stile.css"/>
            
        </head>

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
    <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
</h1>
</header>

<div id="sottotitolo">
        <h2> Cartoline Artistiche dei primi del Novecento inviate da 
            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person"/>  a
            <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:listPerson/tei:person[@xml:id='OT']"/>
        </h2> 
       <p class="sottotitolo"> <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:repository"/>, <br/>
        comune di <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:settlement"/>, 
        <xsl:value-of select="tei:teiCorpus/tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:country"/>
        </p>
</div>
        <br/>
        <br/>
        <div id="contenitore_cartoline">
                    <xsl:for-each select="tei:teiCorpus/tei:TEI">
                        <div class="cartoline" id="cartolina{position()}">
                            <xsl:apply-templates select="."/>
                            </div>
                       
                    </xsl:for-each>
                        
                  
                    <xsl:for-each select="tei:teiCorpus/tei:TEI/tei:facsimile">
                     

                      <xsl:apply-templates select="tei:surface[2]"/> 
                     
                        
                    </xsl:for-each>
                   
        </div>
        <br/>
        <br/>
    
    
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
<!--template cartoline-->
    <xsl:template match="tei:teiCorpus/tei:TEI">
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
        <xsl:apply-templates select="tei:facsimile/tei:surface[1]/tei:graphic/@url" /> 
        <xsl:apply-templates select="tei:facsimile/tei:surface[2]/tei:graphic/@url" />
        <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:figure/tei:figDesc[1]" />
        <xsl:apply-templates select="tei:text/tei:body/tei:div/tei:figure/tei:figDesc[2]" />
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:notesStmt/tei:note[1]" />
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:notesStmt/tei:note[2]" />
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[1]" />
        <xsl:apply-templates select="tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno[2]" />


    </xsl:template>
     <!--template footer-->
    <xsl:template match="tei:teiCorpus/tei:teiHeader/tei:fileDesc">
        <xsl:apply-templates select="tei:editionStmt/tei:respStmt[1]" />
        <xsl:apply-templates select="tei:editionStmt/tei:respStmt[2]" />
        <xsl:apply-templates select="tei:editionStmt/tei:respStmt[3]" /> 
        <xsl:apply-templates select="tei:titleStmt/tei:respStmt[1]" />  
    </xsl:template>

 <!--template img-facsimile-->
    <xsl:template match="tei:facsimile/tei:surface/tei:graphic/@url">
          
            <xsl:element name="img" >
                <xsl:attribute name="src">
                    <xsl:value-of select="."/>
                </xsl:attribute>

               
            </xsl:element> 


    </xsl:template>

   <!--template titolo cartolina-->
    <xsl:template match="tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title">
    <div class="titolo-cartolina"> <xsl:value-of select="."/> </div>
    </xsl:template>

    
     <!--template note cartolina-->
     
     <xsl:template match="tei:teiHeader/tei:fileDesc/tei:notesStmt/tei:note">
        <details>
            <summary>
                Note:
            </summary>
            <p class="descrizione">
                <xsl:value-of select="."/>
            </p>
        </details>
   </xsl:template>

<!--template codice identificativo-->
    <xsl:template match="tei:teiCorpus/tei:TEI[1]//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno">
        <details>
            <summary>
                Codice identificativo:
            </summary>
            <p class="descrizione">
                <xsl:value-of select="."/>
            </p>
        </details>
        <a href="107.html" > <button > Maggiori Informazioni</button></a>
   </xsl:template>

   <xsl:template match="tei:teiCorpus/tei:TEI[2]//tei:teiHeader/tei:fileDesc/tei:sourceDesc/tei:msDesc/tei:msIdentifier/tei:idno">
        <details>
            <summary>
                Codice identificativo:
            </summary>
            <p class="descrizione">
                <xsl:value-of select="."/>
            </p>
        </details>
       
        
        
        <a href="117.html" > <button > Maggiori Informazioni</button></a>
       

   </xsl:template>

<!--template descrizione cartolina-->
   <xsl:template match="tei:text/tei:body/tei:div/tei:figure/tei:figDesc">
        <details>
            <summary>
                Descrizione:
            </summary>
            <p class="descrizione">
                <xsl:value-of select="."/>
            </p>
        </details>
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

    
</xsl:stylesheet>