<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.text.NumberFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.io.*,java.util.*" %>
<%java.text.DateFormat date = new java.text.SimpleDateFormat("E yyyy.MM.dd 'at' hh:mm:ss a "); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <script>
    window.history.forward();
    </script> 
    
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
								<li class="active"><a href="wellness">wellness</a></li>	
								<li role="presentation" class="small">
									<form class="navbar-form navbar-right" role="search"  action="LookupMembers">
										    <div class="input-group add-on">
										 
										      <input type="text" class="form-control" placeholder="Search Members" name="LookupMembers" id="LookupMembers" SIZE='13'>
										      <div class="input-group-btn">
										        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
										      </div>
										    </div>
									 </form>									
						        </li>
								<li><a href="index">Logout </a></li>		
							</ul>
						</div>
					</div>						
				</div>
			</div>				
	</header>
	
	<div class="container">
		
			<div>
				<h1 style="color: #008000">Welcome to wellness club </h1>
				<p style="color: #008000">${msg} </p>
				<h2 style="color: #008000">${message}</h2>
				<h2 style="color: #008000">${success} </h2>
				<h2 style="color: #FF0000">${error} </h2>
				<h2 style="color: #008000">${email} </h2>
				
			</div>
		<div>
		<table class="table table-hover table-bordered"> 
						<tr style="background-color: #bce8f1;">
                    	 	<td>
                    	 	
					           User							
						  
						     </td>
						     <td>
						    
						     <span class="fa fa-calendar" style="font-size:18px;color:green; padding-top: 2px;">
					         Details <%= date.format(new java.util.Date()) %>
					         </span>
						     
						      </td>
                    	 </tr>
                    	 <tr>
                    	    <td>Name </td> <td><c:out value="${attribs.fname}"/> <c:out value="${attribs.lname}"/></td>
                    	 </tr>                    	 
                    	 <tr>
                    	    <td>Telephone</td> <td><c:out value="${attribs.tel}"/></td>
                    	 </tr>
                    	 <tr>
                    	 	<td>User Email  </td><td><c:out value="${attribs.emailAddress}"/></td>
                    	 </tr>                   	 
                    	 <tr>
                    	    <td>
                    	    Membership Type 
                    	    </td> 
	                    	    <td>
	                    	           <form action="changeSubscriptionType">
										    <div class="input-group add-on">
										      <input type="hidden" name="id" value="${attribs.id}"/>
										      <select name="subscription" id="subscription" class="form-control input">
										      	  <option value="Life Time Membership">Life Time Membership $400</option>
                                                  <option value="Anual Subscription" >Annual Subscription $100</option>  
                                                  <option value="Monthly Subscription" >Monthly Subscription $35</option>                                                                                               
                                                  <option value="" selected>${attribs.subscription}</option>                                           
                                             </select> 
										      <div class="input-group-btn">
										         <button class="btn btn-success" type="submit"  title="assign roles">Change Subscription</button>
										      </div>
										    </div>
									 </form>		
							   		
                    	    </td>
                    	 </tr> 
                    	 <tr>
                    	    <td>address </td> <td><c:out value="${attribs.address}"/> <c:out value="${attribs.city}"/> <c:out value="${attribs.state}"/> <c:out value="${attribs.zip}"/></td>
                    	 </tr>
                    	
    		  </table>
    		  <a class="btn btn-primary"  href="userEdits?id=<c:out value='${attribs.id}'/>"> Update Profile</a>    		  
			  <a class="btn btn-primary" href="resetpassword">Reset Password</a>
			  <a class="btn btn-primary" href="login">sign In as a different user</a>
		</div>
	</div>
	
	
   
	<div class="container">	
		
		</div>		
	
  </body>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 	 
 	 <!-- <script>
 	 
 	$("#submit").on("click",function(){		
 		
 		 var numeric =/^-{0,1}\d*\.{0,1}\d+$/;
 	     var validemails = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;   
 	     
		 	   $("#eln").html('Last Name');
		 	   $('#eln').css('color', '#000000');
		 	    
		 	   $("#efn").html('First Name'); 
			   $('#efn').css('color', '#000000');
			   
			   $("#ead").html('Address '); 
			   $('#ead').css('color', '#000000'); 
			   
			   $("#etl").html('Job Title '); 		 
			   $('#etl').css('color', '#000000');
			   
			   $("#eem").html('Email'); 			 
			   $('#eem').css('color', '#000000');
			   
			   $("#eag").html('Age'); 			
			   $('#eag').css('color', '#000000');
			   
			   $("#etel").html('Telephone.'); 			 
			   $('#etel').css('color', '#000000');
 	         
 	    		
 				if ($.trim($("#ln").val())==="") {
 					$("#eln").html('Last Name Required'); 	 
 					$('#eln').css('color', '#FF0000');
 			        $("#ln").focus(); 			        
 			        return false;	       
 			    }
 				
 				if ($.trim($("#fn").val())=="") {
 					$("#efn").html('First Name required'); 
 					$('#efn').css('color', '#FF0000');
 			        $("#fn").focus();
 			        return false;	       
 			    }
 				
 				if ($.trim($("#ad").val())=="") {
 					$("#ead").html('Address Required'); 
 					$('#ead').css('color', '#FF0000'); 					
 			        $("#ad").focus();
 			        return false;	       
 			    }
 				
 				if ($.trim($("#tl").val())=="") {
 					$("#etl").html('Title Required'); 		 
 					$('#etl').css('color', '#FF0000');
 			        $("#tl").focus();
 			        return false;	       
 			    }
 				
 				if ($.trim($("#tel").val())==0 || !($.trim($("#tel").val().match(numeric)))) {
 					$("#etel").html('Numbers only for Tel.'); 			 
 					$('#etel').css('color', '#FF0000');
 			        $("#tel").focus();
 			        return false;	       
 			    }
 				
 				if (!($.trim($("#em").val().match(validemails)))) {
 					$("#eem").html('Email required'); 			 
 					$('#eem').css('color', '#FF0000');
 			        $("#em").focus();
 			        return false;	       
 			    }
 				
 				if (!($.trim($("#ag").val().match(numeric))) ) {
 					$("#eag").html('Enter Age'); 			
 					$('#eag').css('color', '#FF0000');
 			        $("#ag").focus();
 			        return false;	       
 			    }
 				
 				if ($.trim($("#ag").val()) < 21 && $.trim($("#ag").val()) > 65 ) {
 					$("#eag").html('Must be between 21 and 65'); 			
 					$('#eag').css('color', '#FF0000');
 			        $("#ag").focus();
 			        return false;	       
 			    }
 				
 			}); 
 		 	 

	
 	 </script>
 	  -->
	
</html>
