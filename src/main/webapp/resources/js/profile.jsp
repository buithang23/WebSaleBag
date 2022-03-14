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
  <title>Workout &mdash; Website Template by Colorlib</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css?family=Muli:300,400,700,900" rel="stylesheet">
  <link rel="stylesheet" href="<c:url value='/resources/icomoon/style.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/jquery-ui.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/owl.carousel.min.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/owl.theme.default.min.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/jquery.fancybox.min.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap-datepicker.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/fonts/flaticon/font/flaticon.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/css/aos.css'/>">
  <link href="<c:url value='/resources/css/jquery.mb.YTPlayer.min.css'/>" media="all" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/table.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/css/class.css'/>">
</head>

<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

  <div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>


    <header class="site-navbar py-4 js-sticky-header site-navbar-target" role="banner">

      <div class="container-fluid">
        <div class="d-flex align-items-center">
          <div class="site-logo"><a href="/GymWeb/HomePage.htm">Workout<span>.</span> </a></div>
          <div class="ml-auto">
            <nav class="site-navigation position-relative text-right" role="navigation">
              <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                <li><a href="/GymWeb/HomePage.htm" class="nav-link">Home</a></li>
				<li class="account" >
					<c:choose>
						<c:when test="${user != null}">
							<a style="width:90px;margin-left:0px" href="#">${user.getUsername()}</a>
						</c:when>
						<c:otherwise>
							<li><a href="/GymWeb/login.htm" style="text-decoration: none" class="nav-link">Login</a></li>
						</c:otherwise>
					</c:choose>
					
					<ul class="account_selection" style="list-style: none">
						<c:choose>
							<c:when test="${user != null}">
								<li><a href="/GymWeb/logout.htm"><i class="fa fa-sign-in" aria-hidden="true" ></i>Account</a></li>
								<li><a href="/GymWeb/HomePage.htm" onclick="logout()"><i class="fa fa-sign-in" aria-hidden="true" ></i>Sign Out</a></li>
								<c:choose>
									<c:when test="${admin !=null}">
									<li><a href="/GymWeb/admin.htm"><i class="fa fa-sign-in" aria-hidden="true" ></i> Admin</a></li>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
					</ul>
				</li>
              </ul>
            </nav>
            <a href="#" class="d-inline-block d-lg-none site-menu-toggle js-menu-toggle float-right"><span class="icon-menu h3"></span></a>
          </div>

        </div>
      </div>

    </header>

    <div class="bgimg" style="hight:50px;background-image: url(<c:url value='/resources/images/bg_2.jpg'/>);" data-stellar-background-ratio="0.5"></div>
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	<div class="container" style="margin-top:50px;">
	<div class="row flex-lg-nowrap">
	  <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
	    <div class="card p-3">
	      <div class="e-navlist e-navlist--active-bg">
	        <ul class="nav">
	          <li class="nav-item"><a class="nav-link px-2 active" href="#"><i class="fa fa-fw fa-bar-chart mr-1"></i><span>My Account</span></a></li>
	          <li class="nav-item"><a class="nav-link px-2" href="https://www.bootdey.com/snippets/view/bs4-crud-users" target="__blank"><i class="fa fa-fw fa-th mr-1"></i><span>Change Password</span></a></li>
	          <li class="nav-item"><a class="nav-link px-2" href="https://www.bootdey.com/snippets/view/bs4-edit-profile-page" target="__blank"><i class="fa fa-fw fa-cog mr-1"></i><span>TimTable</span></a></li>
	        </ul>
	      </div>
	    </div>
	  </div>
	  <div class="col">
	    <div class="row">
	      <div class="col mb-3">
	        <div class="card">
	          <div class="card-body">
	            <div class="e-profile">
	              <div class="row">
	                <div class="col-12 col-sm-auto mb-3">
	                  <div class="mx-auto" style="width: 140px;">
	                    <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
	                      <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
	                    </div>
	                  </div>
	                </div>
	                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
	                  <div class="text-center text-sm-left mb-2 mb-sm-0">
	                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">John Smith</h4>
	                    <p class="mb-0">@johnny.s</p>
	                    <div class="text-muted"><small>Last seen 2 hours ago</small></div>
	                    <div class="mt-2">
	                      <button class="btn btn-primary" type="button">
	                        <i class="fa fa-fw fa-camera"></i>
	                        <span>Change Photo</span>
	                      </button>
	                    </div>
	                  </div>
	                  <div class="text-center text-sm-right">
	                    <span class="badge badge-secondary">administrator</span>
	                    <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
	                  </div>
	                </div>
	              </div>
	              <ul class="nav nav-tabs">
	                <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
	              </ul>
	              <div class="tab-content pt-3">
	                <div class="tab-pane active">
	                  <form:form class="form" novalidate="">
	                    <div class="row">
	                      <div class="col">
	                        <div class="row">
	                          <div class="col">
	                            <div class="form-group">
	                              <label>Full Name</label>
	                              <input class="form-control" type="text" name="name" placeholder="John Smith" value="John Smith">
	                            </div>
	                          </div>
	                          <div class="col">
	                            <div class="form-group">
	                              <label>Username</label>
	                              <input class="form-control" type="text" name="username" placeholder="johnny.s" value="johnny.s">
	                            </div>
	                          </div>
	                        </div>
	                        <div class="row">
	                          <div class="col">
	                            <div class="form-group">
	                              <label>Email</label>
	                              <input class="form-control" type="text" placeholder="user@example.com">
	                            </div>
	                          </div>
	                        </div>
	                        <div class="row">
	                          <div class="col mb-3">
	                            <div class="form-group">
	                              <label>About</label>
	                              <textarea class="form-control" rows="5" placeholder="My Bio"></textarea>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                    <div class="row">

	                      </div>
	                    <div class="row">
	                      <div class="col d-flex justify-content-end">
	                        <button class="btn btn-primary" type="submit">Save Changes</button>
	                      </div>
	                    </div>
	                  </form:form>
					<form:form>
		                      <div class="col-12 col-sm-6 mb-3">
	                        <div class="mb-2"><b>Change Password</b></div>
	                        <div class="row">
	                          <div class="col">
	                            <div class="form-group">
	                              <label>Current Password</label>
	                              <input class="form-control" type="password" placeholder="••••••">
	                            </div>
	                          </div>
	                        </div>
	                        <div class="row">
	                          <div class="col">
	                            <div class="form-group">
	                              <label>New Password</label>
	                              <input class="form-control" type="password" placeholder="••••••">
	                            </div>
	                          </div>
	                        </div>
	                        <div class="row">
	                          <div class="col">
	                            <div class="form-group">
	                              <label>Confirm <span class="d-none d-xl-inline">Password</span></label>
	                              <input class="form-control" type="password" placeholder="••••••"></div>
	                          </div>
	                        </div>
					</form:form>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	
	  </div>
	</div>
	</div>

    
    <footer class="footer-section bg-dark">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <h3 class="text-white">About Workout</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam facere optio eligendi.</p>
          </div>

          <div class="col-md-3 ml-auto">
            <h3 class="text-white">Links</h3>
            <ul class="list-unstyled footer-links">
              <li><a href="#">Home</a></li>
              <li><a href="#">Classes</a></li>
              <li><a href="#">Schedule</a></li>
              <li><a href="#">Trainer</a></li>
            </ul>
          </div>

          <div class="col-md-4">
            <h3 class="text-white">Subscribe</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus, odio beatae accusantium.
            </p>
            <form action="#">
              <div class="d-flex mb-5">
                <input type="text" class="form-control rounded-0" placeholder="Email">
                <input type="submit" class="btn btn-primary rounded-0" value="Subscribe">
              </div>
            </form>
          </div>

        </div>

        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <div class=" pt-5">
              <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
            <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with
            <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com"
              target="_blank">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          </p>
            </div>
          </div>

        </div>
      </div>
    </footer>



  </div>
  <!-- .site-wrap -->

  <script src="<c:url value='/resources/js/jquery-3.3.1.min.js'/>"></script>
  <script src="<c:url value='/resources/js/jquery-migrate-3.0.1.min.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery-ui.js'/>"></script>
  <script src="<c:url value='./resources/js/popper.min.js'/>"></script>
  <script src="<c:url value='./resources/js/bootstrap.min.js'/>"></script>
  <script src="<c:url value='./resources/js/owl.carousel.min.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery.stellar.min.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery.countdown.min.js'/>"></script>
  <script src="<c:url value='./resources/js/bootstrap-datepicker.min.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery.easing.1.3.js'/>"></script>
  <script src="<c:url value='./resources/js/aos.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery.fancybox.min.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery.sticky.js'/>"></script>
  <script src="<c:url value='./resources/js/jquery.mb.YTPlayer.min.js'/>"></script>
  <script src="<c:url value='./resources/js/main.js'/>"></script>

</body>

</html>