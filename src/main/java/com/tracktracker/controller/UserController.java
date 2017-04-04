package com.tracktracker.controller;

import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.tracktracker.model.Track;
import com.tracktracker.model.UserLogin;
import com.tracktracker.service.MailService;
import com.tracktracker.service.RunService;
import com.tracktracker.service.SendMail;
import com.tracktracker.service.UserService;


@Controller
public class UserController {
	
		    public UserController() {
				System.out.println("in UserController servelet");
			}
		    
		    @Autowired
	     	private MailService mailServices; 
		    
		    @Autowired
			   private RunService runService; 
		    
		   /* @Autowired
		    DataSource dataSource;*/
		    
		    SendMail sendMail= new SendMail();
		    
		    SendMail mailService =new SendMail();
		    
		   @Autowired
		   private UserService userService; 
	    
	    
	       @RequestMapping(value = "/signups", method = RequestMethod.GET)
		    public String signups(Model model) {
		              model.addAttribute("signupMember", new UserLogin());
		              
		        return "signups";
		    }
	    
		    @RequestMapping("signupMember")
		    public String signupMember(@ModelAttribute("signupMember") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	 String msg="Welcome to Track Tracker Login now <a href='http://localhost:8080/tracktrackerspring/login'>Login </a>";     	
		    	try {
		    		    if(userService.findUser(userLogin.getEmailAddress())== false){
		    		    	if(userLogin.getPassword().equals(userLogin.getPasswordConfirm())){
		    		    		userService.createUser(userLogin);
		    		    		sendMail.sendMails(userLogin.getEmailAddress(), "Welcome to Track Tracker ", msg);
		    		    		model.addAttribute("success", "Confirmation email has been sent to "+ userLogin.getEmailAddress()+ " thanks");				                  
				    			model.addAttribute("message", "Welcome "+userLogin.getFname()+" Login now <a href='login'>Login </a>");
				    			return "login";
		    		    	}
		    		    	else {		    		    		
				    			model.addAttribute("error", "Password not matching ");			    		
		    		    	}
				    			
		                } else {		                	
		                	model.addAttribute("error", "A user exists with the supplied email "+userLogin.getEmailAddress()+" <a href='login'>Login </a>");	
		                	
		               }
		    		
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		         return "signups";
		    	
		    }
		    
		    
		    
		    @RequestMapping(value = "/login", method = RequestMethod.GET)
		    public String login(Model model) {
		    	model.addAttribute("loginMember", new UserLogin());
		    	model.addAttribute("msg", "Login to explore the complete features!");
		        return "login";
		    }
		    
		    @RequestMapping(value = "/loginMember", method = RequestMethod.POST)
		    public String login(@ModelAttribute("loginMember") UserLogin user, ModelMap model) throws ParseException{	    	
		    	
		    	try {
		    		
		    		UserLogin userdetail= userService.getUserByEmailId(user.getEmailAddress());
		    		 if(userService.findUser(user.getEmailAddress())== true){
		    			 if(userdetail.getEmailAddress().equals(user.getEmailAddress()) && userdetail.getPassword().equals(user.getPassword()) ){
				    			if(userdetail.getRoles().equalsIgnoreCase("admin") || userdetail.getRoles().equalsIgnoreCase("super")){
				    				model.addAttribute("success", "Welcome "+ userdetail.getFname()+"! ");
				    				model.addAttribute("users", userService.getAllusers());
				    				model.addAttribute("role", "You are an admin with  "+userdetail.getRoles()+" role");
				    				model.addAttribute("user", userdetail.getFname());
				    		    	model.addAttribute("attribs", runService.getAllruns()); 
				    				return "statsAdmin";
				    			}else{		    			
				    		        model.addAttribute("success", "Welcome "+ userdetail.getFname()+". This is a secure zone! ");		    		        
				    		        model.addAttribute("attribs", userdetail);
				    		        model.addAttribute("user", userdetail.getFname());
				    		        model.addAttribute("email", "This is your email address " +userdetail.getEmailAddress());
				    		        return "rundetails";
				    			}
				    		}else{
				    			model.addAttribute("error", "Invalid credentials try again ");	
				    		}	
		    		  }
				    }
					catch(EmptyResultDataAccessException e){
						model.addAttribute("error", "User "+user.getEmailAddress()+" does not exists <a href='signups'>Sign up </a>");					    
					  }catch(RuntimeException e) {						
							model.addAttribute("error", "Unexpected error occured");
							e.printStackTrace();
						    
					  }
		    	
		    	return "login";
		    }
		    
		  
		    
		    @RequestMapping("deleteUser")
		    public String searchStudents(@RequestParam long id, ModelMap model){    	
		    			
		    	try { 
		    		UserLogin userdetail= userService.getUserById(id);
		    		if(userdetail.getRoles().equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot delete user with administrator role");
		    			model.addAttribute("users", userService.getAllusers());
			    		}else{
			    		userService.deleteUserById(id);
			            model.addAttribute("success", "User deleted successfully");
			            model.addAttribute("users", userService.getAllusers());
			    		}
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		    	return "statsAdmin";
		    }
		    
		    
		    @RequestMapping("editUser")
		    public String editUser(@RequestParam long id, @ModelAttribute UserLogin userLogin, ModelMap model){    	
		    	
		    	try {
		    		if(userService.getUserById(userLogin.getId()).getRoles().equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot edit a user with super role");
		    			model.addAttribute("users", userService.getAllusers());
		    			return "admin";
			    		}else{
		    		    model.addAttribute("attribs", userService.getUserById(id));	
				        }
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }
		    		
		    	return "dataEdit";
		    }
		    
		    
		    @RequestMapping("saveUser")
		    public String adminEdit(@ModelAttribute("saveUser") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try { 
		       		        userService.updateUserById(userLogin, userLogin.getId());
				    		model.addAttribute("message", "Update Success");
				    		model.addAttribute("users", userService.getAllusers());
				    		return "statsAdmin";
		    					    		
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "dataEdit";
		    }
		    
		    @RequestMapping(value = "/statsAdmin", method = RequestMethod.GET)
		    public String admin(Model model) {
		              	              
		        return "statsAdmin";
		    }
		    
		    @RequestMapping("assignRole")
		    public String assignrole(@ModelAttribute("assignRole") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		String role= userService.getUserById(userLogin.getId()).getRoles();
		    		if(role.equalsIgnoreCase("super")){
		    			model.addAttribute("error", "cannot re-assign new roles to a user with a super role");
		    			model.addAttribute("users", userService.getAllusers());
			    		}else{
		    		userService.updaterole(userLogin, userLogin.getRoles(), userLogin.getId());
		    		model.addAttribute("users", userService.getAllusers());
		    		model.addAttribute("success", "User "+userService.getUserById(userLogin.getId()).getFname()+" assigned role "+userLogin.getRoles());
			    		}
		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "statsAdmin";
		    }
		    
		    @RequestMapping(value = "/forgotpassword", method = RequestMethod.GET)
		    public String forgotpass(Model model) {
		    	 return "forgotpassword";
		    }
		    
		    @RequestMapping(value = "/resetpassword", method = RequestMethod.GET)
		    public String resetpass(Model model) {
		    	model.addAttribute("message", "Reset your password"); 
		    	
		        return "resetpassword";
		    }
		    
		    
		    @RequestMapping(value = "/forgotpass", method = RequestMethod.POST)
		    public String forgotpass(@ModelAttribute("forgotpass") Track track, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", track.getEmailAddress());		       	                     
		                  
		                  if(!track.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailrror", "Invalid email "+ track.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  else
				       
				             try {     
				            	 if(userService.findUser(track.getEmailAddress())== true){
				            	   mailServices.sendpasswordemail(track.getEmailAddress());
				                   model.addAttribute("success", "Password reset instuction has been sent to "+ track.getEmailAddress());
				                   model.addAttribute("emailrror", "");
				       	           model.addAttribute("em", "");
				            	 }else{
				            		 model.addAttribute("success", "user not found "+ track.getEmailAddress()); 
				            	 }
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "login";
				    }
		    
		    
		    @RequestMapping(value = "/getnewpass", method = RequestMethod.POST)
		    public String setpass(@ModelAttribute("getnewpass") UserLogin userLogin, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try {
		    		UserLogin userdetail= userService.getUserByEmailId(userLogin.getEmailAddress());
		    		if(userService.findUser(userLogin.getEmailAddress())== true){
			    		if(userLogin.getPassword().equals(userLogin.getPasswordConfirm())){
			    			if(userdetail.getRoles().equalsIgnoreCase("admin") || userdetail.getRoles().equalsIgnoreCase("super")){
			    				
			    				userService.passReset(userLogin, userLogin.getPassword(), userLogin.getEmailAddress());
					    		model.addAttribute("success", "password reset success, please keep your password safely.");
					    		mailService.sendMails(userLogin.getEmailAddress() , "Track Tracker Password", "Your password was reset contact admin if you did not do it");
				    		
					    		model.addAttribute("users", userService.getAllusers());
			    				model.addAttribute("role", "You are an admin with  "+userdetail.getRoles()+" role");
			    				return "statsAdmin";
			    			}else{	
			    				userService.passReset(userLogin, userLogin.getPassword(), userLogin.getEmailAddress());
					    		model.addAttribute("success", "password reset success, please keep your password safely.");
					    		mailService.sendMails(userLogin.getEmailAddress() , "Track Tracker Password", "Your password was reset contact admin if you did not do it");
				    		
			    		       // model.addAttribute("attribs", userdetail);
			    		        return "login";
			    			}
			    			
			    			
			    		
			    		}else{
			    			model.addAttribute("error", "Password not matching ");	
			    			return "resetpassword";
			    		}	
			    		}
		    		    else{
		    		    	model.addAttribute("error", "No user found, <a href='signups'>Sign up </a>");
		    		    }

		    		}
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					   
				  }	
		    	 return "login";
		    }
		    
		    
		    @RequestMapping("searchMembers")
		    public String searchMembers(ModelMap model, @RequestParam("searchNames") String names){    	
		    	
		    	try { 
		    		//List<UserLogin> memberList = trackService.lookupMembers(names);
		    		if(userService.lookupMembers(names).isEmpty()){          
		                model.addAttribute("error",  "There are no matches for this Look-up");
		               }
		    		else		    				
		    		    model.addAttribute("users", userService.lookupMembers(names));
				    }
					catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    
				  }
		    		
		    	return "statsAdmin";
		    }
	
	
	
		    
		    

		    
		    
		    
}


