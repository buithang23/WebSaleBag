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
	<div class="main" style="height: 400px">  
		<a href="/WebBag/trangchu.htm" style="margin:30px;color: white;display: block;text-decoration:none;">BACK HOME</a>
		<div class="login" style="margin-top:220px">

			<form:form >
				<label for="chk" aria-hidden="true">Forgot</label>
				<p style="margin-left:70px;color:red">${message3}</p>
				<input id="emaillogin" type="email" name="email" placeholder="Email" required="">
					<button id="btnlogin">Restet PassWord</button>
				</div>
			</form:form >
		</div>
	</div>
	<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>

</body>

</html>