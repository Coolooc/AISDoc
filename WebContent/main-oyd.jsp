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
    <title>АИС Док | Главная</title>
</head>
<body>
<%
//сделать ограничение на ОИЗ, чтобы ваще не зашёл сюда.ы
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
					<li class="active"><a href="#">Главная</a></li>
					<li><a href="search.jsp">Поиск дел</a></li>
					<li><a href="add-delo.jsp">Добавление дел</a></li>
					<li><a href="statistics.jsp">Статистика</a></li>
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
  		<div class="div-main-oyd-center">
	        <h2>Здравствуйте <%= session.getAttribute("FIO").toString() %></h2>
	        <div class="alert alert-info alert-center" role="alert">Для продолжения работы с системой выберите направление.</div>
	        <a href="search.jsp"><button class="btn btn-lg btn-primary main-oyd-btn" type="button">Поиск дел</button></a>
	        <a href="add-delo.jsp"><button class="btn btn-lg btn-primary main-oyd-btn" type="button">Добавление дел</button></a>
	        <a href="statistics.jsp"><button class="btn btn-lg btn-primary main-oyd-btn" type="button">Статистика</button></a>
	        <a href="orders.jsp"><button class="btn btn-lg btn-primary main-oyd-btn" type="button">Заказы</button></a>
        </div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>