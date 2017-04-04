<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Track Tracker</title>
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
								<li class="active"><a href="index">Home</a></li>
								<li><a href="about">About Us</a></li>																
								<li><a href="contact">Contact Us</a></li>	
								<li><a href="signups">Sign up</a></li>
								<li><a href="login">login</a></li>	
								<li>	
								<!-- <form class="navbar-form navbar-right" role="search"  action="LookupNames">
									<div class="input-group add-on">
										  <input type="text" class="form-control" placeholder="LookupNames" name="LookupNames" id="LookupNames" SIZE='13'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
									 </div>
								</form>	
								</li>
								<li>
								<form class="navbar-form navbar-right" role="search"  action="Lookupcity">
									<div class="input-group add-on">
										  <input type="text" class="form-control" placeholder="Search City or Zip" name="Lookupcity" id="Lookupcity" SIZE='13'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
									 </div>
								</form>	 -->
								</li>
							</ul>
						</div>
					</div>						
				</div>
			</div>	
		
	</header>
	<div class="container">	
	
  <div class="middle">
    <div class="inner">
		<div class="classMain"> 
      		<h3>Welcome to</h3>
       		<h3>Track Tracker</h3>
  			<h4>"manage your athlete statistical data"</h4>
			 <p><a href="login"><img src="${contextPath}/resource/images/loginButton.png" width="100" height="30" alt="loginbutton"/></a>
  			 <a href="signups"><img src="${contextPath}/resource/images/signUpButton.png" width="100" height="30" alt="signupbutton"/></a></p>
		</div>
    </div>
  </div>
     </div>
		<c:if test="${not empty users}">
		<table class="table table-hover table-bordered">
                    <thead style="background-color: #ff6600;">
                    <tr > 
                        <th>Subscription Type</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Address</th>                                                             	
                    </tr>
                    </thead>
                    <tbody  >
                     <c:forEach items="${users}" var="item">
                        <tr class="text-success">
                            <th><c:out value="${item.subscription}"/></th>
							<th><c:out value="${item.fname}"/> <c:out value="${item.lname}"/></th>
							<th><c:out value="${item.emailAddress}"/></th> 
							<th><c:out value="${item.address}"/>, <c:out value="${item.city}"/></th>
												                	
                           </tr>
                           </c:forEach>
                    </tbody>
                </table>
		</c:if>		
  
   
  </body>
    
  	<script>
 	 
$("#submit").on("click",function(){
		
        var numeric =/^-{0,1}\d*\.{0,1}\d+$/;
        var msg ='Enter Numbers only';
        
        if ($.trim($("#system").val())=="Select Units") {
			$("#sy").html('Please Select Units'); 
			$('#sy').css('color', '#FF0000');	
	        return false;	       
	    }
		
		if ($.trim($("#w").val())==0 || !($.trim($("#w").val().match(numeric))) ) {
			$("#wt").html(msg); 
			$('#wt').css('color', '#FF0000');       
	        $("#w").focus();
	        return false;	       
	    }
		
		if ($.trim($("#h").val())==0 || !($.trim($("#h").val().match(numeric)))) {
			$("#ht").html(msg); 
			$('#ht').css('color', '#FF0000');	        
	        $("#h").focus();
	        return false;	       
	    }
		
		
		
	}); 
	
 	 </script>
 	 
 	 <script>
$("#system").on("click",function(){
		
        
		if ($.trim($("#system").val())=="imperial" ) {
			$("#wt").html('lb'); 
			$("#ht").html('in'); 
	        return false;	       
	        }else{
	     if ($.trim($("#system").val())=="metric" ) {
			$("#wt").html('kg');
			$("#ht").html('cm'); 
	        return false;	       
	        }
	      }
		
	}); 
 	 </script>
</html>



