package com.tracktracker.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "runs")
public class Runners {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
	private String emailAddress;
	private String athleteName;
	private String event;
	private String dateofRun;
	private String meetName;
	private Double athleteTime;
	private String athletePlace;
	private String numRunners;
	private String heatBest;
	private Double avg;
	
	public Double getAvg() {
		return avg;
	}
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getAthleteName() {
		return athleteName;
	}
	public void setAthleteName(String athleteName) {
		this.athleteName = athleteName;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}	
	
	public String getEvent() {
		return event;
	}
	public void setEvent(String event) {
		this.event = event;
	}
	public String getDateofRun() {
		return dateofRun;
	}
	public void setDateofRun(String dateofRun) {
		this.dateofRun = dateofRun;
	}
	public String getMeetName() {
		return meetName;
	}
	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}
	public Double getAthleteTime() {
		return athleteTime;
	}
	public void setAthleteTime(Double athleteTime) {
		this.athleteTime = athleteTime;
	}
	public String getAthletePlace() {
		return athletePlace;
	}
	public void setAthletePlace(String athletePlace) {
		this.athletePlace = athletePlace;
	}
	public String getNumRunners() {
		return numRunners;
	}
	public void setNumRunners(String numRunners) {
		this.numRunners = numRunners;
	}
	public String getHeatBest() {
		return heatBest;
	}
	public void setHeatBest(String heatBest) {
		this.heatBest = heatBest;
	}
	
}


