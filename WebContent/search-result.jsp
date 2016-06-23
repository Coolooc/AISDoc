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
    <title>АИС Док | Поиск дел по топографии</title>
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
					<li class="active"><a href="search.jsp">Поиск дел</a></li>
					<li><a href="add-delo.jsp">Добавление дел</a></li>
					<li><a href="statistics.jsp">Статистика</a></li>
					<li><a href="orders.jsp">Заказы</a></li>
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	              <li class="active"><a href="#"><%= session.getAttribute("FIO") %></a></li>
	              <li><a href="exit.jsp">Выход</a></li>
	            </ul>
          	</div>
        </div>
	</nav>
	<div class="well">
		<div class="alert alert-info alert-center" role="alert">Результат поиска</div>
		<!-- 
		<div class="alert alert-success" role="alert">
        	<strong>Успешно!</strong> по запросу было найдено хх дел.
      	</div>
      	<div class="alert alert-danger" role="alert">
        	<strong>Oh snap!</strong> Change a few things up and try submitting again.
      	</div>
 		-->
<%
String nomerFond = request.getParameter("nomerFond");
String nomerOpis = request.getParameter("nomerOpis");
String nomerDela = request.getParameter("nomerDela");

if(nomerFond!=null && nomerFond!="" && nomerOpis!=null && nomerOpis!="" && nomerDela!=null && nomerDela!="" ) {
	
	Context ctx = new InitialContext();
	TopografiyaEJB topografiyaEJB = (TopografiyaEJB) ctx.lookup ("java:global/AISDoc/TopografiyaEJB");
	
	try {
		Topografiya topografiya = topografiyaEJB.findDelo(nomerFond, nomerOpis, nomerDela);
		//out.print(topografiya.getNomerFond());
	
%>
		<div class="table-scroll">
		<table class="table table-striped">
            <thead>
              <tr>
              	<th>Название фонда</th>
            	<th>Фонд #</th>
            	<th>Опись #</th>
                <th>Хранилище #</th>
                <th>Этаж #</th>
                <th>Стелаж #</th>
                <th>Полка #</th>
                <th>Дело #</th>
                <th>Заголовок дела</th>
              </tr>
            </thead>
            <tbody>
              <tr>
              	<td><%= topografiya.getNazvanieFonda() %></td>
              	<td><%= topografiya.getNomerFond() %></td>
              	<td><%= topografiya.getNomerOpis() %></td>
               	<td><%= topografiya.getNomerHranilishe() %></td>
                <td><%= topografiya.getNomerEtaj() %></td>
                <td><%= topografiya.getNomerStellaj() %></td>
                <td><%= topografiya.getNomerPolka() %></td>
                <td><%= topografiya.getNomerDela() %></td>
                <td><%= topografiya.getZagolovokDela() %></td>
              </tr>
            </tbody>
          </table>
          </div>
<%
 	} catch (Exception e) {
		out.println("<div class=\"alert alert-danger alert-center\" role=\"alert\">");
		out.println("<strong>Ошибка!</strong> Ничего не найдено. Попробуйте ещё раз.");
		out.println("</div>");
	} 
}
%>
		<a href="search.jsp"><button class="btn btn-lg btn-primary form-reports-btn" type="button">Назад</button></a>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>