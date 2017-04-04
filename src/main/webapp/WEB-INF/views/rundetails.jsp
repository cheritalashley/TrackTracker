

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy"); %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Track Tracker Run Details</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<%-- 	<script src="${contextPath}/resource/css/styles.css"></script> 
	 <script src="${contextPath}/resources/bootstrap/js/bootstrap.js"></script> 
	<script src="${contextPath}/resources/datepicker/js/bootstrap-datepicker.js"></script> --%>
	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="${contextPath}/resource/css/styles.css" rel="stylesheet" type="text/css">
	
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>

<script src="http://use.edgefonts.net/actor:n4:default;aladin:n4:default;alfa-slab-one:n4:default;arapey:n4:default;adamina:n4:default;lekton:n4:default;abel:n4:default;alex-brush:n4:default;aclonica:n4:default;acme:n4:default.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  </head>
  <body>
	<header>		
		<div class="navigation">
				<div class="container">				
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse.collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>						
					</div>
					
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li class="active"><a href="rundetails">Run Details</a></li>
								<li><a href="login">login</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>

	<div>
	<h2 style="color: #008000">${message}</h2>
	<%-- <h2 style="color: #008000">${message1}</h2> --%>
	<h2 style="color: #FF0000">${error} </h2>
	<!-- 
	<button type="submit" class="btn btn-primary" data-toggle="collapse" data-target="#show" >YES</button> -->
	<c:if test="${empty message}">
	 </c:if>
	
	<h2 style="color: #008000">Enter Run Details</h2>
				
	</div>
	<div id="show">
	<form id="runDetailsForm" method="post"  action="runDetails">
         
      <div class="contact-form">
              <div class="container">
                           
              <div class="col-md-4">
              <div class="form-group">
                  	<label class=labelStyle for="event" id='event' >Event*</label>
                 	<input type=text id="event" name="event" class="formStyle" placeholder="Event" > 
              </div>
              
              <div class="form-group">
                    <label class=labelStyle for="dateofRun" id='dateofRun' >Date*</label>
                    <input type="date" id="dateofRun" name="dateofRun" class="formStyle" placeholder="Date" > 
              </div>     
			  
			   <div class="form-group">
			    		<input type="hidden" name="athleteName" value="${attribs.athleteName}"/>								
					    <input type="hidden" name="emailAddress" value="${attribs.emailAddress}"/>
			    </div> 
			 
		      <div class="form-group">
                    <label class=labelStyle for="meetName" id='meetName'>Meet Name*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="meetName" id="meetName" placeholder="Meet Name" />
							    </div>     
                 <div class="form-group">
                                <label class=labelStyle for="athleteTime" id='athleteTime'>Athlete Time*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="time" step='1' min="00.00.00" max="20.00.00" class="formStyle" name="athleteTime" id="athleteTime" placeholder="Athlete Time" />
							    </div> 
                  <div class="form-group">
                                <label class=labelStyle for="athletePlace" id='athletePlace' >Athlete Place*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="athletePlace" id="athletePlace" placeholder="Athlete Place" />
							    </div>   
            
							    <div class="form-group">
                                <label class=labelStyle for="numRunners" id='numRunners' >Number of Runners*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="numRunners" id="numRunners" placeholder="Number of Runners" />
							    </div> 
                 <div class="form-group">
                                <label class=labelStyle for="heatBest" id='heatBest'>Best Time in Event*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="time" step='1' min="00.00.00" max="20.00.00" class="formStyle" name="heatBest" id="heatBest" placeholder="Best Time in Event" />
							    </div> 
			 
                             <div class="col-md-12" >
		                           <div class="form-group">
		                           
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					                   <a href="index" class="btn btn-primary" role="button">Cancel</a>
					                     <a class="btn btn-primary"  href="stats?emailAddress=<c:out value='${attribs.emailAddress}'/>"> See All Events</a>  
								 				
					                
						               
		                              </div>
                                  </div> 
                 
                  </div> 
                     <!-- End of Form -->      
                     <div class="col-md-8" >
                     </div>
              </div>
       </div>         
           
        </form>
   </div>
	

	<script>
		$(function() {
			$('#dateOfBirthInput').datepicker();
		});
	</script>

	<script type="text/javascript">
		$(function() {
			var yesButton = $("#yesbutton");
			var progress = $("#doitprogress");

			yesButton.click(function() {
				yesButton.button("loading");

				var counter = 0;
				var countDown = function() {
					counter++;
					if (counter == 11) {
						yesButton.button("complete");
					} else {
						progress.width(counter * 10 + "%");
						setTimeout(countDown, 100);
					}
				};

				setTimeout(countDown, 100);
			});

		});
	</script>

   
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>
