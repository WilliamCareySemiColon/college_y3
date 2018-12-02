package com.example.service;

import java.util.ArrayList;

import com.example.business.User;
import com.example.dao.UserDao;
import com.example.exceptions.DaoException;

public class UserService {

	UserDao dao = new UserDao();
	
	public User login(String username, String password){
		
		User u = null;
		try {			
			u = dao.findUserByUsernamePassword(username, password);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
	public User viewDetails(int id)
	{
		User u = null;
		try {			
			u = dao.getUserDetails(id);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
	}
	
	public User modifyAccount(String name, String address, String DOB, String email, int id)
	{
		User u =  null;
		
		try {
			u = dao.modifyAccount(name, address, DOB, email, id);
		}
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
	}
	public ArrayList<User> getAllUsers() {
			
			ArrayList<User> members = null;
			
			try {
				members = dao.getAllUsers();
			}
			catch (DaoException e) {
				e.printStackTrace();
			}
			
			return members;
		}
}
