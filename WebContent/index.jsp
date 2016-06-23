<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<%
//pageContext.forward("login.jsp");
//response.sendRedirect("login.jsp");
try {
	session = request.getSession();
	
	if(session.getAttribute("sotrydnik").equals("oyd")) {
		response.sendRedirect("main-oyd.jsp");
	}
	else if(session.getAttribute("sotrydnik").equals("oiz")) {
		response.sendRedirect("main-oiz.jsp");
	}
	
} catch (Exception e) {
	response.sendRedirect("login.jsp");
}

//<jsp:forward page="login.jsp"></jsp:forward>
%>

</body>
</html>