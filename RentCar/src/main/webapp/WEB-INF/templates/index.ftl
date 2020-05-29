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
		<li><a href='${model["app_path"]}/clientbyname/'>Поиск клиента</a></li>
		<li><a href='${model["app_path"]}/delobject/'>Удаление объектов</a></li>

		<li style="float:right"><a href='${model["app_path"]}/logout'>Выход</a></li>
	</ul>
</div>

<div class="c-wrapper">

<H2>
	АРЕНДА АВТО
</H2>
	<div>
		<p><strong>Предметная область - аренда автомобилей</strong>
		<p>Основная задача приложения, зарегистрировать пользователя<br>
			и предоставить ему автомобиль в аренду.<br>
		<p>После того, как пользователь вернул автомобиль, закрыть текущую аренду автомобиля<br>
		<p><strong>Сущности:</strong>
		<ul>
			<li>Клиент</li>
			<li>Аренда - (клиент может иметь несколько аренд)</li>
		</ul>
		<p><strong>Классы:</strong>
		<p>Описание клиента<br>
			@Entity <br>
			@Inheritance(strategy = InheritanceType.JOINED)<br>
			public class Person {<br>
			@Id<br>
			@GeneratedValue<br>
			private Long id;<br>
			String name;<br>
			}<br>

			@Entity<br>
			public class Client extends Person{<br>
			private String passport;<br>
			private String address;<br>
			@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true)<br>
			private List rents = new ArrayList<>();<br>
				}<br>

		<p>Описание аренды авто<br>
			@Entity<br>
			public class Rent {<br>
			@Id<br>
			@GeneratedValue<br>
			private Long id;<br>

			@Column(length=20)<br>
			private String rentcar;<br>
			}<br>


		<p><strong>Структура БД:</strong>
			CREATE TABLE public.person (<br>
			id bigint NOT NULL,<br>
			name character varying(255),<br>
			CONSTRAINT person_pkey PRIMARY KEY (id)<br>
			)<br>

			CREATE TABLE public.client(<br>
			address character varying(255),<br>
			passport character varying(255),<br>
			id bigint NOT NULL,<br>
			CONSTRAINT client_pkey PRIMARY KEY (id),<br>
			CONSTRAINT fk_person_id FOREIGN KEY (id)<br>
			REFERENCES person (id)<br>
			ON UPDATE NO ACTION<br>
			ON DELETE NO ACTION<br>
			)<br>

			CREATE TABLE public.rent(<br>
			id bigint NOT NULL,<br>
			rentcar character varying(20),<br>
			CONSTRAINT rent_pkey PRIMARY KEY (id)<br>
			)<br>

			CREATE TABLE client_rent(<br>
			client_id bigint NOT NULL,<br>
			rents_id bigint NOT NULL,<br>
			CONSTRAINT uk_rents_id UNIQUE (rents_id),<br>
			CONSTRAINT fk_rent FOREIGN KEY (rents_id)<br>
			REFERENCES rent (id ) ON UPDATE NO ACTION ON DELETE CASCADE,<br>
			CONSTRAINT fk_client_id FOREIGN KEY (client_id)<br>
			REFERENCES client (id) ON UPDATE NO ACTION ON DELETE NO ACTION,<br>
			)<br>

		<p><strong>Представление:</strong><br>
			@Entity<br>
			public class ClientData {<br>
			@Id<br>
			private Long id;<br>

			private String name;<br>
			}<br>
			<br>
			create view clientdata as<br>
			select c.id, p.name from client c join person p on c.id=p.id;<br>
	</div>

</div>
</body>
</html>