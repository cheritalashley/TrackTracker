package com.tracktracker.DaoImpl;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.tracktracker.Dao.UserDao;
import com.tracktracker.Repository.HibernateUtil;
import com.tracktracker.model.UserLogin;

@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	DataSource dataSource;
	public UserDaoImpl() {
    	System.out.println("TrackDaoImpl");
    }
	
	@Autowired
    private HibernateUtil hibernateUtil;


	@Override
	public boolean findUser(String email) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
    	String sql = "select emailAddress from users where emailAddress = ? ";
        
        try {
        	jdbcTemplate.queryForObject(sql, String.class, email);
        	System.out.println("true" );
            return true;
        } catch (EmptyResultDataAccessException e) {
        	System.out.println("false");
            return false;
        }
	}

	
	@Override
	public long createUser(UserLogin userLogin) {
		return (Long) hibernateUtil.create(userLogin);
	}

	@Override
	public UserLogin updateUser(UserLogin userLogin) {
		return hibernateUtil.update(userLogin);
		}

	@Override
	public void deleteUserById(long id) {
		UserLogin userLogin = new UserLogin();
		userLogin.setId(id);
        hibernateUtil.delete(userLogin);
		
	}

	@Override
	public List<UserLogin> getAllusers() {
		return hibernateUtil.fetchAll(UserLogin.class);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public UserLogin getUserByEmailId(String email){
		String sql = "SELECT * FROM users where emailAddress= ?";
     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
     UserLogin userLogin = (UserLogin) jdbcTemplate.queryForObject(
     sql, new Object[] { email }, new BeanPropertyRowMapper(UserLogin.class));
     return userLogin;
	}


	@Override
	public UserLogin getUserById(long id) {
		UserLogin userLogin = new UserLogin();
		userLogin.setId(id);
		return hibernateUtil.fetchById(id, UserLogin.class);
	}


	@Override
	public void updaterole(UserLogin userLogin, String role, long id) {    	
    	String UpdateSql = "UPDATE users SET roles=? where id=? ";    	
  	     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		  	  jdbcTemplate.update(
		  			UpdateSql,
		  			new Object[] { 		   
		  					    userLogin.getRoles(), 
		  					    userLogin.getId()
		  					  
		  						});  
		  	
		  	
  	  }


	   


	@Override
	 public void passReset(UserLogin userLogin, String pass, String email) {    	
    	String UpdateSql = "UPDATE users SET password=? where emailAddress=? ";    	
  	     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		  	  jdbcTemplate.update(
		  			UpdateSql,
		  			new Object[] { 		   
		  					    userLogin.getPassword(), 
		  					    userLogin.getEmailAddress()
		  					  
		  						});  
		  	
		  	
  	  }


	

	@Override
	@SuppressWarnings("rawtypes")
	public List<UserLogin> lookupMembers(String name) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);        	
       	final String sql  = "SELECT m.* FROM users m WHERE m.lname like '%"+ name +"%'";
       	@SuppressWarnings("unchecked")
   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
   		return memberList;
   		 
	}


	


	@Override
	public void updateUserById(UserLogin userLogin, long id) {

		String UpdateSql = "UPDATE users SET address=?, age=?, card=?, city=?, emailAddress=?, fname=?,"
		         + " lname=?, state=?, tel=?, zip=?, where id=? ";    	
	     JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
	  	  jdbcTemplate.update(
	  			UpdateSql,
	  			new Object[] { 
	 
	  					userLogin.getEmailAddress(),
	  					userLogin.getFname(),
	  					userLogin.getLname(),
	  					userLogin.getId()
	  					
	  					}); 	  			
	     }


	@Override
	@SuppressWarnings("rawtypes")
	public List<UserLogin> lookupCity(String cityOrZip) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);   
		
       	final String sql  = "SELECT n.* FROM users n WHERE n.city like '%"+ cityOrZip +"%'"
       			+ " UNION " + "SELECT n.* FROM users n WHERE n.zip like '%"+ cityOrZip +"%'";
       	@SuppressWarnings("unchecked")
   		List<UserLogin> memberList = jdbcTemplate.query(sql, new BeanPropertyRowMapper( UserLogin.class ));						
   		return memberList;
	}

		
		@Override
		@SuppressWarnings("unchecked")
		public List<UserLogin> getUserByName(String lastname) { 

		String query = "SELECT m.* FROM users m WHERE m.lname like '%"+ lastname +"%'";
		List<Object[]> UserLoginObjects = hibernateUtil.fetchAll(query);
		List<UserLogin> UserLogins = new ArrayList<UserLogin>();
		for(Object[] UserLoginObject: UserLoginObjects) {
		UserLogin UserLogin = new UserLogin();
		//id, address, age, card, city, emailAddress, fname, lname, password, roles, state, tel, zip, passwordConfirm
		long id = ((BigInteger) UserLoginObject[0]).longValue();	
		String emailAddress = (String) UserLoginObject[5];	
		String fname = (String) UserLoginObject[6];	
		String lname = (String) UserLoginObject[7];
		String role = (String) UserLoginObject[9];	
	
		UserLogin.setId(id);
		UserLogin.setLname(lname);
		UserLogin.setFname(fname);	
		UserLogin.setEmailAddress(emailAddress);
		UserLogin.setRoles(role);

		UserLogins.add(UserLogin);
		}
		System.out.println(UserLogins);
		return UserLogins;
		}

	
}
