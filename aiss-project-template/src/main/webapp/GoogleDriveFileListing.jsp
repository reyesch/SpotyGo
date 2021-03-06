<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Archivos - Google Drive</title>
</head>
<body style="background-color: #FFF; color: #5a5a5a;">

	<div id="onload">
		<div class="loader"></div>
		<h2 style="text-align: center">Cargando tus archivos de Google
			Drive</h2>
	</div>

	<script>
		var on = sessionStorage.getItem("on");
		if (on == 0) {
			window.location = "/googleDriveListing";
		} else {
			document.getElementById("onload").style.display = "none";
		}
		sessionStorage.clear();
		sessionStorage.setItem("on", 1);
	</script>

	<nav id="navbar" style="border-bottom: 2px solid #350c6d;">

		<button type="button" id="return"
			onClick="javascript:window.location.href='index.jsp'" class="button">VOLVER</button>
	</nav>

	<div class="container" style="margin-top: 50px">

		<h3>Seleccione el archivo que desea editar</h3>
		<p style="display: none" class="message">${message}</p>
		<script>
			var a = document.getElementsByClassName("message")[0].innerText;
			if (a !== "") {
				alert(a)
			}
		</script>
		</br>


		<form action="/googleDriveListing" method="post">
			<input id="view" type="hidden" name="view" value="1">
			<button onclick="document.getElementById('view').value ='0'">MOSTRAR
				TODO</button>
			<button type="submit">ARCHIVOS SPOTYGO</button>
		</form>


		<table id="files" class="table table-inverse">
			<tr>
				<th>Nombre</th>
				<th>Tamaño</th>
				<th>Última modificación</th>
				<th>Editar</th>
				<th>Eliminar</th>
			</tr>
			<c:forEach items="${requestScope.files}" var="file">
				<tr>
					<td><c:out value="${file.title}" /></td>
					<td><c:out value="${file.fileSize}" /></td>
					<td><c:out value="${file.modifiedDate}" /></td>
					<td><a href="GoogleDriveFileUpdate?id=${file.id}"><img
							src="./images/edit.png" width="30px" style="height: 30px"></a></td>
					<td><a href="GoogleDriveFileDelete?id=${file.id}"><img
							src="./images/delete.png" width="30px" style="height: 30px"></a></td>
				</tr>
			</c:forEach>
		</table>

		<button onClick="javascript:window.location.href='EditFile.jsp'">Crear
			un nuevo archivo de texto plano</button>

	</div>

	<footer>
		<table>
			<tr>
				<td><a href="/developers.jsp">Desarrolladores</a></td>
				<td><a
					href="api/drive/all?oauth=${sessionScope['GoogleDrive-token']}">GoogleDrive
						- API - Ficheros</a></td>
			</tr>
			<tr>
				<td><a href="api/tmdb/all">TMDB - API</a></td>
				<td><a href="api/youtube/all">Youtube - API</a></td>
			</tr>
		</table>

	</footer>
</body>
</html>