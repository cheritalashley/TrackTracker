package com.tracktracker.DaoImpl;

import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.tracktracker.Dao.RunDao;
import com.tracktracker.Repository.HibernateUtil;
import com.tracktracker.model.Runners;

@Repository
public class RunDaoImpl implements RunDao{

	@Autowired
	DataSource dataSource;
	public RunDaoImpl() {
    	System.out.println("RunDaoImpl");
    }
	
	@Autowired
    private HibernateUtil hibernateUtil;
	
	@Override
	public long createRun(Runners runners) {
		return (Long) hibernateUtil.create(runners);
	}

	@Override
	public List<Runners> getAllruns() {
		return hibernateUtil.fetchAll(Runners.class);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Runners> getRunById(Long id) {
		return (List<Runners>) hibernateUtil.fetchById(id, Runners.class);
	}

	@Override
	public List<Runners> getRunByEmail(String emailAddress) {
		return null;
	}
}