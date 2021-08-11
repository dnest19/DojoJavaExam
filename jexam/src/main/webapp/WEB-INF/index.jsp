<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to Ideas</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h1>Welcome To Ideas</h1>
  <div class="row">
    <div class="col">

      <h4>Login</h4>
      <p>${loginError}</p>
      <form method="POST" action="/login">
      <div class="form-group">
      <label>Email:</label>
      <input class="form-control" type="email" name="loginEmail">      
      </div>
      <div class="form-group">
      <label>Password</label>
      <input class="form-control" type="password" name="loginPass">
      </div>
      <button class="btn btn-primary">Login</button>
      </form>
    </div>
    <div class="col">
      <h4>Register</h4>
      			<h2>Register</h2>
			<form:form action="/register" method="post" modelAttribute="user">
			    <div class="form-group">
			        <form:label path="name">Name:</form:label>
			        <form:errors path="name"/>
			        <form:input class="form-control" path="name"/>
			    </div>
			    <div class="form-group">
			        <form:label path="email">Email</form:label>
			        <form:errors path="email"/>
			       <form:input type="email" class="form-control" path="email"/>
			    </div>
			    <div class="form-group">
			        <form:label path="password">Password</form:label>
			        <form:errors path="password"/>
			       <form:input type="password" class="form-control" path="password"/>
			    </div>
			    <div class="form-group">
			        <form:label path="confirmPassword">Confirm Password</form:label>
			        <form:errors path="confirmPassword"/>
			       <form:input type="password" class="form-control" path="confirmPassword"/>
			    </div>
			    <input class="btn btn-success" type="submit" value="Register"/>
			</form:form>
    </div>
  </div>
  </div>
</body>
</html>