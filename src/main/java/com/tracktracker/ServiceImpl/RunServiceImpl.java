package com.tracktracker.ServiceImpl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.tracktracker.Dao.RunDao;
import com.tracktracker.model.Runners;
import com.tracktracker.service.RunService;


@Service
@Transactional
public class RunServiceImpl implements RunService {

	@Autowired
	RunDao runDao;
	

	@Override
	public long createRun(Runners runners) {
		return runDao.createRun(runners);
	}


	@Override
	public List<Runners> getAllruns() {
		return runDao.getAllruns();
	}
	
	@Override
	public List<Runners> getRunById(Long id) {
		return runDao.getRunById(id);
	}
	
	@Override
	public List<Runners> getRunByEmail(String emailAddress){
		return runDao.getRunByEmail(emailAddress);
	}
}
