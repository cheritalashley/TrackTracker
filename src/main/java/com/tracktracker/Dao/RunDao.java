package com.tracktracker.Dao;


import java.util.List;

import com.tracktracker.model.Runners;

public interface RunDao {
	
	public long createRun(Runners runners);
	public List<Runners> getAllruns();
	public List<Runners> getRunByEmail(String emailAddress);
	public List<Runners> getRunById(Long id);

	
}
