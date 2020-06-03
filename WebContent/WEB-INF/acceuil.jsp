<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
	  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="height=device-height, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Artisan</title>
		<!-- Google font -->
		<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

		<!-- Bootstrap -->
		<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

    </head>
	<body>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
		<!-- HEADER -->
		<header>
			<!-- TOP HEADER -->
			<div id="top-header">
				<div class="container">
					<ul class="header-links pull-left">
						<li><a href="#"><i class="fa fa-phone"></i> +212 6 67 03 38 96</a></li>
						<li><a href="#"><i class="fa fa-envelope-o"></i> contact@aji-nsafo.com</a></li>
						<li><a href="#"><i class="fa fa-map-marker"></i>  Marjane LOT AL FATH AL MOUBINE  </a></li>
					</ul>
					<c:choose>
					<c:when test="${session == null}">
						<ul class="header-links pull-right">
							<li><i class="fa fa-user-o"></i></li>
						</ul>
					</c:when>
					<c:when test="${session != null}">
						<ul class="header-links pull-right">
							<li><i class="fa fa-user-o"></i><a><% session.getAttribute("prenom"); %></a></li>
						</ul>
					</c:when>
					</c:choose>
				</div>
			</div>
			<!-- /TOP HEADER -->

			<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-3">
							<div class="header-logo" >
								<a href="http://localhost:8080/Ajinsafro/Acceuil" class="logo">
									<img src="./img/logogogo.png" alt="" width="175" height="70">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6">
							<div class="header-search">
								<form method ="post" action="recherche">
									<select class="input-select" name="option" >
										<option value="0">Choix</option>
										<option value="1">EUROPE</option>
										<option value="2">ASIE</option>
										<option value="3">AFRIQUE</option>
										<option value="4">AMERIQUE</option>
										<option value="5">AUSTRALIE</option>
									</select>
									<input class="input" placeholder="Quelle est votre Destinations?" name="recherche" >
									<button class="search-btn">Chercher</button>
									</select>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-3 clearfix">
							<div class="header-ctn">
								<!-- Wishlist -->
								<c:choose>
								<c:when test="${session == null}">
								
								<!-- /Wishlist -->

								<!-- Cart -->
								<div class="dropdown">
									<a href="http://localhost:8080/Ajinsafro/login_client">
										<i class="fa fa-user-o"></i>
										<span>Login</span>
									</a>
									
								</div>
								</c:when>
								<c:when test="${session != null}">
								 
								<!-- /Wishlist -->
									<div class="dropdown">
									<a href="http://localhost:8080/Ajinsafro/panier?id_u=${idUtilisateur}">
										<i class="fa fa-shopping-cart"></i>
										<span>Panier</span>
										<div class="qty">${nbrCmd}</div>
									</a>
									
								</div>

								<!-- Cart -->
								<div class="dropdown">
									<a href="http://localhost:8080/Ajinsafro/deconnection">
										<i class="fa fa-user-o"></i>
										<span>Déconnection</span>
									</a>
									
								</div>
							
								</c:when>
								</c:choose>
								<!-- /Cart -->

								<!-- Menu Toogle -->
								<div class="menu-toggle">
									<a href="#">
										<i class="fa fa-bars"></i>
										<span>Menu</span>
									</a>
								</div>
								<!-- /Menu Toogle -->
							</div>
						</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- /MAIN HEADER -->
		</header>
		<!-- /HEADER -->

		<!-- NAVIGATION -->
		<nav id="navigation">
			<!-- container -->
			<div class="container">
				<!-- responsive-nav -->
				<div id="responsive-nav">
					<!-- NAV -->
					<ul class="main-nav nav navbar-nav">
						<li class="active"><a href="http://localhost:8080/Ajinsafro/Acceuil">Acceuil</a></li>
						<li><a href="http://localhost:8080/Ajinsafro/voyage">Nos Voyages</a></li>
						<li><a href="http://localhost:8080/Ajinsafro/type">Theme</a></li>
						<li><a href="http://localhost:8080/Ajinsafro/contact" alt="">Contactez Nous </a></li>
						
						
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- SECTION -->
		
			<!-- container -->
				 
				<!--  Messages bootstrap de succes et d'erreur -->
			<div class="container">
			<!--  Des alerts bootstrap -->
			<c:if test="${succes != null }">
				<div class="alert alert-success" role="alert">
			  		<c:out value=" ${succes} "></c:out>
				</div>
			</c:if>
			<c:if test="${erreur != null }">
							<div class="alert alert-danger" role="alert">
						  		<c:out value=" ${erreur} "></c:out>
							</div>
			</c:if> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="./img/slid1.jpg" alt="Los Angeles"  style="width:100%;">
      </div>
      <div class="item">
        <img src="./img/slid0.jpg" alt="Fes" style="width:100%;">
      </div>
      <div class="item">
        <img src="./img/sliddd.png" alt="j" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
			<!-- /container -->
			
		<!-- /SECTION -->

		<!-- dSECTION -->
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Nos Meuilleurs Offres</h3>
							<div class="section-nav">
								
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<div class="product">
											<div class="product-img">
												<img src="./img/bal3.jpg" height="180" alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">ASIE</p>
												<h3 class="product-name"><a href="http://localhost:8080/Ajinsafro/voyage?id_c=1">SEJOUR DE LUXE BANGKOK / PHUKET</a></h3>
										 
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=1">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										<div class="product">
											<div class="product-img">
												<img src="./img/turk1.jpg" height="180"   alt="">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">TURQUIE</p>
												<h3 class="product-name"><a href="http://localhost:8080/Ajinsafro/voyage?id_c=2">LALELI 3 AVEC LA TURKISH VERS ISTAMBUL</a></h3>
										 
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=2">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										<div class="product">
											<div class="product-img">
												<img src="./img/turk2.jpg" height="180"   alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">TURQUIE</p>
												<h3 class="product-name"><a href="http://localhost:8080/Ajinsafro/voyage?id_c=3">VOYAGE ISTAMBUL/ CAPPADOCIA (en groupe)</a></h3>
										 
												<div class="product-rating">
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=3">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										<div class="product">
											<div class="product-img">
												<img src="./img/prag.jpg" height="180"   alt="">
											</div>
											<div class="product-body">
												<p class="product-category">EUROPE</p>
												<h3 class="product-name"><a href="http://localhost:8080/Ajinsafro/voyage?id_c=5">PRAGUE PREMIUM 5 AVEC ARTISAN</a></h3>
										 
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=5">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										<div class="product">
											<div class="product-img">
												<img src="./img/uae.jpg" height="180"   alt="">
											</div>
											<div class="product-body">
												<p class="product-category">ASIE</p>
												<h3 class="product-name"><a href="http://localhost:8080/Ajinsafro/voyage?id_c=6">DUBAI PREMIUM 5 VERS EMIRATS</a></h3>
										 
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=6">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
									</div>
									<div id="slick-nav-1" class="products-slick-nav"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> 
		<!-- /SECTION -->

		<!-- HOT DEAL SECTION -->
		<div id="hot-deal" class="section">
		 
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<div class="hot-deal">
						<!--
							<ul class="hot-deal-countdown">
								<li>
									<div>
										<h3>02</h3>
										<span>Days</span>
									</div>
								</li>
								<li>
									<div>
										<h3>10</h3>
										<span>Hours</span>
									</div>
								</li>
								<li>
									<div>
										<h3>34</h3>
										<span>Mins</span>
									</div>
								</li>
								<li>
									<div>
										<h3>60</h3>
										<span>Secs</span>
									</div>
								</li>
							</ul>
							-->
							<h2 class="text-uppercase">Chercher avec votres critères!</h2>
							<p>pour une facilité de recherche</p>
							<a class="primary-btn cta-btn" href="http://localhost:8080/Ajinsafro/recherche2">Recherche Avancée</a>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /HOT DEAL SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">DÉCOUVREZ LA TURQUIE!</h3>
							<div class="section-nav">E 
								
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<div class="product">
											<div class="product-img">
												<img src="./img/turk3.jpg" height="180" " alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">ASIE</p>
												<h3 class="product-name"><a href="#">TAKSIM 4* AVEC LA TURKISH VERS ISTAMBUL</a></h3>
										 
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=04">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										<div class="product">
											<div class="product-img">
												<img src="./img/turk1.jpg" height="180" " alt="">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">ASIE</p>
												<h3 class="product-name"><a href="#">LALELI 3 AVEC LA TURKISH VERS ISTAMBUL</a></h3>
										 
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
													<i class="fa fa-star-o"></i>
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=2">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										<div class="product">
											<div class="product-img">
												<img src=" ./img/turk2.jpg" height="180" " alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">ASIE</p>
												<h3 class="product-name"><a href="#">VOYAGE ISTAMBUL/ CAPPADOCIA (en groupe)</a></h3>
										 
												<div class="product-rating">
												</div>
												
											</div>
											<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/voyage?id_c=3">Plus d'Info
								<!-- 		<button class="add-to-cart-btn"><i class="fa fa-info-circle" ></i>Plus d'Info</button> -->
										</a>
									</div>
										</div>
										
										
									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">APROPOS D'AJINSAFRO </h3>
							<div class="section-nav">
								
							</div>
						</div>
					</div>
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<div id="tab2" class="tab-pane fade in active">
									<h4><font face="Bookman Old Style, Book Antiqua, Garamond"><font size="7" face="Georgia, Arial" color="yellow">A</font>u début, la création de AJINSAFRO n'était qu'un rêve, tous les composants étaient présents pour le réaliser; passion, sérieux, Union, Collaboration, grande experience et Esprit de jeune, une fois rassemblés notre rêve devint réalité.

AJINSAFRO ne s'arrête pas là, et juste sa création ne suffit pas, Nous mobiliserons tous nos ressources pour tenir notre place parmi les meilleurs du marché et  être le leader N°1 du secteur en garantissant le meilleur rapport qualité prix.

Nous vous invitons à venir decouvrir nos services et vous laissé juger par vous même.. 
									</font></h4>
									
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
							</div>
						</div>
						
						
					</div> 
					<!-- /Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
			
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-4 col-xs-6">

						<div class="products-widget-slick" data-nav="#slick-nav-3">
							<div>
							
							</div>
						</div>
					</div>

				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->


		<!-- FOOTER -->
		<footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">A propos</h3>
								<p>Assurez-vous de noter ce Module avec 20</p>
								<ul class="footer-links">
									<li><a href="#"><i class="fa fa-map-marker"></i> Al Fath Al Mobin </a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+212 6 67 03 38 96</a></li>
									<li><a href="#"><i class="fa fa-envelope-o"></i>contact@aji-nsafo.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">NOTRE MARKETPLACE</h3>
								<ul class="footer-links">
								<li><a href="http://localhost:8080/Ajinsafro/Acceuil">Acceuil</a></li>
									<li><a href="http://localhost:8080/Ajinsafro/voyage">Nos voyages</a></li>
									<li><a href="http://localhost:8080/Ajinsafro/categorie">Categories</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Information</h3>
								<ul class="footer-links">
									<li><a href="http://localhost:8080/Ajinsafro/contact">Contactez Nous</a></li>
									<li><a href="Privacy%20Policy.jsp">Privacy Policy</a></li>
									<li><a href="Privacy%20Policy.jsp">Terms & Conditions</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">suivez Nous</h3>
								<ul class="footer-links">
									 
									 
									 
									 
									 
								</ul>
							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
								<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
								<li><a href=""><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> Projet Site d'agence de voyages <i class="fa fa-heart-o"></i> by <a href="https://www.facebook.com/aymanebj"" target="_blank">Aymen Benjbara</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>


						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>

	</body>
</html>
