package com.example.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.User;
import com.example.service.UserService;

public class ModifyAccountCommand implements Command{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
			
		UserService userService = new UserService();
		String forwardToJsp = "";	
		
		//getting the modified details from the session
		String name = request.getParameter("setName");
		String address = request.getParameter("setAddress");
		String DOB = request.getParameter("setDOB");
		String email = request.getParameter("setEmail");
		//String modifyAccount = request.getParameter("modifyAccountDet");
		
		HttpSession session = request.getSession();
		int getID = Integer.parseInt(request.getParameter("ID"));
		
		User detailsChanged = userService.modifyAccount(name,address, DOB,email,getID);
		
		session.setAttribute("user", detailsChanged);
		
		forwardToJsp = "/ViewUserProfile.jsp";					
		
		return forwardToJsp;
	}

}
