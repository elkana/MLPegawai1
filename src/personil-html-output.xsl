<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:variable name="smallcase" select="'abcdefghijklmnopqrstuvwxyz'" />
  <xsl:variable name="uppercase" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />

	<xsl:variable name="foto1">		
		<xsl:choose>
			<xsl:when test="exists(doc(concat('/personil/',/personil_kemhan/file_foto_1)))">
				<xsl:value-of select="concat('/v1/documents?uri=', encode-for-uri(concat('/personil/',/personil_kemhan/file_foto_1)))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('/v1/documents?uri=', encode-for-uri('/personil/foto/profile_no_image.jpg'))"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
			
	<xsl:variable name="foto2">
		<xsl:choose>
			<xsl:when test="exists(doc(concat('/personil/',/personil_kemhan/file_foto_2)))">
				<xsl:value-of select="concat('/v1/documents?uri=', encode-for-uri(concat('/personil/',/personil_kemhan/file_foto_2)))"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('/v1/documents?uri=', encode-for-uri('/personil/foto/profile_no_image.jpg'))"/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:variable>
	
  <xsl:output
    method="html"
    doctype-public="XSLT-compat"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />  
  
  <xsl:template match="/">
    <html>
    <head>
     <link href="https://fonts.googleapis.com/css?family=Lato:300" rel="stylesheet" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>    
    <body>		
	
		<div class="headerTop">
	      <h1>RIWAYAT HIDUP SINGKAT</h1>
		</div>    		
		
		<div class="biodata">
		<br/>
	    <table class="table table-hover table-striped table-condensed">
		    <tr>    
			    <xsl:apply-templates select="personil_kemhan/file_foto_1" />
			    <xsl:apply-templates select="personil_kemhan/nopeg" />
				<xsl:apply-templates select="personil_kemhan/nip" />
		    </tr>
		    <tr>    
			    <xsl:apply-templates select="personil_kemhan/nama" />
				<xsl:apply-templates select="personil_kemhan/gelar" />
				<!--<xsl:apply-templates select="personil_kemhan/nrp_nip" />-->
		    </tr>   
		    <tr>    
			    <xsl:apply-templates select="personil_kemhan/agama" />
				<xsl:apply-templates select="personil_kemhan/tempat_lahir" />
		    </tr>      
		    <tr>    
			    <xsl:apply-templates select="personil_kemhan/jenis_kelamin" />
				<xsl:apply-templates select="personil_kemhan/tgl_lahir" />
		    </tr>   
		    <tr>    
				<xsl:apply-templates select="personil_kemhan/jenis_personil" />
				<xsl:apply-templates select="personil_kemhan/kategori" />
		    </tr>   
		    <tr>    
				<xsl:apply-templates select="personil_kemhan/satker" />
				<xsl:apply-templates select="personil_kemhan/unit_organisasi" />
		    </tr>         			
		    <tr>    
			    <xsl:apply-templates select="personil_kemhan/pangkat" />
				<xsl:apply-templates select="personil_kemhan/tmt_pangkat" />
		    </tr>       
		    <tr>    
				<!--<xsl:apply-templates select="personil_kemhan/kategori_pangkat" />-->
				<xsl:apply-templates select="personil_kemhan/pangkat_corps" />
				<xsl:apply-templates select="personil_kemhan/angkatan_korps" />
		    </tr>       
		    <tr>    
				<xsl:apply-templates select="personil_kemhan/jabatan" />
				<xsl:apply-templates select="personil_kemhan/kode_jabatan" />
		    </tr>     
		    <tr>    
				<xsl:apply-templates select="personil_kemhan/eselon_jabatan" />
				<xsl:apply-templates select="personil_kemhan/tmt_jabatan" />
		    </tr> 			
		    <tr>    
				<xsl:apply-templates select="personil_kemhan/sumber_pa_gol_3" />
				<xsl:apply-templates select="personil_kemhan/tmt_pa_gol_3" />
		    </tr>   			          
		    <tr>    
			    <xsl:apply-templates select="personil_kemhan/tmt_tni" />
				<xsl:apply-templates select="personil_kemhan/tmt_kemhan" />
		    </tr> 			   	
		</table>
		
		<br/>
		<br/>
		<br/>
		
		</div>
		
	  <xsl:value-of select="concat('/v1/documents?uri=', encode-for-uri(concat('/personil/',/personil_kemhan/file_foto_1)))"/>

      <div class="accordion">
        <ul>
          <xsl:apply-templates select="personil_kemhan/riwayat_pangkat" />
          <xsl:apply-templates select="personil_kemhan/riwayat_jabatan" />
          <xsl:apply-templates select="personil_kemhan/riwayat_pendidikan/pendidikan_umum" />
          <xsl:apply-templates select="personil_kemhan/riwayat_pendidikan/pendidikan_pembentukan" />
          <xsl:apply-templates select="personil_kemhan/riwayat_penugasan" />
          <xsl:apply-templates select="personil_kemhan/riwayat_tanda_jasa" />
          <xsl:apply-templates select="personil_kemhan/riwayat_bahasa" />
          <xsl:apply-templates select="personil_kemhan/riwayat_keluarga" />
        </ul>
      </div>

	  <br/>
	  <br/>
	  <br/>
		
	  </body>
	  </html>
  </xsl:template>

  <xsl:template match="personil_kemhan/*" priority="1">
      <td class="tableInfo"><xsl:value-of select="translate(translate(name(.),'_',' '), $smallcase, $uppercase)"/></td>
      <td class="tableColon">:</td>
      <td class="tableValue"><xsl:value-of select="."/></td>
  </xsl:template>

  <xsl:template match="/personil_kemhan/*[contains(name(),'file_foto')]" priority="2">
	<td rowspan="13" class="tableImage">
    <div id="slideshow-wrap">
        <input type="radio" id="button-1" name="controls" checked="checked"/>
		<label for="button-1"></label>
        <input type="radio" id="button-2" name="controls"/>
		<label for="button-2"></label>
        <label for="button-1" class="arrows" id="arrow-1">></label>
        <label for="button-2" class="arrows" id="arrow-2">></label>
        <div id="slideshow-inner">
            <ul>
                <li id="slide1">
                    <img src="{$foto1}" />
                </li>
                <li id="slide2">
                    <img src="{$foto2}" />
                </li>
            </ul>
        </div>
    </div>
	</td>
  </xsl:template>

  <xsl:template match="/personil_kemhan/*[contains(name(),'riwayat')] " priority="3">
	  <li>
		
		<!-- Make Riwayat Pangkat checked -->
		<xsl:choose>
		  <xsl:when test="*[contains(name(.),'pangkat')]">
			<input type="radio" name="select" class="accordion-select" checked="checked"></input>
		  </xsl:when>   
		  <xsl:otherwise>
			<input type="radio" name="select" class="accordion-select"></input>
		  </xsl:otherwise>
		</xsl:choose>
			  
        <div class="accordion-title">
          <span><xsl:value-of select="translate(translate(name(.),'_',' '), $smallcase, $uppercase)"/></span>
        </div>        
        <div class="accordion-content">
          <table class="tableWidth1">
            <xsl:for-each select="node()">
			  <!-- Column Header -->
			  <xsl:if test="position()=1">
				<tr>
				  <xsl:for-each select="./*">   
					  <th>              
						  <span><xsl:value-of select="translate(translate(name(.),'_',' '), $smallcase, $uppercase)"/></span>
					  </th>
				  </xsl:for-each>        
				</tr>
			  </xsl:if>                  
			  
              <tr>
              <xsl:for-each select="./*">                         
                <td>
                  <xsl:value-of select="." />
                </td>
              </xsl:for-each>          
              </tr>
            </xsl:for-each>          
          </table>
        </div>
		<div class="accordion-separator"></div>
      </li>
  </xsl:template>  
  
  <xsl:template match="/personil_kemhan/*[contains(name(),'riwayat')]/* " priority="4">
      <li>
		<input type="radio" name="select" class="accordion-select"></input>
		
		<div class="accordion-title">
          <span><xsl:value-of select="translate(translate(name(.),'_',' '), $smallcase, $uppercase)"/></span>
        </div>        
        <div class="accordion-content">
          <table class="tableWidth1">       
            <xsl:for-each select="node()">
			  <!-- Column Header -->
			  <xsl:if test="position()=1">
				<tr>
				  <xsl:for-each select="./*">   
					  <th>              
						  <span><xsl:value-of select="translate(translate(name(.),'_',' '), $smallcase, $uppercase)"/></span>
					  </th>
				  </xsl:for-each>          
				</tr>		
			  </xsl:if>                  
              	
              <tr>
              <xsl:for-each select="./*">                         
                <td>
                  <xsl:value-of select="." />
                </td>
              </xsl:for-each>          
              </tr>
            </xsl:for-each>          
          </table>
        </div>
		<div class="accordion-separator"></div>
      </li>
  </xsl:template>   


</xsl:stylesheet>