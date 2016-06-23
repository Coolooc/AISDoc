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
    <title>АИС Док | Пожалуйста войдите</title>
</head>
<body>
<div class="container">
	<nav class="navbar navbar-default">
        <div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">АИС Док</a>
			</div>
        </div>
	</nav>
	<div class="well">
<%
String login = request.getParameter("login");
String password = request.getParameter("password");
String sotrydnik = request.getParameter("sotrydnik");

if(login!=null && login!="" && password!=null && password!="" && sotrydnik!=null && sotrydnik!="" ) {
	/* out.println(login);
	out.println(password);
	out.println(sotrydnik); */
	
	Context ctx = new InitialContext();
	SotrydnikOydEJB sotrydnikOydEJB = (SotrydnikOydEJB) ctx.lookup ("java:global/AISDoc/SotrydnikOydEJB");
	SotrydnikOizEJB sotrydnikOizEJB = (SotrydnikOizEJB) ctx.lookup ("java:global/AISDoc/SotrydnikOizEJB");
	
	if(sotrydnik.equals("oyd")) {
		try {
			SotrydnikOyd sotrydnikOyd = sotrydnikOydEJB.findByLoginAndPassword(login, password);
			String FIO = sotrydnikOyd.getFamiliya() + " " + sotrydnikOyd.getImya().substring(0, 1) + ". " + sotrydnikOyd.getOtchestvo().substring(0, 1) + ".";
			session = request.getSession();
			session.setMaxInactiveInterval(28800);
			session.setAttribute("FIO", FIO);
			session.setAttribute("sotrydnik", sotrydnik);
			session.setAttribute("id-sotrydnik", sotrydnikOyd.getIdSotrydnikOyd());
			response.sendRedirect("main-oyd.jsp");
			
		} catch (Exception e) {
			out.println("<div class=\"alert alert-danger alert-center\" role=\"alert\">");
			out.println("<strong>Ошибка!</strong> Попробуйте ещё раз.");
			out.println("</div>");
		}
	}
	
	else if(sotrydnik.equals("oiz")) {
		try {
			SotrydnikOiz sotrydnikOiz = sotrydnikOizEJB.findByLoginAndPassword(login, password);
			String FIO = sotrydnikOiz.getFamiliya() + " " + sotrydnikOiz.getImya().substring(0, 1) + ". " + sotrydnikOiz.getOtchestvo().substring(0, 1) + ".";
			session = request.getSession();
			session.setMaxInactiveInterval(28800);
			session.setAttribute("FIO", FIO);
			session.setAttribute("sotrydnik", sotrydnik);
			session.setAttribute("id-sotrydnik", sotrydnikOiz.getIdSotrydnikOiz());
			response.sendRedirect("main-oiz.jsp");
			
		} catch (Exception e) {
			out.println("<div class=\"alert alert-danger alert-center\" role=\"alert\">");
			out.println("<strong>Ошибка!</strong> Попробуйте ещё раз.");
			out.println("</div>");
		}
	}
}
%>
    <!-- 
    <div class="alert alert-success" role="alert">
      <strong>Успешно!</strong> по запросу было найдено хх дел.
    </div>
    <div class="alert alert-danger" role="alert">
      <strong>Oh snap!</strong> Change a few things up and try submitting again.
    </div>
    -->
	  	<form action="" method="post" class="form-login">
	  		<h2>Пожалуйста войдите в систему</h2>
		    <input type="text" name="login" class="form-login-control" placeholder="Логин" required autofocus>
		    <input type="password" name="password" class="form-login-control" placeholder="Пароль" required><br>
		    <label class="btn btn-lg btn-default form-login-control2">
	    		<input type="radio" name="sotrydnik" value="oyd" required> Сотрудник ОУД
			</label>
			<br>			
			<label class="btn btn-lg btn-default form-login-control2">
	    		<input type="radio" name="sotrydnik" value="oiz" required> Сотрудник ОИЗ
			</label>
			<br>		
		    <button class="btn btn-lg btn-primary form-login-control-btn" type="submit">Логин</button>
	  	</form>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>