package com.example.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.User;
import com.example.service.UserService;

public class ViewUserProfileCommand implements Command{
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
		
		UserService userService = new UserService();
		String forwardToJsp = "";		

		HttpSession session = request.getSession();
		
		forwardToJsp = "/ViewUserProfile.jsp";
		
		return forwardToJsp;
	}

}
