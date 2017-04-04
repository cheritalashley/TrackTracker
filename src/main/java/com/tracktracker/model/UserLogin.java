package com.tracktracker.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class UserLogin implements Serializable {
	
	private static final long serialVersionUID = -7988799579036200037L;	
	
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;
	private String roles;		     
    private String lname;
    private String fname;
    @Column(updatable=false)
	private String emailAddress;
	private String password;
	private String passwordConfirm;
	private String athleteName;
	private int athleteAge;
	private String athleteTeam;
	private String bestEvent;
	private String bestEvent2;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPasswordConfirm() {
		return passwordConfirm;
	}
	public void setPasswordConfirm(String passwordConfirm) {
		this.passwordConfirm = passwordConfirm;
	}
	public String getAthleteName() {
		return athleteName;
	}
	public void setAthleteName(String athleteName) {
		this.athleteName = athleteName;
	}
	public int getAthleteAge() {
		return athleteAge;
	}
	public void setAthleteAge(int athleteAge) {
		this.athleteAge = athleteAge;
	}
	public String getAthleteTeam() {
		return athleteTeam;
	}
	public void setAthleteTeam(String athleteTeam) {
		this.athleteTeam = athleteTeam;
	}
	public String getBestEvent() {
		return bestEvent;
	}
	public void setBestEvent(String bestEvent) {
		this.bestEvent = bestEvent;
	}
	public String getBestEvent2() {
		return bestEvent2;
	}
	public void setBestEvent2(String bestEvent2) {
		this.bestEvent2 = bestEvent2;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}	 

}
