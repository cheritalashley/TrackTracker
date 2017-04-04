<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Track Tracker Forgot Password</title>
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
								<li ><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>	
								<li class="active"><a href="">Forgot password</a></li>	
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
				<span class="text-success">${success}</span>
				<div class="text-center">
				<div class="text-primary">${message}</div>
				</div>
				
				</div>
			</div>
			</div>
			</div>
<form id="emails" method="post" action="forgotpass">			
		<div class="contact-form">
		<div class="container">									
			<div class="col-md-4">
				<div class="form-group">
					<input type="email" class="form-control"  value="${em}" id="emailAddress" name="emailAddress" placeholder="email Address">
					<span class="text-danger">${emailrror}</span>
				</div>
			</div>			
		</div>
		
		<div class="container">
			<div class="col-lg-12">	
					<button type="submit" name="submit" class="btn btn-primary" >Submit</button>
					<a href="contact" class="btn btn-primary" role="button">Reset</a>
			</div>
		</div>		
	</div>
</form>	
	
   
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
</html>

