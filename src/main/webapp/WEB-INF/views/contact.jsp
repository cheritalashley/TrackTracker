
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Track Tracker Contact Us</title>
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
								<li class="active"><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>		
							</ul>
						</div>
					</div>						
				</div>
			</div>	
				
	</header>
   
	<div class="container">	
			<div class="container">
		     <div class="col-lg-12">
				<div class="form-group"><br>
				
				<div class="text-center">
				<h4 style="color: #008000" class="leftside">${message}</h4>
				<h5 style="color: #008000" class="leftside">${message1}</h5>
				</div>
				
				</div>
			</div>
			</div>
			</div>

<form id="emails" method="post" action="sendEmail">		
	<div class="contact-form">
	<h4 class="text-success">${success}</h4>	
		<div class="container">
			<div class="col-md-4">
			
			<div class="form-group">
			<input type="email" class="form-control"  value="${em}" id="emailAddress" name="emailAddress" placeholder="email Address">
			<span class="text-danger">${emailrror}</span>
			</div>
			
			<div class="form-group">
			<input type="text" class="form-control" value="${sb}" id="subject" name="subject" placeholder="subject">
			<span class="text-danger">${sbjrror}</span>
			</div>
		
			<div class="form-group">				
			<textarea class="form-control" id="msg" name="msg"  rows="5" placeholder="message"></textarea>
			<p class="text-danger">${msgerror}</p>
			</div>
				
			<div class="form-group">
			<button type="submit" name="submit" class="btn btn-primary" >Submit Message</button>
			<a href="contact" class="btn btn-primary" role="button">Reset</a>
			</div>
			
			</div>
			
			<div class="col-md-8" >
    		</div>
		</div>		
	</div>
		
</form>	
	
   
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>


