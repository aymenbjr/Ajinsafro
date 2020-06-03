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
						<!-- /ACCOUNT -->
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
						<li><a href="http://localhost:8080/Ajinsafro/Acceuil">Acceuil</a></li>
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
  
</div>

<div class="section">
			<!-- container -->
			<div class="container">
			<c:choose>
			<c:when test="${nbrCmd == 0}">
			<center><h1>Votre Panier est vide!</h1></center>
			<center><img src="./img/empty.png" alt=""></center>
			</c:when>
			<c:when test="${nbrCmd != 0}">
				<!-- row -->
				<div class="row">
					<!-- ASIDE -->
					
			<center><h1>Finalisez vos Reservations:</h1></center>
            
			
			
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							
							
						</div>

						<!-- store products -->
						   	
						<div class="row">
						
						
						
						<c:forEach items="${ panier }" var="panier">
						
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
									<img src="${ panier.image}"  height="180" alt="">
									</div>
									<div class="product-body">
									<p class="product-category">${ panier.type}</p> 
									<h3 class="product-name">${ panier.destination }</h3>
									<div class="product-btns"> 
									<a href="http://localhost:8080/Ajinsafro/supprimer_panier?id_c=${ panier.id_Voyage }&&id_u=${idUtilisateur}" ><button class="add-to-compare"><i class="fa fa-trash"></i><span class="tooltipp">Supprimer du Panier</span></button></a>
										</div>
									</div>
									<div class="add-to-cart">
									<a  class="add-to-cart-btn" href="http://localhost:8080/Ajinsafro/utilisateur_commande?id_c=${ panier.id_Voyage }&&id_u=${idUtilisateur}">Reserver!</a>
							 	</div>
								</div>
							</div>
							
						</c:forEach>
						
						
						
							 
						</div>
						<!-- /store products -->

						<!-- store bottom filter -->
						<div class="store-filter clearfix">
							<span class="store-qty"></span>
							<ul class="store-pagination">
								<li class="active">1</li>
								<li>2</li>
								<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
							</ul>
						</div>
						<!-- /store bottom filter -->
					</div>
					<!-- /STORE -->
				</div>
				<!-- /row -->
				</c:when>
				</c:choose>
			</div>
			<!-- /container -->
		</div>
<!-- ****************************************************************************************************************** -->	

	

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
									<li><a href="http://localhost:8080/Ajinsafro/type">types</a></li>
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
