<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Track Tracker Stats</title>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="${contextPath}/resource/css/styles.css" rel="stylesheet" type="text/css">
	
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>

<script src="http://use.edgefonts.net/actor:n4:default;aladin:n4:default;alfa-slab-one:n4:default;arapey:n4:default;adamina:n4:default;lekton:n4:default;abel:n4:default;alex-brush:n4:default;aclonica:n4:default;acme:n4:default.js" type="text/javascript"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
    window.history.forward();
    </script>
  </head>
  <body class="newBg">
	<header>		
		<div class="navigation">
				<div class="container">		
					<div class="navbar-collapse collapse">							
						<div class="menu">
							<ul class="nav nav-tabs" role="tablist">
								<li ><a href="index">Home</a></li>
								<li class="active"><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>		
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	<div class="container">
		                   <c:choose>
							    <c:when test="${empty users}">
							     <div>
									<h1>Track Tracker Management</h1>
									<h3>${msg}Access denied,you must login as admin to view this page <a class="btn btn-primary" href="login">Login</a></h3>
									
									<h2>${message}</h2>
									<h2>${success} ${role}</h2>
									<h2>${error} </h2>				
								 </div>    
							    </c:when>    
							    <c:otherwise>
							     <div>
									<h1>Track Tracker Management <a class="btn btn-primary" href="login">Logout</a> 
									<a class="btn btn-primary" href="resetpassword">Reset Password</a>
									<a class="btn btn-primary" href="signups">Add new user</a>
									</h1>
									<p>${msg} </p>
									
									<h2>${message}</h2>
									<h2>${success} ${role}</h2>
									<h2>${error} </h2>				
								</div>     
							    </c:otherwise>
							</c:choose>	
		     
	<div>            
	 <c:if test="${not empty users}"> 
	
		<table class="table table-hover table-bordered">
                    <thead style="background-color: #ff6600;">
                    <tr > 
                    <th>Athlete Name</th>
                        <th>Event</th>
                        <th>Day</th>
                        <th>Meet</th>
                        <th>Time</th>
                        <th>Place</th>	
                        <th>Heat Best Time</th> 
                           <th>Edit User</th>
                        
						                  	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${attribs}" var="attribs">
                        <tr class="text-success">
                       		 <th><c:out value="${attribs.athleteName}"/></th>
                            <th><c:out value="${attribs.event}"/></th>
                            <th><c:out value="${attribs.dateofRun}"/></th>
							<th><c:out value="${attribs.meetName}"/></th>
							<th><c:out value="${attribs.athleteTime}"/></th> 
							<th><c:out value="${attribs.athletePlace}"/> of <c:out value="${attribs.numRunners}"/> </th> 
							<th><c:out value="${attribs.heatBest}"/></th>
							
							<th><a href="editUser?id=<c:out value='${item.id}'/>"><span class="glyphicon glyphicon-edit"></span> </a></th>
                 
                            
                    	    					                	
                           </tr>
                           </c:forEach>
                    </tbody>
                </table>
		</c:if> 
	</div>
   	</div>
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>



