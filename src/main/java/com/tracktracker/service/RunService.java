package com.tracktracker.service;

import java.util.List;

import com.tracktracker.model.Runners;

public interface RunService {
	
	//users
	
	public long createRun(Runners runners);
	public List<Runners> getAllruns();
	public List<Runners> getRunById(Long id);

	public List<Runners> getRunByEmail(String emailAddress);
	
}
