<%@page import="javax.naming.*"%>
<%@page import="ru.coolooc.ejb.*"%>
<%@page import="ru.coolooc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>АИС Док | Заказы</title>
</head>
<body>
<%
if(session.getAttribute("sotrydnik")==null || session.getAttribute("sotrydnik")=="") {
	response.sendRedirect("login.jsp");
}
%>
<div class="container">
	<nav class="navbar navbar-default">
        <div class="container-fluid">
          	<div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
            	</button>
	            <a class="navbar-brand" href="#">АИС Док</a>
	        </div>
         	<div id="navbar" class="navbar-collapse collapse">
	            <ul class="nav navbar-nav">
					<li><a href="main-oyd.jsp">Главная</a></li>
					<li><a href="search.jsp">Поиск дел</a></li>
					<li><a href="add-delo.jsp">Добавление дел</a></li>
					<li><a href="statistics.jsp">Статистика</a></li>
					<li class="active"><a href="orders.jsp">Заказы</a></li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	              <li class="active"><a href="#"><%= session.getAttribute("FIO") %></a></li>
	              <li><a href="exit.jsp">Выход</a></li>
	            </ul>
          	</div>
        </div>
	</nav>
	<div class="well">
		<div class="alert alert-info alert-center" role="alert">Для выбора заказа нажмите "принять" или "выполнено" для выполненного заказа</div>
		<!-- 
		<div class="alert alert-success" role="alert">
        	<strong>Успешно!</strong> по запросу было найдено хх дел.
      	</div>
      	<div class="alert alert-danger" role="alert">
        	<strong>Oh snap!</strong> Change a few things up and try submitting again.
      	</div>
 		-->
<%	
Context ctx = new InitialContext();
ZakazEJB zakazEJB = (ZakazEJB) ctx.lookup ("java:global/AISDoc/ZakazEJB");
%>
		<div class="table-scroll">
			<table class="table table-striped">
	            <thead>
	              <tr>
	              	<th>Входной №</th>
	              	<th>Тема</th>
	            	<th>Фонд №</th>
	            	<th>Опись №</th>
	                <th>Дело №</th>
	                <th>Заголовок дела</th>
	                <th>Статус</th>
	                <th>Дата заказа</th>
	                <th>Действие</th>
	              </tr>
	            </thead>
	            <tbody>
	            <%
	            for(Zakaz zakaz : zakazEJB.getAllDateASC()) {
	        		out.println("<tr>");
	        			out.println("<form action=\"search-result.jsp\" method=\"get\">");
	        			out.println("<td>" + zakaz.getVhodnoiNomer() + "</td>");
	        			out.println("<td>" + zakaz.getTema() + "</td>");
	        			//String delo = String.valueOf(zakaz.getNomerFond()) + String.valueOf(zakaz.getNomerOpis()) + String.valueOf(zakaz.getNomerDelo());
	        			out.println("<td><input type=\"text\" name=\"nomerFond\" hidden value=\"" + zakaz.getNomerFond() + "\">" + zakaz.getNomerFond() + "</td>");
	        			out.println("<td><input type=\"text\" name=\"nomerOpis\" hidden value=\"" + zakaz.getNomerOpis() + "\">" + zakaz.getNomerOpis() + "</td>");
	        			out.println("<td><input type=\"text\" name=\"nomerDela\" hidden value=\"" + zakaz.getNomerDelo() + "\">" + zakaz.getNomerDelo() + "</td>");
	        			out.println("<td>" + zakaz.getZagolovokDela() + "</td>");
	        			if(zakaz.getStatus() == 0) out.println("<td><h4><span class=\"label label-warning\">не выполнено</span></h4></td>");
	        			else if(zakaz.getStatus() == 1) out.println("<td><h4><span class=\"label label-success\">выполнено</span></h4></td>");        			
	        			out.println("<td>" + zakaz.getDate() + "</td>");
	        			out.println("<td><button class=\"btn btn-success main-oyd-btn\" type=\"submit\">Принять</button><button class=\"btn btn-primary main-oyd-btn\" type=\"submit\">Выполнено</button></td>");
	        			out.println("</form>");
	            	out.println("</tr>");
	        	}
	            %>
	            </tbody>
	          </table>
          </div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>