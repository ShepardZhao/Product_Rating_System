<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.json.simple.*"%>
<%@ page import="java.util.*"%>
    <div class="row">
      <a class="close-reveal-modal">&#215;</a>
    
    <div class="large-12 small-12 columns">
 
 	<% 
 		String GetindivialString = request.getParameter("detail");
	    String getURl = (String) application.getAttribute("getDomain");
 		Object obj=JSONValue.parse(GetindivialString);
  	 	JSONObject getobj=(JSONObject)obj;
 	%>
      <div class="row Pro_detail" id="<%=getobj.get("id") %>">
 
  <!-- Side Bar -->
        <div class="large-4 small-12 columns">
          <img src="<%=getURl%>/img/<%=getobj.get("img") %>">
 			<div class="row">		
          		<div class="large-12 small-12 columns inputzone">
				<% 
  					@SuppressWarnings({ "unchecked", "unchecked" })
            		Map<String,Integer> userSession = (Map<String,Integer>) session.getAttribute("UserSession");
            		if (userSession!=null && userSession.containsKey(getobj.get("id"))){%>
            			<h3><small>Your rating: <%=userSession.get(getobj.get("id")) %></small></h3>
            		<%}
            		else{
            		%>          		
      						<div class="row">
       							 <div class="small-3 columns">
          						 	<label for="left-label" class="left inline">Rating:</label>
        						 </div>
        						 <div class="small-6 columns">
										<select id="rating">
          								<option value="1">1</option>
          								<option value="2">2</option>
          								<option value="3">3</option>
          								<option value="4">4</option>
          								<option value="5">5</option>
        								</select>						        
        						</div>
        						 <div class="small-3 columns">
         						 <a id="rSubmit"  class="button postfix"><small>Submit</small></a>
       							 </div>
						      </div>  
						      
					<%} %>	          
          		</div>
 			</div>
 			
 			 <div class="row">
				<div class="large-12 small-12 columns">
				   <%          				
     		 			HashMap<String,String> getavg = (HashMap<String,String>) getServletContext().getAttribute("GlobalProAvge");
     		   			if (getavg==null || !getavg.containsKey(getobj.get("id"))){%>
						<h5 class="average"><small>Average Ratings: 0</small></h5>						
				   <%}else{%>
				   		<h5 class="average"><small>Average Ratings: <%=getavg.get(getobj.get("id")) %></small></h5>
				   <%}%>
				
          		   <% 
          				@SuppressWarnings({ "unchecked", "unchecked" })
          		 		HashMap<String,Integer> getcount = (HashMap<String,Integer>) getServletContext().getAttribute("GlobalProCount");
          		   		if (getcount==null || !getcount.containsKey(getobj.get("id"))){%>
          		  		     <h5 class="count"><small>Total No of Ratings: 0</small></h5>          		   			
          		  		
          		   <%}else{%>
          		            <h5 class="count"><small>Total No of Ratings: <%=getcount.get(getobj.get("id")) %></small></h5>          		   			
          		   
          		   <%}%>
        		   </div>						      
			    </div>
			    
			    <div class="row">
				<div class="large-12 small-12 columns">
          		   <div class="panel">
  					<ul class="disc">
  					<% 
  					@SuppressWarnings({ "unchecked", "unchecked" })
  					HashMap<String,HashMap<Integer,Integer>> GetRatinghistogram = (HashMap<String,HashMap<Integer,Integer>>) getServletContext().getAttribute("GlobalRating");
  					if(GetRatinghistogram==null || !GetRatinghistogram.containsKey(getobj.get("id"))){
  					%>
  						<li>Rate 1: 0</li>
  						<li>Rate 2: 0</li>
  						<li>Rate 3: 0</li>
  						<li>Rate 4: 0</li>
  						<li>Rate 5: 0</li>
  					<%	
  					}
  					else{
  					for (Map.Entry<Integer,Integer> entry : GetRatinghistogram.get(getobj.get("id")).entrySet()) {
  					%>
  							<li>Rate  <%=entry.getKey()%>: <%=entry.getValue()%></li>
					<%
  					}
  					}
  					%>		
 					</ul>
					</div>
        		   </div>						      
			    </div>
       </div>
 
    <!-- End Side Bar -->
 
  					  
 
    <!-- Thumbnails -->
 
        <div class="large-8  columns">
          <div class="row">
            	<div class="large-12 hide-for-small columns">
            	    <ul class="pricing-table">
  						<li class="title"><%=getobj.get("name") %></li>
  						<li class="price"><%=getobj.get("price") %></li>
  						<li class="bullet-item">Color: <%=getobj.get("color")%></li>
  						<li class="bullet-item">OS: <%=getobj.get("os")%></li>
  						<li class="bullet-item">Processor: <%=getobj.get("processor")%></li>
  						<li class="bullet-item">Momery: <%=getobj.get("momery")%></li>
 						<li class="bullet-item">Storage: <%=getobj.get("storage")%></li>  
					</ul>        
            	</div>
            </div>
          </div>
 
    <!-- End Thumbnails -->
 
    </div>
  </div>
    </div>

