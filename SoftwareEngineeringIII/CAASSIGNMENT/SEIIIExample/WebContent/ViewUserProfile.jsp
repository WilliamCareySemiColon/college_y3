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
	
	Servlet forwarded to me .....ViewUserProfile<br><br>
		
		<c:set var="user" value="${sessionScope.user}"/>
		<b>Hello <c:out value="${user.name}"/></b><br><br>
		<b>Here are your details</b><br><br>
		<b>Name: <c:out value="${user.name}"/></b><br>
		<b>Address: <c:out value="${user.address}"/></b><br>
		<b>DOB: <c:out value="${user.DOB}"/></b><br>
		<b>Username: <c:out value="${user.username}"/></b><br>
		<b>Email: <c:out value="${user.email}"/></b><br>
		<b>Password: <c:out value="${user.password}"/></b><br>
		<b>ID: <c:out value="${user.id}"/></b><br><br>
		
		Modify Your Account details
		<form action="FrontController" method="post">
			Name:<input type = "text" name = "setName"/><br>
			Address<input type = "text" name = "setAddress"/><br>
			DOB:<input type = "text" name = "setDOB"/><br>
			Email:<input type = "email" name = "setEmail"/><br>
			By changing these details, I wish to confirm these modifications <br>
			through the checkout by entering my username, password and ID<br>
			Username:<input type = "text" name = "username"/><br>
			Password:<input type = "password" name = "password"/><br>
			ID:<input type = "text" name = "ID"/><br>
		    <input type="hidden" name="action" value="ModifyAccount" />
	        <input type="submit" value="Confirm Modify" />
    	</form>
	</body>
</html>