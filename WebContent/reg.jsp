<!DOCTYPE html>
<html lang="ru">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>АИС Док | Регистрация новых пользователей</title>
</head>
<body>
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
					<li><a href="index.html">Главная</a></li>
					<li class="active"><a href="search.html">Поиск</a></li>
					<li><a href="#">Страница 2</a></li>
					<li><a href="#">Страница 3</a></li>
					<li><a href="#">Страница 4</a></li>			
	            </ul>
	            <ul class="nav navbar-nav navbar-right">
	              <li class="active"><a href="#">Налётов Г.В.</a></li>
	              <li><a href="login.html">Выход</a></li>
	            </ul>
          	</div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
	</nav>
	<div class="well">
		<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat est libero vel eveniet harum nisi, incidunt hic omnis numquam. Accusamus harum velit autem dignissimos cumque dolorum assumenda iste, excepturi eaque.</p>
		<form action="reg-result.html" method="get" class="form-reg">
  			<h2>Регистрация новых пользователей</h2>
		    <input type="text" name="last-name" class="form-reg-control" placeholder="Фамилия" required autofocus>
		    <input type="text" name="first-name" class="form-reg-control" placeholder="Имя" required>
		    <input type="text" name="v-name" class="form-reg-control" placeholder="Отчество" required><br>
		    <input type="text" name="login" class="form-reg-control" placeholder="Логин" required>
		    <input type="text" name="password" class="form-reg-control" placeholder="Пароль" required>
		    <button class="btn btn-lg btn-primary" type="submit">Добавить</button>
  		</form>
	</div>
</div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>