<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<link rel='stylesheet' href='${model["app_path"]}/css/lab10.css'>
	<script src='${model["app_path"]}/js/lab10.js'></script>

	<title>Приложение аренды автомобилей</title>
</head>
<body>

<div class="menu-bar">
	<ul>
		<li><a class="active" href='${model["app_path"]}/'>Главная</a></li>
		<li><a href='${model["app_path"]}/client/'>Клиенты</a></li>

		<li style="float:right"><a href='${model["app_path"]}/logout'>Выход</a></li>
	</ul>
</div>

<div class="c-wrapper">

<H2>
	 Поиск клиента по имени
</H2>
	<div>
		(шаблон страницы - clientbyname.ftl, контроллер - server.controller.SearchController)
	</div>

	<form action='${model["app_path"]}/clientbyname/' method="post">
		<input name="name"/>
		<input type="submit" value="Найти"/>
	</form>

	<table>
		<thead>
		<th>id</th><th>Имя</th>
		</thead>
		<tbody>
		<#if model["clients"]??>
			<#list model["clients"] as client>
				<tr>
					<td>
						<#if client.id??>${client.id}</#if>
					</td>
					<td><#if client.name??><a href='${model["app_path"]}/addclient?id=${client.id}'>${client.name}</a></#if></td>
				</tr>
			</#list>
		</#if>
		</tbody>
	</table>



</div>
</body>
</html>