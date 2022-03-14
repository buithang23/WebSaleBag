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
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/resources/styles/main.css'/>">	
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Colo Shop</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />

    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
    />

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  </head>
  <body>
    <header class="header trans_300">
      <!-- Top Navigation -->
      <div class="top_nav">
        <div class="container">
          <div class="row">
            <div class="col-md-6">
              <div class="top_nav_left">
                free shipping on all u.s orders over $50
              </div>
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
                        <a style="width: 90px; margin-left: 0px" href="#"
                          >${user.getUsername()}</a
                        >
                      </c:when>
                      <c:otherwise>
                        <a href="#"
                          >My Account<i class="fa fa-angle-down"></i
                        ></a>
                      </c:otherwise>
                    </c:choose>

                    <ul class="account_selection">
                      <c:choose>
                        <c:when test="${user != null}">
                          <li><a href="/WebBag/trangchu.htm"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign Out</a></li>
                       		<c:choose>
								<c:when test="${admin!=null }">
									<li><a href="/WebBag/admin.htm" ><i class="fa fa-sign-in" aria-hidden="true" ></i> Admin</a></li>
								</c:when>
							</c:choose>
                        </c:when>
                        <c:otherwise>
                          <li>
                            <a href="/WebBag/login.htm"><i class="fa fa-sign-in" aria-hidden="true"></i
                              >Sign In</a
                            >
                          </li>
                          <li>
                            <a href="/WebBag/register.htm"
                              ><i class="fa fa-user-plus" aria-hidden="true"></i
                              >Register</a
                            >
                          </li>
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
                  <li>
                    <a href="#"
                      ><i class="fa fa-search" aria-hidden="true"></i
                    ></a>
                  </li>
                  <li>
                    <a href="#"
                      ><i class="fa fa-user" aria-hidden="true"></i
                    ></a>
                  </li>
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
    <div class="main-cart">
        <div class="content-index" style="margin-top: 200px; ">
            <div class="container" style="float: right;"> 
           <table id="cart" class="table table-hover table-condensed"> 
            <thead> 
             <tr> 
              <th style="width:50%">Tên sản phẩm</th> 
              <th style="width:10%">Giá</th> 
              <th style="width:8%">Số lượng</th> 
              <th style="width:22%" class="text-center">Thành tiền</th> 
              <th style="width:10%"> </th> 
             </tr> 
            </thead> 
            <tbody id = "allsp">
            <c:forEach var="cart" items="${cart}" varStatus="loop">
            	<tr id="xoagiohang"> 
		           <td data-th="Product"> 
	              <div class="row"> 
	               <div class="col-sm-2 hidden-xs"><img src="<c:url value='/resources/images/${cart.getProductimg()}'/>" alt="Sản phẩm 1" class="img-responsive" width="100">
	               </div> 
	               <div class="col-sm-10"> 
	                <h4 class="nomargin">${cart.getProductname()}</h4> 
	               </div> 
	              </div> 
	             </td> 
	             <td data-th="Price">${cart.getSaleprice()}</td> 
	             <td data-th="Quantity"><input class="form-control text-center" value="1" type="number">
	             </td> 
	             <td data-th="Subtotal" class="text-center price " id="total${loop.index}">${cart.getSaleprice()} </td> 
	             <td class="actions" data-th="">
	              </button> 
	              <button class="btn btn-danger btn-sm xoagiohang" onclick="Deletefunction(${cart.getProductid()})"><i class="fa fa-trash-o"></i>
	              </button>
	             </td> 
	            </tr> 

            </c:forEach>
             </tr> 
             </tbody>
            </tfoot> 
            <td><a href="/WebBag/shop.htm" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
              </td> 
              <td colspan="2" class="hidden-xs"> </td> 
              <td class="hidden-xs text-center" id="totalprice" style="font-size: 20px"></td> 
 				<c:choose>
					<c:when test="${user != null}">
              			<td><a href="/WebBag/shop.htm" class="btn btn-success btn-block" onclick="thanhtoan()">Thanh toán <i class="fa fa-angle-right"></i></a>
					</c:when>
					<c:otherwise>
              			<td><a href="" class="btn btn-success btn-block" onclick ="login()" >Thanh toán <i class="fa fa-angle-right"></i></a>
					</c:otherwise>
				</c:choose>
              </td> 
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
	<script src="<c:url value='/resources/plugins/jquery-ui-1.12.1.custom/jquery-ui.js'/>"></script>
	<script src="<c:url value='/resources/js/categories_custom.js'/>"></script>
	<script src="<c:url value='/resources/js/xoagiohang.js'/>"></script>
  </body>
</html>
