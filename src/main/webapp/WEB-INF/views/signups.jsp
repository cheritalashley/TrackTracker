<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <title>Track Tracker Signup</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
								<li class="active"><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	
	<div class="container">
		<div class="col-lg-8 col-lg-offset-3">
			<div class="pull-left">
			<h3 style="color: #008000">Track Tracker Registration </h3>
			    <c:if test="${empty error}">
					<c:if test="${empty message}">
					</c:if>
				
					<h2><c:if test="${not empty message}">
					<h1 style="color: #008000">Track Tracker Registration Success</h1>
			
					<div class="text-success">
					<h2 style="color: #008000">${message} <a href="login">Login</a></h2>
					</div>						
				</c:if>				
			
			</h2>	
			<h2 style="color: #FF0000">${error} </h2>
			</c:if>			
			</div>
		</div>

		<div>
		     
		</div>
	</div>
	 <div class="container">
	 
	 <form id="signupForm" method="post"  action="signupMember">
     	<div class="contact-form">
        <div class="col-md-4">
        <div class="form-group">
             <label class=labelStyle for="fn" id='efn' >First Name*</label>
             <input type=text id="fname" name="fname" class="formStyle" placeholder="First Name" > 
        </div>
              
              <div class="form-group">
                    <label class=labelStyle for="ln" id='eln' >Last Name*</label>
                    <input type=text id="lname" name="lname" class="formStyle" placeholder="Last Name" > 
              </div> 
                           
               <div class="form-group">
              		  <label class=labelStyle for="emailAddressInput" >Email*</label>									
					    <input type="hidden" name="roles" value="user"/>
						<input type="text" class="formStyle" name="emailAddress" id="emailAddress" placeholder="Email Address" />
			    </div>  
			    
		      <div class="form-group">
                    <label class=labelStyle for="athleteNameInput" >Athlete Name*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="athleteName" id="athleteName" placeholder="Athlete Name" />
							    </div>     
                 <div class="form-group">
                                <label class=labelStyle for="athleteNameInput" >Athlete Age*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="athleteAge" id="athleteAge" placeholder="Athlete Age" />
							    </div> 
                  <div class="form-group">
                                <label class=labelStyle for="athleteTeamInput" >Athlete Team*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="athleteTeam" id="athleteTeam" placeholder="Athlete Team" />
							    </div>   
            
							    <div class="form-group">
                                <label class=labelStyle for="bestEventInput" >Best Event*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="bestEvent" id="bestEvent" placeholder="Best Event" />
							    </div> 
                 <div class="form-group">
                                <label class=labelStyle for="bestEvent2Input" >2nd Best Event*</label>									
									    <input type="hidden" name="roles" value="user"/>
										<input type="text" class="formStyle" name="bestEvent2" id="bestEvent2" placeholder="2nd Best Event" />
							    </div> 
							    
							     <div class="form-group">
                              <label class=labelStyle for="ag" id='eag' >Password*</label>                               
                              <input type="password" class="formStyle" name="password" id="password" placeholder="Password" />
                           </div> 
                           <div class="form-group">
                              <label class=labelStyle for="ag" id='eag' >Reenter password*</label>                               
                              <input type="password" class="formStyle" name="passwordConfirm" id="passwordConfirm" placeholder="Re-enter password" />
                           </div>   
                             <div class="col-md-12" >
		                           <div class="form-group">
		                           
					                   <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					                   <a href="index" class="btn btn-primary" role="button">Cancel</a>
								 				
					                
						               
		                              </div>
                                  </div> 
                 
                  </div> 
                     <!-- End of Form -->      
                     <div class="col-md-8" >
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
