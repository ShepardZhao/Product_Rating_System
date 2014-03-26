<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.net.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<title>COMP5347 Assignment 1</title>
	
	<!-- If you are using CSS version, only link these 2 files, you may add app.css to use for your overrides if you like. -->
  	<link rel="stylesheet" href="css/normalize.css">
  	<link rel="stylesheet" href="css/foundation.min.css">

	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
  	<script src="js/jquery-1.11.0.min.js"></script>
  	<script src="js/foundation.js"></script>
  	<script src="js/foundation.reveal.js"></script>
  	<script src="js/customer.js"></script>
  	
</head>
<body>
<div class="row">
    <div class="large-12 columns">
 
    <!-- Navigation -->
 
      <div class="row">
        <div class="large-12 columns">
 
          <nav class="top-bar" data-topbar>
            <ul class="title-area">
              <!-- Title Area -->
              <li class="name">
                <h1>
                    <a href="#">COMP5347 Assignment 1</a>
                </h1>
              </li>
              
            </ul>
         
            
          </nav>
          <!-- End Top Bar -->
        </div>
      </div>
 
    <!-- End Navigation -->
      <div class="row">
 
    <!-- Thumbnails -->
 
        <div class="large-12 columns">
          <div class="row">
          <%
          String getproductionlist = (String) application.getAttribute("productionlist");
          String getURl = (String) application.getAttribute("getDomain");
          Object obj=JSONValue.parse(getproductionlist);
          JSONArray array=(JSONArray)obj;  
      
          for(int i=0; i<array.size();i++){
        	  JSONObject InnerObj=(JSONObject)array.get(i);
          %>
            <div class="large-6 small-12 columns" style="margin-bottom:9px!important"id="<%=InnerObj.get("id") %>">
				<a href="<%=getURl%>/Details?detail=<%=URLEncoder.encode(InnerObj.toJSONString(),"UTF-8") %>" data-reveal-id="myModal" data-reveal-ajax="true"><img class="Detail_production" src="<%=getURl %>/img/<%=InnerObj.get("img") %>"></a>   
				<div class="panel">
                <h5 class="Detail_production"><a href="<%=getURl%>/Details?detail=<%=URLEncoder.encode(InnerObj.toJSONString(),"UTF-8") %>" data-reveal-id="myModal" data-reveal-ajax="true"><%=InnerObj.get("name") %></a></h5>
                <h5 class="subheader"><i>Price:</i> <%=InnerObj.get("price") %></h5>
            	<% 
  					@SuppressWarnings({ "unchecked", "unchecked" })
            		Map<String,Integer> userSession = (Map<String,Integer>) session.getAttribute("UserSession");
            		if (userSession!=null && userSession.containsKey(InnerObj.get("id"))){%>
            			<h6><i>Your rating:</i> <%=userSession.get(InnerObj.get("id")) %></h6>
            		<%}
            	%>
            	
            	
            	<%          
					@SuppressWarnings({ "unchecked", "unchecked" })
     		 		HashMap<String,String> getavg = (HashMap<String,String>) getServletContext().getAttribute("GlobalProAvge");
     		   			if (getavg==null || !getavg.containsKey(InnerObj.get("id"))){%>
						<h6><i>Average Ratings:</i> 0</h6>						
				   <%}else{%>
				   		<h6><i>Average Ratings:</i> <%=getavg.get(InnerObj.get("id")) %></h6>
				   <%}%>
            	
            	
            	
            	<% 
          			@SuppressWarnings({ "unchecked", "unchecked" })
          		 	HashMap<String,Integer> getcount = (HashMap<String,Integer>) getServletContext().getAttribute("GlobalProCount");
          		   	if (getcount==null || !getcount.containsKey(InnerObj.get("id"))){%>
          		  		     <h6><i>Total No of Ratings:</i> 0</h6>          		   			
          		  		
          		   <%}else{%>
          		            <h6><i>Total No of Ratings:</i> <%=getcount.get(InnerObj.get("id")) %></h6>          		   			
          		   
          		   <%}%>
            	
            	
            	</div> 	
           </div>
           
          <%}%>
        </div>
      </div>
      </div>
 
   
    <!-- Footer -->
 
      <footer class="row">
        <div class="large-12 columns"><hr />
          <div class="row">
              <p class="text-center">@The Demo processed by XUN ZHAO (440042783)</p>
          </div>
        </div>
      </footer>
 
    <!-- End Footer -->
    </div>
  </div>	
  <div id="myModal" class="reveal-modal" data-reveal></div>  
  
  
</body>
</html>










