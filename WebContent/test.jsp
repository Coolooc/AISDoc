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
<% out.println("asd"); %>
<%

Context ctx = new InitialContext();
TopografiyaEJB topografiyaEJB = (TopografiyaEJB) ctx.lookup ("java:global/AISDoc/TopografiyaEJB");

/* for (Integer qwe : topografiyaEJB.findNomerFond()) {
	out.println(qwe);
	out.println("<br>");
} */

/* String select1 = "select1";
out.println(select1);
out.println(topografiyaEJB.getCountByNomerFond("4")); */

//out.println(testUserEJB.findByLogin("user1").getPassword());

/* for(SotrydnikOyd sotrydnikOyd : sotrydnikOydEJB.getAll()) {
	out.println(sotrydnikOyd.getIdSotrydnikOyd());
	out.println(sotrydnikOyd.getImya());
	out.println(sotrydnikOyd.getFamiliya() + "<br>");
} */

%>

</body>
</html>