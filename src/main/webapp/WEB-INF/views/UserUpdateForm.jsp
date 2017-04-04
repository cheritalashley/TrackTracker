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
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Track Tracker User Update Form</title>
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
								<li class="active"><a href="">Update Form</a></li>
								<li><a href="login">login</a></li>						
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	
	<div class="container">
		<div class="col-lg-8 col-lg-offset-3">
			<div>
			
			    <h1 style="color: #008000">Track Tracker Data entry</h1>
				
				<h2 class="text-success" >${message} </h2>				
				<h2 class="text-danger" >${error} </h2>
							
			</div>
		</div>

		<div>
		     
		</div>
	</div>
	
	<form id="editUser" method="post"  action="userEdit">
                    
      <div class="contact-form">
              <div class="container">
                                  
                     <div class="col-md-4" >
                           <div class="form-group">
                              <label for="ln" id='eln' >Last Name*</label>
                              <input type="hidden" class="form-control" name="id" value="${attribs.id}"/>
                              <input type="hidden" class="form-control" name="roles" value="${attribs.roles}"/>
							  <input type="hidden" class="form-control" name="emailAddress" id="emailAddress"  value="${attribs.emailAddress}"/>							    
                              <input type="hidden" class="form-control" name="password" id="password" value="${attribs.password}"/>
                              <input type=text id="lname" name="lname" class="form-control input-sm" placeholder="Last Name" value="${attribs.lname}"> 
                           </div>
                           
                     </div>
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="fn" id='efn' >First Name*</label>
                              <input type="hidden" name="roles" value="${attribs.roles}"/>
                              <input type=text id="fname" name="fname" class="form-control input-sm" placeholder="First Name" value="${attribs.fname}"> 
                           </div>
                           
                     </div>
                     
                     <div class="col-md-4">
                           <div class="form-group">
                                <label for="emailAddressInput" >Email*</label>									
								<input type="hidden" class="form-control" name="roles" value="user"/>
								<input type="text" class="form-control" name="emailAddress" id="emailAddressInput" placeholder="Email Address" value="${attribs.emailAddress}"/>
							</div>                           
                     </div>
                     
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="athleteAge">Age*</label>
                              <input type='number' id="athleteAge" name="athleteAge" class="form-control input-sm" placeholder="Athlete Age" value="${attribs.athleteAge}"> 
                           </div>    
                     </div>
                      
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="athleteName">AthleteName*</label>
                              <input type=text id="athleteName" name="athleteName" class="form-control input-sm" placeholder="Athlete Name" value="${attribs.athleteName}"> 
                           </div>   
                     </div>
                     
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="athleteTeam">Athlete Team*</label>
                              <input type=text id="athleteTeam" name="athleteTeam" class="form-control input-sm" placeholder="Athlete Team" value="${attribs.athleteTeam}"> 
                           </div>
                     </div>
                     
                     <div class="col-md-4">
                           <div class="form-group">
                              <label for="bestEvent">Best Event*</label>
                              <input type=text id="bestEvent" name="bestEvent" class="form-control input-sm" placeholder="Best Event" value="${attribs.bestEvent}"> 
                           </div>
                     </div>
                     
                     <div class="col-md-3">
                           <div class="form-group">
                              <label for="bestEvent2" id='etl'>2nd Best Event*</label>
                              <input type=text id="bestEvent2" name="bestEvent2" class="form-control input-sm" placeholder="BestEvent 2" value="${attribs.bestEvent2}"> 
                           </div>
                     </div>
            
                     <div class="col-md-12" >
		                  <div class="form-group">		                           
					          <button type="submit" name="submit" id="submit" class="btn btn-primary" >Submit</button>
					          <a href="index" class="btn btn-primary" role="button">Cancel</a>
		                     </div>
               			</div>                   
                                  
                                  
              </div>
       </div>         
           
        </form>
   
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>
