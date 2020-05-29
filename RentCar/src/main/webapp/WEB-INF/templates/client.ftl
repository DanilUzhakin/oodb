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
	 Клиент
</H2>

	<div>
		(шаблон страницы - client.ftl, контроллер - server.controller.ClientController,
		server.RentController)
	</div>

	<form action='${model["app_path"]}/addclient' method="post">
		<input type="hidden" name="id" value='${model["client"].id!}'/>

		<div>Имя     <input type="text" name="name" value='${model["client"].name!}'/></div>
		<div>Адрес   <input type="text" name="address" value='${model["client"].address!}'/></div>
		<div>Паспорт <input type="text" name="passport" value='${model["client"].passport!}'/></div>

		<input type="submit" value="Сохранить"/>

	</form>

	<h3>Список аренд клиента</h3>

	<table id="renttable">
		<thead>
		<th>Номер</th><th>Машина</th>
		</thead>
		<tbody>
		<#if model["Rents"]??>
		<#list model["Rents"] as rent>
		<tr>
			<td><#if rent.id??>${rent.id}</#if></td>
			<td><#if rent.rentcar??>${rent.rentcar}</#if></td>
			<td>
				<#if rent.id??><button style="color: red",
					onclick="document.location ='${model['app_path']}/client/deleterent/?id=${rent.id}'">X</button>
				</#if>
			</td>
		</tr>
		</#list>
	</#if>
	</tbody>
	</table>

	<#if model["client"].id??>
	<form action='${model["app_path"]}/addrent' method="post">
		<input type="hidden" name="id" value='${model["client"].id!}'/>
		<input type="text" name="car" placeholder="Укажите машину для аренды"/>
		<input type="submit" value="Добавить аренду"/>
	</form>
	</#if>
</div>
</body>
</html>