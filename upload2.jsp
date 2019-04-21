<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<script language="javascript" type="text/javascript">

function popitup(url) {
	newwindow=window.open(url,'name','height=350,width=400');
	if (window.focus) {newwindow.focus()}
	return false;
}
</script>

  <title>IDEA and Two fish </title>
  <meta name="description" content="free website template" />
  <meta name="keywords" content="enter your keywords here" />
  <meta http-equiv="content-type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/image_slide.js"></script>
</head>

<body>
  <div id="main">
    <div id="header">
	  <div id="banner">
	    <div id="welcome">
	      <h1>ENCRYPTION EFFICIENCY ANALYZER</h1>
	    </div><!--close welcome-->
	    <div id="welcome_slogan">
	      <h1>Be Aware Be Secure</h1>
	    </div><!--close welcome_slogan-->
	  </div><!--close banner-->
    </div><!--close header-->

	<div id="menubar">
      <ul id="menu">
        <li ><a href="index.html">Home</a></li>
        <li><a href="File.jsp">CipherGeneration</a></li>
        <!-- <li><a href="Ad.html">Algorithm Description</a></li>
        <li><a href="P.html">Security </a></li>
        <li><a href="Home.Html">Logout</a></li> -->
      </ul>
    </div><!--close menubar-->	
    
	<div id="site_content">		

	  <div class="sidebar_container">       
		<div class="sidebar">
          <div class="sidebar_item">
            <h2>Encryption</h2>
            <p>Encryption provides Data Security.It also provides privacy to an organisation's Website,database . </p>
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->     		
		<div class="sidebar">
          <div class="sidebar_item">
             <h2>Data Security</h2>
         
            <p>Data security means protecting data, such as a database, from destructive forces, and from the unwanted actions of unauthorized users</p>     
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
		<div class="sidebar">
          <div class="sidebar_item">
            
            <h3>Need For Encryption Efficiency Analyzer<h3>
            <p>The Existing situation is that there is no mechanism to choose a suitable encryption standard.</p>         
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->  
		<div class="sidebar">
          <div class="sidebar_item">
           
		  </div><!--close sidebar_item--> 
        </div><!--close sidebar-->  		
        <div class="sidebar">
          <div class="sidebar_item">
            
          </div><!--close sidebar_item--> 
        </div><!--close sidebar-->
       </div><!--close sidebar_container-->	
	
	  <div class="slideshow">
	    <ul class="slideshow">
          <li class="show"><img width="680" height="250" src="images/home_1.jpg" alt="&quot;Be Aware Be Secure&quot;" /></li>
          <li><img width="680" height="250" src="images/home_2.jpg" alt="&quot;Be Aware Be Secure&quot;" /></li>
        </ul>
      </div>	  	 
	 
	<%@page import="java.sql.*,java.io.*,javax.crypto.SecretKey"%>
	<%@page import="java.sql.*,java.io.*,crypt.Blowfish,crypt.IDEA"%>
	<%! int i=0;
	
	StringBuffer sb1=null;
	String thisLine=null;String decryptedMessage=null,encryptedData=null,decryptedMessage1=null,decryptedMessage2=null;
	String algm=null, algm1=null, algm2=null;

	%>
	<%
String fid=request.getParameter("fid");
String fnm=request.getParameter("fnm");
String file=request.getParameter("file");
algm="BLOWFISH";
algm1="IDEA";
//String key=(String)session.getAttribute("raw");
//byte[] key1=key.getBytes(key);
//String ebyte1=(String)session.getAttribute("edata");
if(algm.equals("BLOWFISH"))
{
Blowfish d=new Blowfish();
		byte[] key1=d.getKey();
		byte[] data=d.getData();
		  long startTime = System.nanoTime();
    byte[] dbyte=Blowfish.decrypt(key1,data);
	long endTime = System.nanoTime();

		 decryptedMessage = new String(dbyte);
}


if(algm1.equals("IDEA"))
{
	
		decryptedMessage2=(String)session.getAttribute("ddata");
		
   // String decryptedMessage2=id.decrypt(data,key1);
		// decryptedMessage = new String(dbyte);
		System.out.println("Decrypted message2 "+decryptedMessage2);

//decryptedMessage1=(String)session.getAttribute("data");
}
%>

	  <div id="content">
        <div class="content_item">

		 <form action="upload2.jsp">
		 <table align=center>
	
	<!-- <tr>
		<td><font color="0066ff" size=+1><b>FileID</td><td><input type="text" name="fid" value=<%=fid%>></td>
	</tr> -->
	<tr>
		<td><font color="0066ff" size=+1><b>FileName</td><td><input type="text" name="fnm" value=<%=fnm%>></td>
	</tr>
<tr><td><font color="0066ff" size=+1><b>FileData</td>

	<td><textarea name="file" cols="20" rows="10"><%= decryptedMessage%></textarea><textarea name="file1" cols="20" rows="10"><%=decryptedMessage2%></textarea></td>
</tr>
	 </div><!--close content_container-->
         <div class="content_container">
		 </div><!--close content_container-->			  
		</div><!--close content_item-->
      </div><!--close content-->   
	</div><!--close site_content--> 
    
	<!--close main-->
    <div id="footer">
	 
  </div>
</body>
</html>