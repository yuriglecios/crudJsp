<!DOCTYPE html>
<%@page import="com.crudjspjava.bean.Usuario"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuarios view - teste</title>
<style>
		table {
			width: 100%;
			border-collapse: collapse;
			margin-bottom: 20px;
		}

		th, td {
			padding: 10px;
			text-align: left;
			vertical-align: middle;
			border: 1px solid #ccc;
		}

		a {
			text-decoration: none;
			color: #4CAF50;
			padding: 5px 10px;
			border: 1px solid #4CAF50;
			border-radius: 3px;
			margin: 0 5px;
		}

		a:hover {
			background-color: #4CAF50;
			color: #fff;
		}

		h1 {
			text-align: center;
		}

		form {
			max-width: 500px;
			margin: 0 auto;
		}

		input[type="text"] {
			display: block;
			width: 100%;
			padding: 5px;
			border: 1px solid #ccc;
			border-radius: 3px;
			box-sizing: border-box;
			font-size: 16px;
			margin-bottom: 10px;
		}

		input[type="submit"] {
			background-color: #4CAF50;
			color: #fff;
			border: none;
			padding: 10px 20px;
			font-size: 16px;
			border-radius: 3px;
			cursor: pointer;
		}

		input[type="submit"]:hover {
			background-color: #3e8e41;
		}

</style>
</head>
<body>
	<%@ page
		import="com.crudjspjava.dao.UsuarioDao, com.crudjspjava.*, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<h1>Listagem de Usuários</h1>

	<%
	List<Usuario> list = UsuarioDao.getALLUsuarios();
	request.setAttribute("list", list);
	%>

	<table border="1">
						<tr>
							<th>ID</th>
							<th>Nome</th>
							<th>CPF</th>
							<th>Idade</th>
						</tr>		
		<c:forEach items="${ list }" var="usuario">
						<tr>
							<td>${usuario.getId() }</td>
							<td>${usuario.getNome() }</td>
							<td>${usuario.getCpf() }</td>
							<td>${usuario.getIdade() }</td>
							<td><a href="editform.jsp?id=${usuario.getId() }">Editar</a></td>
							<td><a href="deleteusuario.jsp?id=${usuario.getId() }">Excluir</a></td>
						</tr>
		</c:forEach>							
	</table>
	<br>
	<a href="addusuarioform.jsp">Adicionar novo usuário</a>
</body>
</html>