<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "com.example.business.User" %>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	</head>
	<body>
	
		<table>
				<% List<User> listusers; 
			listusers = (List)(request.getSession().getAttribute("listusers"));
			
			if(listusers != null)
			{	
				for(User u: listusers)
				{	%>
		
		<tr>
			<td><%=u.getId()%></td>
			<td><%=u.getUsername()%></td>
			<td><%=u.getName()%></td>
			<td><%=u.getAddress()%></td>
			<td><%=u.getDOB()%></td>
			<td><%=u.getEmail() %></td>
			<td><%=u.getPassword()%></td>
			</tr>
		<%}
				}%>
		</table>
	</body>
</html>