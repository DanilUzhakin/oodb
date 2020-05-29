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
        <li><a href='${model["app_path"]}/addclient/'>Новый клиент</a></li>
        <li><a href='${model["app_path"]}/delobject/'>Удаление объектов</a></li>

        <li style="float:right"><a href='${model["app_path"]}/logout'>Выход</a></li>
    </ul>
</div>

<div class="c-wrapper">

    <H2>
        Завершение аренды
    </H2>

    <div>
        (шаблон страницы - delobject.ftl, контроллер - server.DeleteObjectController)
    </div>

    <h3>
        Удаление клиента
    </h3>
    <form method="post" action='${model["app_path"]}/client/delete'>
        ID клиента<input name="clientid"/>
        <input type="submit" value="Удалить"/>
    </form>

    <h3>
        Завершение аренды
    </h3>
    <form method="post" action='${model["app_path"]}/client/deleterent'>
        ID аренды<input name="rentid"/>
        <input type="submit" value="Завершить"/>
    </form>

    <h3>
        Завершение всех аренд
    </h3>
    <form method="post" action='${model["app_path"]}/client/deleteallrents'>
        ID клиента<input name="clientid"/>
        <input type="submit" value="Завершить"/>
    </form>

</div>
</body>
</html>