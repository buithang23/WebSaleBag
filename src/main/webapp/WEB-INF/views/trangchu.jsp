<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="utf-8"%>
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
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/styles/main_styles.css'/>">	
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


	<!-- Slider -->

	<div class="main_slider">
		<div class="container fill_height">
			<div class="row align-items-center fill_height">
				<div class="col">
					<div class="main_slider_content">
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Banner -->

	<div class="banner">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background:url(<c:url value='./resources/images/banner_1.jpg'/>)">
						<div class="banner_category">
							<a href="categories.html">women's</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(<c:url value='./resources/images/banner_2.jpg'/>)">
						<div class="banner_category">
							<a href="categories.html">accessories's</a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="banner_item align-items-center" style="background-image:url(<c:url value='./resources/images/banner_3.jpg'/>)">
						<div class="banner_category">
							<a href="categories.html">men's</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- New Arrivals -->

	<div class="new_arrivals">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>New Arrivals</h2>
					</div>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col text-center">
					<div class="new_arrivals_sorting">
						<ul class="arrivals_grid_sorting clearfix button-group filters-button-group">
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center active is-checked" data-filter="*">all</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Women">women's</li>
							<li class="grid_sorting_button button d-flex flex-column justify-content-center align-items-center" data-filter=".Men">men's</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product-grid" data-isotope='{ "itemSelector": ".product-item", "layoutMode": "fitRows" }'>
						<!-- Noi load san pham -->
						<c:forEach var="Allproducts" items= "${allproduct}">
							<div class="product-item ${Allproducts.getGenderbag()}">
								<div class="product discount product_filter">
								<a href="/WebBag/product.htm?id=${Allproducts.getProductid()}"/>
									<div class="product_image">
										<img src="<c:url value='./resources/images/${Allproducts.getImg() }'/>" alt="" style="width:100%;height:200px">
									</div>
									<div class="favorite favorite_left"></div>
									<div class="product_info">
										<h6 class="product_name"><a href="single.html">${Allproducts.getProductname()}</a></h6>
										<div class="product_price">${Allproducts.getPrice()} VND</div>
									</div>
								</div>
								<div class="red_button add_to_cart_button" id="cart" onclick="cartfunction('${Allproducts.getProductid()}','${Allproducts.getProductname()}','${Allproducts.getPrice()}','${Allproducts.getImg()}')"><a style="color: White">add to cart</a></div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Deal of the week -->

	<div class="deal_ofthe_week">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6">
					<div class="deal_ofthe_week_img">
						<img src="<c:url value='./resources/images/deal_ofthe_week.png'/>" alt="">
					</div>
				</div>
				<div class="col-lg-6 text-right deal_ofthe_week_col">
					<div class="deal_ofthe_week_content d-flex flex-column align-items-center float-right">
						<div class="section_title">
							<h2>Deal Of The Week</h2>
						</div>
						<ul class="timer">
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="day" class="timer_num">03</div>
								<div class="timer_unit">Day</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="hour" class="timer_num">15</div>
								<div class="timer_unit">Hours</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="minute" class="timer_num">45</div>
								<div class="timer_unit">Mins</div>
							</li>
							<li class="d-inline-flex flex-column justify-content-center align-items-center">
								<div id="second" class="timer_num">23</div>
								<div class="timer_unit">Sec</div>
							</li>
						</ul>
						<div class="red_button deal_ofthe_week_button"><a href="#">shop now</a></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Best Sellers -->

	<div class="best_sellers">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title new_arrivals_title">
						<h2>Best Sellers</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<div class="product_slider_container">
						<div class="owl-carousel owl-theme product_slider">
							<!-- danh sach so san pham ban nhieu nhat -->
							<c:forEach var="bestsale" items="${bestSallers}">
								<div class="owl-item product_slider_item">
								<a href="/WebBag/product.htm?id=${bestsale.getProductid()}"/>
									<div class="product-item ${bestsale.getGenderbag()}">
										<div class="product discount">
											<div class="product_image">
												<img src="<c:url value='./resources/images/${bestsale.getImg()}'/>" alt="" style="width:100%;height:200px">
											</div>
											<div class="favorite favorite_left"></div>
											<div class="product_info">
												<h6 class="product_name"><a href="#">${bestsale.getProductname() }</a></h6>
												<div class="product_price">${bestsale.getPrice()} VND</div>
											</div>
										</div>
									</div>
								</div>							
							</c:forEach>
						<!-- Slider Navigation -->
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

	<!-- Blogs -->

	<div class="blogs">
		<div class="container">
			<div class="row">
				<div class="col text-center">
					<div class="section_title">
						<h2>Latest Blogs</h2>
					</div>
				</div>
			</div>
			<div class="row blogs_container">
				<div class="col-lg-4 blog_item_col">
					<div class="blog_item">
						<div class="blog_background" style="background:url(<c:url value='./resources/images/blog_1.jpg'/>)"></div>
						<div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
							<h4 class="blog_title">Here are the trends I see coming this fall</h4>
							<span class="blog_meta">by admin | dec 01, 2017</span>
							<a class="blog_more" href="#">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 blog_item_col">
					<div class="blog_item">
						<div class="blog_background" style="background-image:url(<c:url value='./resources/images/blog_2.jpg'/>)"></div>
						<div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
							<h4 class="blog_title">Here are the trends I see coming this fall</h4>
							<span class="blog_meta">by admin | dec 01, 2017</span>
							<a class="blog_more" href="#">Read more</a>
						</div>
					</div>
				</div>
				<div class="col-lg-4 blog_item_col">
					<div class="blog_item">
						<div class="blog_background" style="background-image:url(<c:url value='./resources/images/blog_3.jpg'/>)"></div>
						<div class="blog_content d-flex flex-column align-items-center justify-content-center text-center">
							<h4 class="blog_title">Here are the trends I see coming this fall</h4>
							<span class="blog_meta">by admin | dec 01, 2017</span>
							<a class="blog_more" href="#">Read more</a>
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
					<form action="post">
						<div class="newsletter_form d-flex flex-md-row flex-column flex-xs-column align-items-center justify-content-lg-end justify-content-center">
							<input id="newsletter_email" type="email" placeholder="Your email" required="required" data-error="Valid email is required.">
							<button id="newsletter_submit" type="submit" class="newsletter_submit_btn trans_300" value="Submit">subscribe</button>
						</div>
					</form>
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
						<div class="cr">??2018 All Rights Reserverd. Made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="#">Colorlib</a> &amp; distributed by <a href="https://themewagon.com">ThemeWagon</a></div>
					</div>
				</div>
			</div>
		</div>
	</footer>

</div>
<script >
    $("#show").click(function() {
        $("#off").Toggle(1000);
    });
</script>
<script src="<c:url value='/resources/js/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/resources/styles/bootstrap4/popper.js'/>"></script>
<script src="<c:url value='/resources/styles/bootstrap4/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/Isotope/isotope.pkgd.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js'/>"></script>
<script src="<c:url value='/resources/plugins/easing/easing.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>
<script src="<c:url value='/resources/js/cart.js'/>"></script>
<script src="<c:url value='/resources/js/logout.js'/>"></script>

</body>

</html>
