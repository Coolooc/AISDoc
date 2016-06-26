<%@page import="javax.naming.*"%>
<%@page import="ru.coolooc.ejb.*"%>
<%@page import="ru.coolooc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(session.getAttribute("sotrydnik").toString()==null || session.getAttribute("sotrydnik").toString()=="") {
	response.sendRedirect("login.jsp");
}

try {
	Context ctx = new InitialContext();
	ZakazEJB zakazEJB = (ZakazEJB) ctx.lookup ("java:global/AISDoc/ZakazEJB");
	zakazEJB.zakazDone(session.getAttribute("sessionVhodnoiNomer").toString());
	response.sendRedirect("orders.jsp");
} catch (Exception e) {
	out.println(e.getMessage());
	response.sendRedirect("orders.jsp");
}	

%>
</body>
</html>