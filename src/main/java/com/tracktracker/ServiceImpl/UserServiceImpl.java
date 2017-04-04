package com.tracktracker.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tracktracker.Dao.UserDao;
import com.tracktracker.model.UserLogin;
import com.tracktracker.service.UserService;


@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao userDao;
	
	@Override
	public boolean findUser(String email) {
		return userDao.findUser(email);
	}

	@Override
	public long createUser(UserLogin userLogin) {
		return userDao.createUser(userLogin);
	}

	@Override
	public UserLogin updateUser(UserLogin userLogin) {
		return userDao.updateUser(userLogin);
	}

	@Override
	public void deleteUserById(long id) {
		userDao.deleteUserById(id);
		
	}

	@Override
	public List<UserLogin> getAllusers() {
		return userDao.getAllusers();
	}

	@Override
	public UserLogin getUserByEmailId(String email) {
		return userDao.getUserByEmailId(email);
	}

	@Override
	public UserLogin getUserById(long id) {
		return userDao.getUserById(id);
	}

	@Override
	public void updaterole(UserLogin userLogin, String role, long id) {
		userDao.updaterole(userLogin, role, id);
		
	}

	
	@Override
	public void passReset(UserLogin userLogin, String pass, String email) {
		userDao.passReset(userLogin, pass, email);
		
	}

	@Override
	public List<UserLogin> lookupMembers(String name) {		
		return userDao.lookupMembers(name);
	}

	@Override
	public void updateUserById(UserLogin userLogin, long id) {
		userDao.updateUserById(userLogin, id);
		
	}

	@Override
	public List<UserLogin> lookupCity(String cityOrZip) {
		return userDao.lookupCity(cityOrZip);
	}

	@Override
	public List<UserLogin> getUserByName(String user) {
		return userDao.getUserByName(user);
	}

}
