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
<h3>Edit ${idea.ideaContent}</h3><br>

<form:form action="/ideas/update/${idea.id }" method="POST" modelAttribute="idea">
	<form:input type="hidden" value="${user.id}" path="creator"/>
	<div class="form-group">
	<form:label path="ideaContent">Content: </form:label>
	<form:errors path="ideaContent"/>
	<form:input path="ideaContent"/>
	</div>
	
	<button class="btn btn-primary">Edit</button>

</form:form>
	<a href="/ideas/delete/${idea.id }" class="btn btn-danger" role="button">Delete</a>



</body>
</html>