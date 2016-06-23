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
		<div class="alert alert-info alert-center" role="alert">Для начала поиска необходимо ввести номер: фонда, описи, дела</div>
		<form action="search-result.jsp" method="get" class="form-search">
  			<h2>Поиск дел по топографии</h2>
		    <input type="number" min="1" max="999" name="nomerFond" class="form-search-control" placeholder="Фонд №" required autofocus>
		    <input type="number" min="1" max="999" name="nomerOpis" class="form-search-control" placeholder="Опись №" required>
		    <input type="number" min="1" max="9999" name="nomerDela" class="form-search-control" placeholder="Дело №" required>
		    <button class="btn btn-lg btn-primary form-search-btn" type="submit">Найти</button>
  		</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>