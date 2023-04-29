<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editar usuário</title>
<style>
	form {
		max-width: 500px;
		margin: 0 auto;
	}

	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}

	td {
		padding: 10px;
		text-align: left;
		vertical-align: middle;
		border: 1px solid #ccc;
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
	
	h1 {
		text-align: center;
		margin-top: 50px;
	}

</style>


</head>
<body>
	<%@ page import="com.crudjspjava.bean.Usuario, com.crudjspjava.dao.UsuarioDao"  %>
	<%
		String id = request.getParameter("id");
		Usuario usuario = UsuarioDao.getRegistroById(Integer.parseInt(id));
	%>	
	<h1>Edite o usuário</h1>

	<form action="editusuario.jsp" method="post">
		<input type="hidden" name="id" value="<%=usuario.getId()%>"/>
		<table>
			<tr> 
				<td>Nome:</td>
				<td><input type="text" name="nome" value="<%= usuario.getNome()%>"/></td>
			</tr>
			<tr> 
				<td>Cpf:</td>
				<td><input type="text" name="cpf" value="<%=usuario.getCpf()%>"/></td>
			</tr>	
			<tr> 
				<td>Idade:</td>
				<td><input type="text" name="idade" value="<%=usuario.getIdade()%>"/></td>
			</tr>		
			<tr>
				<td><input type="submit" value="Salvar usuário"></td>
			</tr>			
		</table>
	
	</form>
	

</body>
</html>