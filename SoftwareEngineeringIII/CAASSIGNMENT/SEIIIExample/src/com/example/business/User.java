package com.example.business;

import java.io.Serializable;

public class User implements Serializable{


	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private String address;
	private String DOB;
	private String username;
	private String email;
	private int itaccess;
	private String password;
	
	
	
	public int getItaccess() {
		return itaccess;
	}

	public void setItaccess(int itaccess) {
		this.itaccess = itaccess;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDOB() {
		return DOB;
	}

	public void setDOB(String dOB) {
		DOB = dOB;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public User(int userId, String name, String address,
			String DOB,String username, String email, String password) {
		
		setId(userId);
		setName(name);
		setAddress(address);
		setDOB(DOB);
		setUsername(username);
		setEmail(email);
		//setItaccess(itaccess);
		setPassword(password);
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
