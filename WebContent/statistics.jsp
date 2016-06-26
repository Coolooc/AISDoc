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
    <title>АИС Док | Статистика</title>
</head>
<body>
<%
//сделать ограничение на ОИЗ, чтобы ваще не зашёл сюда.
if(session.getAttribute("sotrydnik").toString()==null || session.getAttribute("sotrydnik").toString()=="") {
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
					<li class="active"><a href="statistics.jsp">Статистика</a></li>
					<li><a href="orders.jsp">Заказы</a></li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	              <li class="active"><a href="#"><%= session.getAttribute("FIO").toString() %></a></li>
	              <li><a href="exit.jsp">Выход</a></li>
	            </ul>
          	</div>
        </div>
	</nav>
  	<div class="well">
<%
Context ctx = new InitialContext();
TopografiyaEJB topografiyaEJB = (TopografiyaEJB) ctx.lookup ("java:global/AISDoc/TopografiyaEJB");
%>
		<div class="alert alert-info alert-center" role="alert">Для составления статистической диаграммы выберите подходящий вариант.</div>
	    <div class="div-statistics-center">
			<h2>Количество всех дел по фондам</h2>
			<a href="statistics-all-fond-all-delo.jsp"><button class="btn btn-lg btn-primary form-statistics-btn" type="button">Просмотреть диаграмму</button></a>
			<h2>Количество дел относящихся к фонду</h2>
			<form action="statistics-fond-delo.jsp" method="post">
				<select name="select-fond" class="form-statistics-select">
				<%
					for (Integer nomerFond : topografiyaEJB.findNomerFond()) {
						out.println("<option value=\"" + nomerFond + "\">" + nomerFond + "</option>");
					}
				 %>
				</select>
				<button class="btn btn-lg btn-primary form-statistics-btn" type="submit">Просмотреть диаграмму</button>
			</form>
			<h2>Хранилища относящиеся к фонду</h2>
			<form action="statistics-fond-hranilishe.jsp" method="post">
				<select name="select-fond" class="form-statistics-select">
				<%
					for (Integer nomerFond : topografiyaEJB.findNomerFond()) {
						out.println("<option value=\"" + nomerFond + "\">" + nomerFond + "</option>");
					}
				 %>
				</select>
				<button class="btn btn-lg btn-primary form-statistics-btn" type="submit">Просмотреть диаграмму</button>
			</form>
	  	</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>