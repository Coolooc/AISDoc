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
<%
String nomerFond = request.getParameter("select-fond");
String title = "Хранилища относящиеся к фонду №";

if(nomerFond!=null && nomerFond!="") {
	Context ctx = new InitialContext();
	TopografiyaEJB topografiyaEJB = (TopografiyaEJB) ctx.lookup ("java:global/AISDoc/TopografiyaEJB");

%>
	<div class="well">
    	<div class="div-statistics-center">
			<h2><% out.println(title + nomerFond); %></h2>
			<script src="https://www.gstatic.com/charts/loader.js"></script>
		    <script>
			   	google.charts.load('current', {'packages':['corechart']});
				google.charts.setOnLoadCallback(drawChart);
				
				function drawChart() {
					var data = new google.visualization.DataTable();
					data.addColumn('string', 'Номер хранилища');
					data.addColumn('number', 'Количество хранилищ относящихся к фонду');
					data.addRows([
					  /* ['Фонд № 50', 33],
					  ['Фонд № 39', 67] */
					  <%
					  for (Object[] obj : topografiyaEJB.getCountNomerHranilisheFromNomerFonda(nomerFond)) {
					      String nomerHranilishe = String.valueOf(obj[0]);
						  String countHranilishe = String.valueOf(obj[1]);
						  out.println("['Хранилище №" + nomerHranilishe + "'," + countHranilishe + "],");
					  }
					  %>
					]);
					
					var piechart_options  = {'title':<% out.println("'" + title + nomerFond + "'"); %>, width:500, height:300};
					var piechart  = new google.visualization.PieChart(document.getElementById('piechart_div'));
					piechart.draw(data, piechart_options);
					
					var barchart_options = {title:<% out.println("'" + title + nomerFond + "'"); %>, width:500, height:500, legend: 'none'};
					var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));        		  
					barchart.draw(data, barchart_options);			
				}
		  	</script>
	  	</div>
    	<div class="row">
    	    <div class="col-md-12"><div id="piechart_div" class="chart-center"></div></div>
	        <div class="col-md-12"><div id="barchart_div" class="chart-center"></div></div>
		</div>
		<a href="statistics.jsp"><button class="btn btn-lg btn-primary form-statistics-btn" type="button">Назад</button></a>
	</div>
<%
}
%>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>