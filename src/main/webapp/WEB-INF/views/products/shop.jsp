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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/styles/categories_styles.css'/>">
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
												<li><a href="/WebBag/trangchu.htm"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign Out</a></li>
													<c:choose>
													<c:when test="${admin!=null}">
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
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								<li class="checkout">
									<a href="/WebBag/cart.htm">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
																			<c:choose>
										<c:when test="${cart != null}">
											<span id="checkout_items" class="checkout_items">${cart.size()}</span>
										</c:when>
										<c:otherwise>
											<span id="checkout_items" class="checkout_items">0</span>
										</c:otherwise>
										</c:choose>
									</a>
								</li>
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

		<!-- Main Navigation -->

		<div class="main_nav_container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-right">
						<div class="logo_container">
							<a href="#">colo<span>shop</span></a>
						</div>
						<nav class="navbar">
							<ul class="navbar_menu">
								<li><a href="/WebBag/trangchu.htm">home</a></li>
								<li><a href="/WebBag/shop.htm">shop</a></li>
								<li><a href="/WebBag/contact.htm">contact</a></li>
							</ul>
							<ul class="navbar_user">
								<li><a href="#"><i class="fa fa-search" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-user" aria-hidden="true"></i></a></li>
								<li class="checkout">
									<a href="#">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
										<span id="checkout_items" class="checkout_items">2</span>
									</a>
								</li>
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

	<div class="fs_menu_overlay"></div>


	<div class="container product_section_container">
		<div class="row">
			<div class="col product_section clearfix">

				<!-- Breadcrumbs -->

				<div class="breadcrumbs d-flex flex-row align-items-center">
					<ul>
						<li><a href="/WebBag/trangchu.htm">Home</a></li>
						<li class="active"><a href="/WebBag/shop.htm"><i class="fa fa-angle-right" aria-hidden="true"></i>Product</a></li>
						<c:choose>
							<c:when test="${type != NULL}">
								<li class="active"><a href="/WebBag/shop.htm"><i class="fa fa-angle-right" aria-hidden="true"></i>${type}</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>

				<!-- Sidebar -->

				<div class="sidebar">
					<div class="sidebar_section">
						<div class="sidebar_title">
							<h5>Product Category</h5>
						</div>
						<ul class="sidebar_categories">
							<li><a href="/WebBag/shop.htm">Shop</a></li>
							<li><a href="/WebBag/shop/Men.htm">Men</a></li>
							<li><a href="/WebBag/shop/Women.htm">Women</a></li>
							<c:forEach var="productType" items="${allproductType}">
								<li><a href="/WebBag/shop/${productType.getId()}.htm">${productType.getTypename()}</a></li>
							</c:forEach>
						</ul>
					</div>

					<!-- Price Range Filtering -->
					<div class="sidebar_section">
						<div class="sidebar_title">
							<h5>Filter by Price</h5>
						</div>
						<p>
							<input type="text" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
						</p>
						<div id="slider-range"></div>
						<div class="filter_button"><span>filter</span></div>
					</div>

					<!-- Sizes -->
					<div class="sidebar_section">
						<div class="sidebar_title">
							<h5>Sizes</h5>
						</div>
						<ul class="checkboxes">
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>S</span></li>
							<li class="active"><i class="fa fa-square" aria-hidden="true"></i><span>M</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>L</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>XL</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>XXL</span></li>
						</ul>
					</div>

					<!-- Color -->
					<div class="sidebar_section">
						<div class="sidebar_title">
							<h5>Color</h5>
						</div>
						<ul class="checkboxes">
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Black</span></li>
							<li class="active"><i class="fa fa-square" aria-hidden="true"></i><span>Pink</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>White</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Blue</span></li>
							<li><i class="fa fa-square-o" aria-hidden="true"></i><span>Orange</span></li>
						</ul>
						<div class="show_more">
							<span><span>+</span>Show More</span>
						</div>
					</div>

				</div>

				<!-- Main Content -->

				<div class="main_content">

					<!-- Products -->

					<div class="products_iso">
						<div class="row">
							<div class="col">

								<!-- Product Sorting -->
								<div class="product_sorting_container product_sorting_container_top">

									<ul class="product_sorting">
										<li>
											<span class="type_sorting_text">Default Sorting</span>
											<i class="fa fa-angle-down"></i>
											<ul class="sorting_type">
												<li class="type_sorting_btn" data-isotope-option='{ "sortBy": "original-order" }'><span>Default Sorting</span></li>
												<li class="type_sorting_btn" data-isotope-option='{ "sortBy": "price" }'><span>Price</span></li>
												<li class="type_sorting_btn" data-isotope-option='{ "sortBy": "name" }'><span>Product Name</span></li>
											</ul>
										</li>
									</ul>
									<div class="pages d-flex flex-row align-items-center">
									
										<c:choose>
											<c:when test="${page != 1}">
												<div id="next_page" class="page_next"><a href="/WebBag/shop/page-${page-1}.htm"><i class="fa fa-long-arrow-left" aria-hidden="true" style="margin-right:20px"></i></a></div>
											</c:when>
										</c:choose>
										<div class="page_current">
											<span>${page}</span>
										</div>
										<div class="page_total"><span>of</span> ${tottalPage}</div>
										<c:choose>
											<c:when test="${tottalPage != 1}">
												<c:choose>
													<c:when test="${type != NULL}">
														<div id="next_page" class="page_next"><a href="/WebBag/shop/${type}/page-${page+1}.htm"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
													</c:when>
													<c:otherwise>
														<div id="next_page" class="page_next"><a href="/WebBag/shop/page-${page+1}.htm"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></div>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										
									</div>

								</div>

								<!-- Product Grid -->

								<div class="product-grid">

									<!-- Product 1 -->
										<c:forEach var="Allproducts" items= "${allproduct}" varStatus="loop">
											<div class="product-item men">
											<a href="/WebBag/product.htm?id=${Allproducts.getProductid()}"/>
												<div class="product discount product_filter">
													<div class="product_image">
														<img src="<c:url value='/resources/images/${Allproducts.getImg()}'/>" alt="" style="width:100%;height:200px">
													</div>
													<div class="favorite favorite_left"></div>
													<div class="product_info">
														<h6 class="product_name"><a href="/WebBag/product.htm?id=${Allproducts.getProductid()}">${Allproducts.getProductname()}</a></h6>
														<div class="product_price">${Allproducts.getPrice()} VND</div>
													</div>
												</div>
													<div class="red_button add_to_cart_button" id="cart" onclick="cartfunction('${Allproducts.getProductid()}','${Allproducts.getProductname()}','${Allproducts.getPrice()}','${Allproducts.getImg()}')"  ><a style="color: White" >add to cart</a></div>
											</div>
										</c:forEach>

								<!-- Product Sorting -->

								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Benefit -->

	<div class="benefit">
		<div class="container">
			<div class="row benefit_row">
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-truck" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>free shipping</h6>
							<p>Suffered Alteration in Some Form</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-money" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>cach on delivery</h6>
							<p>The Internet Tend To Repeat</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-undo" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>45 days return</h6>
							<p>Making it Look Like Readable</p>
						</div>
					</div>
				</div>
				<div class="col-lg-3 benefit_col">
					<div class="benefit_item d-flex flex-row align-items-center">
						<div class="benefit_icon"><i class="fa fa-clock-o" aria-hidden="true"></i></div>
						<div class="benefit_content">
							<h6>opening all week</h6>
							<p>8AM - 09PM</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Newsletter -->

	<div class="newsletter">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="newsletter_text d-flex flex-column justify-content-center align-items-lg-start align-items-md-center text-center">
						<h4>Newsletter</h4>
						<p>Subscribe to our newsletter and get 20% off your first purchase</p>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
						<input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
						<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->

	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="footer_nav_container d-flex flex-sm-row flex-column align-items-center justify-content-lg-start justify-content-center text-center">
						<ul class="footer_nav">
							<li><a href="#">Blog</a></li>
							<li><a href="#">FAQs</a></li>
							<li><a href="contact.html">Contact us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="footer_social d-flex flex-row align-items-center justify-content-lg-end justify-content-center">
						<ul>
							<li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-skype" aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer_nav_container">
						<div class="cr">©2018 All Rights Reserverd. Template by <a href="#">Colorlib</a> &amp; distributed by <a href="https://themewagon.com">ThemeWagon</a></div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</div>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/resources/styles/bootstrap4/popper.js'/>"></script>
<script src="<c:url value='/resources/styles/bootstrap4/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/Isotope/isotope.pkgd.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js'/>"></script>
<script src="<c:url value='/resources/plugins/easing/easing.js'/>"></script>
<script src="<c:url value='/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js'/>"></script>
<script src="<c:url value='/resources/js/categories_custom.js'/>"></script>
<script src="<c:url value='/resources/js/cart.js'/>"></script>
</body>

</html>
