 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Colo Shop</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Colo Shop Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/styles/bootstrap4/bootstrap.min.css'/>">
<link href="<c:url value='/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/animate.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/styles/admin.css'/>">	
</head>
<body>
<div class="super_container">
	<!-- Header -->
	<header class="header trans_300">

		<!-- Top Navigation -->

		<div class="top_nav">
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<div class="top_nav_left">free shipping on all u.s orders over $50</div>
					</div>
					<div class="col-md-6 text-right">
						<div class="top_nav_right">
							<ul class="top_nav_menu">
								<!-- Currency / Language / My Account -->
								<li class="currency">
									<a href="#">
										usd
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="currency_selection">
										<li><a href="#">cad</a></li>
										<li><a href="#">aud</a></li>
										<li><a href="#">eur</a></li>
										<li><a href="#">gbp</a></li>
									</ul>
								</li>
								<li class="language">
									<a href="#">
										English
										<i class="fa fa-angle-down"></i>
									</a>
									<ul class="language_selection">
										<li><a href="#">French</a></li>
										<li><a href="#">Italian</a></li>
										<li><a href="#">German</a></li>
										<li><a href="#">Spanish</a></li>
									</ul>
								</li>
								<li class="account">
									<c:choose>
										<c:when test="${user != null}">
											<a style="width:90px;margin-left:0px" href="#">${user.getUsername()}</a>
										</c:when>
										<c:otherwise>
											<a href="#">My Account<i class="fa fa-angle-down"></i></a>
										</c:otherwise>
									</c:choose>
									
									<ul class="account_selection">
										<c:choose>
											<c:when test="${user != null}">
												<li><a href="/WebBag/trangchu.htm" onclick="logout()"><i class="fa fa-sign-in" aria-hidden="true" ></i> Sign Out</a></li>
												<c:choose>
													<c:when test="${admin !=null}">
													<li><a href="/WebBag/admin.htm"><i class="fa fa-sign-in" aria-hidden="true" ></i> Admin</a></li>
													</c:when>
												</c:choose>
											</c:when>
											<c:otherwise>
												<li><a href="/WebBag/login.htm"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
											<li><a href="/WebBag/register.htm"><i class="fa fa-user-plus" aria-hidden="true"></i>Register</a></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="/WebBag/trangchu.htm">colo<span>shop</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="/WebBag/trangchu.htm">home</a></li>
								<li><a href="/WebBag/shop.htm">shop</a></li>
								<li><a href="/WebBag/contact.htm">contact</a></li>
							</ul>
							<div class="hamburger_container">
								<i class="fa fa-bars" aria-hidden="true"></i>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
		<div class="bg-light p-5 rounded" >
			<div style="margin-top: 150px;display: flex;justify-content: center;">	
			    <div class="body-from" style="margin-right: 100px;margin-top: 50px">
			      <div id="form1" class="form1" style="display: none" >
     			    <h1 style="font-family: Poppins">Edit Product</h1>
     			    <form:form action="/WebBag/updateProduct.htm"  method="post" enctype="multipart/form-data">
     			    	<input id="idproduct" style="display: none" name="id">
				        	<div>Product Name</div>
				          <input class="form-control me-2" id="name" style="color: black" name="productname">
				          <div class="divform">For</div>
				          <select class="form-control me-2"  style="color: black" id="select" name="gender">
				            <option value="Men">Men</option>
				            <option value="Women">Women</option>
				          </select>
				          <div class="divform ">Description</div>
				          <input class="form-control me-2" id="description" style="color: black" name="description">
				          <div class="divform">Price</div>
				          <input class="form-control me-2 " id="price" style="color: black" name="price">
		                	<div >
				            	<label><b>Ảnh SP :</b></label>
				            	<input type="file" name="img" id="imgvalue"/><br>
				            	<img style="width: 60px;height: 60px ;" alt="" id="img" src="" >
				            </div>
				            <button class="btn btn-success btn-block" style="margin-top: 10px;width: 100px">Edit</button>
     			    </form:form>
			        
			       
			      </div>
			
			      <div id="form2">

			        <form:form  action="/WebBag/NewProduct.htm" method="post" enctype="multipart/form-data">
            		<h1 style="font-family: Poppins">Insert Product</h1>
			          <div>Product ID</div>
			          <input class="form-control me-2" name="id" style="color: black">
			          <div>Product Name</div>
			          <input class="form-control me-2" name="productname" style="color: black">
			          <div>For</div>
			          <select class="form-control me-2" style="color: black" name="gender">
			            <option >Men</option>
			            <option >Women</option>
			          </select>
			          <div>Product Type</div>
			          <select class="form-control me-2" style="color: black" name="producttype">
			        	<c:forEach var="allproductType" items="${allproductType}" >
			        		<option value = "${allproductType.getId()}">${allproductType.getTypename()}</option>
			          	</c:forEach>
			          </select>
			          <div>Description</div>
			          <input class="form-control me-2" name ="description" style="color: black">
			          <div>Price</div>
			          <input class="form-control me-2" name="price" style="color: black">
        			<div style="margin-top: 10px;">
		            	<label>Image Product: </label>
		            	<input type="file" name="img" id="imgvalue2"/><br>
		            	<h3 style="color: red">${message4}</h3>
		            </div>
		             <button class="btn btn-success btn-block" style="margin-top: 10px;width: 100px">Insert</button>
			        </form:form>
			      </div>
   			 </div>
   			<hr>
		<div style="width: 40%;">
			<div class="d-flex flex-row justify-content-between"  style="margin: 10px; ">
				<div>
					<span id="result1"></span>
					<form action ="/WebBag/find.htm" class="d-inline-flex" method="post">
						<input name="searchInput" id="searchInput" class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" style="margin-right: 10px">
						<button name="btnsearch" id="searchProduct"
							class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
			</div>
		<table class="table" >
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Product Name</th>
					<th scope="col">For</th>
					<th scope="col">Description</th>
					<th scope="col">Price</th>
					<th scope="col" style="padding-left: 20px"> Edit</th>
					<th scope="col">Delete</th>
				</tr>
			</thead>
			<tbody id="table_products">
				 <c:forEach var="pd" items="${allproduct}"> 
					<tr id ="detele">
						<td><img width="50" height="50" src="<c:url value="/resources/images/${pd.getImg()}"/>"></td>
						<td>${pd.getProductname()}</td>
						<td>${pd.getGenderbag()}</td>
						<td>${pd.getDescription()}</td>
						<td>${pd.getPrice()}</td>
						<td><button style="border: white; cursor: pointer;" onclick="Editfunction('${pd.getProductid()}','${pd.getProductname()}','${pd.getGenderbag()}','${pd.getDescription()}','${pd.getPrice()}','${pd.getImg()}')"> <img width="50" height="40" src="<c:url value="/resources/images/edit.png"/>"></button>
						</td>
								
						<td><button style="border: white; cursor: pointer;" onclick="Deletefunction(${pd.getProductid()})"><img width="30" height="30" src="<c:url value="/resources/images/delete.png"/>"></button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>	
		</div>

	</div>
		

<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/resources/styles/bootstrap4/popper.js'/>"></script>
<script src="<c:url value='/resources/styles/bootstrap4/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/Isotope/isotope.pkgd.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js'/>"></script>
<script src="<c:url value='/resources/plugins/easing/easing.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>
<script src="<c:url value='/resources/js/admin.js'/>"></script>
</body>

</html>
