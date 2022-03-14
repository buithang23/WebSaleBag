<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<title>ColoShop</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='./resources/styles/style.css'/>">

</head>
<body>
	<div class="main">  	
		<a href="/WebBag/trangchu.htm" style="margin:30px;color: white;display: block;text-decoration:none;">BACK HOME</a>
		<div class="login" style="margin-top:220px">
			<form:form action="">
				<label for="chk" aria-hidden="true" style="font-size: 50px">Sign up</label>
				<p style="margin-left:70px;color:red">${message2}</p>
				<input id ="username" type="text" name="username" placeholder="User name" required="">
				<input id="email" type="email" name="email" placeholder="Email" required="">
				<input id="pswdl" type="password" name="pswd" placeholder="Password" required="">
				<button id="btnSignup"> Sign up</button>
			</form:form>
		</div>
	</div>
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

</body>

</html>