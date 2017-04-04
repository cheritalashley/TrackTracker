package com.tracktracker.controller;

import java.text.ParseException;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.tracktracker.model.Runners;
import com.tracktracker.model.UserLogin;
import com.tracktracker.model.Track;
import com.tracktracker.service.RunService;
import com.tracktracker.service.SendMail;
import com.tracktracker.service.UserService;


@Controller
public class RunController {
    
	@Autowired
	   private UserService userService; 
	@Autowired
	   private RunService runService; 
	
		    public RunController() {
				System.out.println("in RunController servelet");
			}
		    
		   
		    SendMail sendMail =new SendMail();
	       
		    @Autowired
		    DataSource dataSource;
	    
	       @RequestMapping(value = {"index", "/"}, method = RequestMethod.GET)
		    public String index(Model model){		    
		    	return "index";				 
			}
	       
	       @RequestMapping("runDetails")
		    public String runDetails(@ModelAttribute("runDetails") Runners runners, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try{
		    		runService.createRun(runners);
		    		model.addAttribute("message", "Successfully Entered Run!"); 
		    		model.addAttribute("message1", "Do you want to enter another run?"); 
		    		UserLogin userdetail= userService.getUserByEmailId(runners.getEmailAddress());
		    		model.addAttribute("attribs", userdetail);
		    	}catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    }
		    	return "rundetails";	
		    }
	       
		    @RequestMapping(value = "/about", method = RequestMethod.GET)
		    public String about(Model model) {
		    	
		        return "about";
		    }
		    
		    @RequestMapping(value = "/stats", method = RequestMethod.GET)
		   public String stats(@RequestParam("emailAddress") String emailAddress, Model model) throws ParseException{
		    	UserLogin userdetail= userService.getUserByEmailId(emailAddress);
 		        	model.addAttribute("name", userdetail.getAthleteName());
 		        	model.addAttribute("team", userdetail.getAthleteTeam());
 		        	model.addAttribute("age", userdetail.getAthleteAge());
 		        	model.addAttribute("bestevent", userdetail.getBestEvent());
 		        	model.addAttribute("bestevent2", userdetail.getBestEvent2());
 		        	model.addAttribute("attribs", getbyEmail(userdetail.getEmailAddress()));
 		        	model.addAttribute("attribs2", getAvgTime(userdetail.getEmailAddress()));
		        return "stats";
		    }
		    
		    @RequestMapping(value = "/stats", method = RequestMethod.POST)
		    public String stats(@ModelAttribute("stats") Runners runners, BindingResult bindingResult, ModelMap model) throws ParseException{    	
		    	try{
		    		runService.createRun(runners); 
		    		model.addAttribute("attribs", "Welcome to Track Tracker!"); 
		    	}catch(RuntimeException e) {
						model.addAttribute("error", "Unexpected error occured");
					    e.printStackTrace();
					    }
		    	return "stats";	
		    }
		    
		    @RequestMapping(value = "/contact", method = RequestMethod.GET)
		    public String contact(Model model) {
		    	model.addAttribute("sendEmail", new UserLogin());
		    	model.addAttribute("message", "Welcome to Track Tracker!"); 
		    	model.addAttribute("message1", "Please drop us an email"); 
		        return "contact";
		    }
		    
		    @SuppressWarnings("rawtypes")
			public List<Runners> getbyEmail(String emailAddress) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);  
		       	final String sql  = "SELECT * FROM runs WHERE emailAddress like '%"+ emailAddress +"%'"
   									+	"ORDER BY event AND athleteTime";
		       	@SuppressWarnings("unchecked")
		   		List<Runners> runnersDetails = jdbcTemplate.query(sql, new BeanPropertyRowMapper( Runners.class ));						
		   		return runnersDetails;
			}
		    
		    @SuppressWarnings("rawtypes")
			public List<Runners> getAvgTime(String emailAddress) {
				JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);        	
		       	final String sql  = "SELECT AVG(athleteTime) AS avg, event FROM runs WHERE emailAddress like '%"+ emailAddress +"%'"
		       						+"GROUP BY event";
		       	@SuppressWarnings("unchecked")
		   		List<Runners> runnersDetails = jdbcTemplate.query(sql, new BeanPropertyRowMapper( Runners.class ));						
		   		return runnersDetails;
			}
 
		    @RequestMapping(value = "/sendEmail", method = RequestMethod.POST)
		    public String sendMail(@ModelAttribute("sendEmail") Track track, BindingResult bindingResult, Model model) { 
		    	          
		    	          String validemails = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$"; 
		    	          model.addAttribute("em", track.getEmailAddress());
		       	          model.addAttribute("sb", track.getSubject());              
		                 // String message="Subject: " +track.getSubject()+"\nMessage: " + track.getMsg();
		          
		                  if(!track.getEmailAddress().matches(validemails)) {
		                	  model.addAttribute("emailrror", "Invalid email "+ track.getEmailAddress()+ " use format johnsmith@scglobal.com ");		                  
		   	               }
		                  
		                  if(track.getSubject().isEmpty()) {
		                	  model.addAttribute("sbjrror", "Please enter Emain Subject");		                   
		   		           }  
		                  
		                  if(track.getMsg().length() <= 1 || track.getMsg().length() > 300) {
		                	  model.addAttribute("msgerror", "Must be between 10 and 300 characters");		                   
		   		           }
		                  
		                  else
				       
				             try {     
				            	   sendMail.sendMails(track.getEmailAddress() , track.getSubject(), track.toString());					          
				                   model.addAttribute("success", "Thanks Email has been sent to "+ track.getEmailAddress());
				                   model.addAttribute("emailrror", "");  
				                   model.addAttribute("sbjrror", "");		                   
				       	           model.addAttribute("msgerror", "");
				       	           model.addAttribute("em", "");
				       	           model.addAttribute("sb", "");   
				       	           
						        }catch(Exception e) {
						                 model.addAttribute("sendmailfail", "Error sending email  " );
						                 e.printStackTrace();
						        }
						
						return "contact";
				    }
		
}


