<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="hasher" class="org.jboss.qa.HasherData" scope="page"/>
<jsp:setProperty name="hasher" property="*"/>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>AS7 Password Hasher</title>
</head>
<body>
	<form method="post" action="hasher.jsp">
	
	  <label for="text-username">Username:</label>
	  <input id="text-username" name="textUsername" value="<%= hasher.getTextUsername()==null ? "" : hasher.getTextUsername()  %>" type="text" size="30" />
	  <br/>	
	
	  <label for="text-password">Password:</label>
	  <input id="text-password" name="textPassword" value="<%= hasher.getTextPassword()==null ? "" : hasher.getTextPassword() %>" type="text" size="30" />
	  <br/>	
	
	  <label for="select-realm">Realm name:</label>
	  <select id="select-realm" name="selectRealm">
		  <option value="ManagementRealm" <%= "ManagementRealm".equals(hasher.getSelectRealm()) ? "selected" : "" %>>ManagementRealm</option> 
		  <option value="ApplicationRealm" <%= "ApplicationRealm".equals(hasher.getSelectRealm()) ? "selected" : "" %>>ApplicationRealm</option>
      </select>
	  <br/>
	  
	  <input type="submit" value="Submit"/>
	</form>
	<p>
		<% 		
		if(hasher.getTextUsername()!=null && hasher.getTextPassword()!=null) { 
			  out.println("<b>Username: </b>" + hasher.getTextUsername() + 
					      ", <b>Password: </b>" + hasher.getTextPassword() +
					      ", <b>Realm: </b>" + hasher.getSelectRealm());
		      out.println("<br/><b>Hash: </b> " + hasher.getHashedText());
		      out.println("<br/><i>" + hasher.getTextUsername() + "=" + hasher.getHashedText() + "</i>");
		} else {
			out.println("<br/>Hash was not calculated. Probably some field value is missing.");
		}
		%>
	</p>
</body>
</html>