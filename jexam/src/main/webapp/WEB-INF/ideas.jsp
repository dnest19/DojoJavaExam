<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ideas</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<div class="container">
<h2>Welcome, ${user.name}</h2>
<a href="/logout">Log Out</a>
<table class="table table-dark">
		<thead>
			<tr>
				<th>Idea</th>
				<th>Created By</th>
			</tr>
		</thead>
			<tbody>
				<c:forEach items="${ideas}" var="idea">
					<tr>
						<td><a href="/ideas/display/${idea.id}">${idea.ideaContent }</a></td>
						<td>${idea.creator.name }</td>	
					</tr>
				</c:forEach>
			</tbody>
	</table>
	<a href="/ideas/new" class="btn btn-primary" role="button">Create an Idea</a>
</div>
</body>
</html>