<%@page import="javax.naming.*"%>
<%@page import="ru.coolooc.ejb.*"%>
<%@page import="ru.coolooc.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request.setCharacterEncoding("UTF-8");
//response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>АИС Док | Добавление новых дел в топографию</title>
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
					<li class="active"><a href="add-delo.jsp">Добавление дел</a></li>
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
		<div class="alert alert-info alert-center" role="alert">Для добавления дела в топографию вам необходимо ввести название фонда, номер: фонда, описи, хранилища, этажа, стеллажа, полки, дела и заголовок дела</div>		
<%
String nazvanieFonda = request.getParameter("nazvanieFonda");
String nomerFond = request.getParameter("nomerFond");
String nomerOpis = request.getParameter("nomerOpis");
String nomerHranilishe = request.getParameter("nomerHranilishe");
String nomerEtaj = request.getParameter("nomerEtaj");
String nomerStellaj = request.getParameter("nomerStelaj");
String nomerPolka = request.getParameter("nomerPolka");
String nomerDela = request.getParameter("nomerDela");
String zagolovokDela = request.getParameter("zagolovokDela");

if(nomerFond!=null && nomerFond!="" && nomerOpis!=null && nomerOpis!="" &&
	nomerHranilishe!=null && nomerHranilishe!="" && nomerEtaj!=null && nomerEtaj!="" &&
	nomerStellaj!=null && nomerStellaj!="" && nomerPolka!=null && nomerPolka!=""
	&& nomerDela!=null && nomerDela!="" && nazvanieFonda!=null && nazvanieFonda!="" ) {
	
	Context ctx = new InitialContext();
	TopografiyaEJB topografiyaEJB = (TopografiyaEJB) ctx.lookup ("java:global/AISDoc/TopografiyaEJB");
	
	try {
		topografiyaEJB.addDelo(nazvanieFonda, nomerFond, nomerOpis, nomerHranilishe,
				nomerEtaj, nomerStellaj, nomerPolka, nomerDela, zagolovokDela);
		
		out.println("<div class=\"alert alert-success alert-center\" role=\"alert\">");
		out.println("<strong>Успешно!</strong> Новое дело было добавлено в топографию.<br>" +
		"Название фонда: " + nazvanieFonda +
		"<br>Фонд №: " + nomerFond +
		" Опись №: " + nomerOpis +
		" Хранилище №: " + nomerHranilishe +
		" Этаж №: " + nomerEtaj +
		" Стелаж №: " + nomerStellaj +
		" Полка №: " + nomerPolka +
		" Дело №: " + nomerDela +
		"<br>Заголовок дела: " + zagolovokDela);
		out.println("</div>");

 	} catch (Exception e) {
		out.println("<div class=\"alert alert-danger alert-center\" role=\"alert\">");
		out.println("<strong>Ошибка!</strong> Попробуйте ещё раз.");
		out.println("</div>");
	} 
}
%>
		<form action="" method="post" class="form-add-delo">
  			<h2>Добавление новых дел в топографию</h2>
  			<input type="text" maxlength="50" name="nazvanieFonda" class="form-add-delo-control2" placeholder="Название фонда" required autofocus><br>
		    <input type="number" min="1" max="999" name="nomerFond" class="form-add-delo-control" placeholder="Фонд №" required>
		    <input type="number" min="1" max="999" name="nomerOpis" class="form-add-delo-control" placeholder="Опись №" required><br>
		    <input type="number" min="1" max="9" name="nomerHranilishe" class="form-add-delo-control" placeholder="Хранилище №" required>
		    <input type="number" min="1" max="2" name="nomerEtaj" class="form-add-delo-control" placeholder="Этаж №" required><br>
		    <input type="number" min="1" max="999" name="nomerStelaj" class="form-add-delo-control" placeholder="Стеллаж №" required>
		    <input type="number" min="1" max="9" name="nomerPolka" class="form-add-delo-control" placeholder="Полка №" required><br>
		    <input type="number" min="1" max="9999" name="nomerDela" class="form-add-delo-control" placeholder="Дело №" required>
		    <input type="text" maxlength="50" name="zagolovokDela" class="form-add-delo-control" placeholder="Заголовок дела" required><br>
		    <button class="btn btn-lg btn-primary form-add-delo-control-btn" type="submit">Добавить</button>
  		</form>
	</div>
</div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>