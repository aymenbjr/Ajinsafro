
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
										<option value="1">TURQUIE</option>
										<option value="2">EUROPE</option>
										<option value="3">ASIE</option>
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
						<li class="active"><a href="http://localhost:8080/Ajinsafro/type">Type</a></li>
						<li><a href="http://localhost:8080/Ajinsafro/contact" alt="">Contactez Nous </a></li>
						
						
					</ul>
					<!-- /NAV -->
				</div>
				<!-- /responsive-nav -->
			</div>
			<!-- /container -->
		</nav>
		<!-- /NAVIGATION -->

		<!-- BREADCRUMB -->
				
				<p>
				
				
				<h1>Politique de Confidentialité</h1>


<p>Date de prise d'effet: May 18, 2019</p>


<p>Artisan ("nous", "notre", "nos") exploite le site web Artisan.ma (ci-après désigné par le terme "Service").</p>

<p>Cette page vous explique nos politiques en matière de collecte, d'utilisation et de communication des données à caractère personnel lorsque vous utilisez notre Service ainsi que les choix qui s'offrent à vous en ce qui concerne ces données. Our Privacy Policy  for Artisan is created with the help of the <a href="https://www.freeprivacypolicy.com/free-privacy-policy-generator.php">Free Privacy Policy Generator</a>.</p>

<p>Nous utilisons vos données pour fournir et améliorer le Service. En utilisant le Service, vous consentez à la collecte et à l'utilisation d'informations conformément à la présente politique. Sauf définition contraire dans la présente Politique de Confidentialité, les termes utilisés dans la présente Politique de Confidentialité ont la même signification que dans nos Conditions Générales qui sont disponibles sur Artisan.ma</p>

<h2>Définitions</h2>
<ul>
    <li>
        <p><strong>Service</strong></p>
                <p>Par Service on entend le site web Artisan.ma exploité par Artisan</p>
            </li>
    <li>
        <p><strong>Données à caractère personnel</strong></p>
        <p>Données à Caractère Personnel désigne des données concernant un individu vivant qui peut être identifié à partir de ces données (ou à partir de ces données et d'autres informations en notre possession ou susceptibles d'entrer en notre possession).</p>
    </li>
    <li>
        <p><strong>Données d'Utilisation</strong></p>
        <p>Les Données d'Utilisation sont recueillies automatiquement et sont générées soit par l'utilisation du Service, soit par l'infrastructure du Service proprement dite (par exemple, durée de consultation d'une page).</p>
    </li>
    <li>
        <p><strong>Cookies</strong></p>
        <p>Les cookies sont de petits fichiers enregistrés sur votre dispositif (ordinateur ou dispositif mobile).</p>
    </li>
</ul>

<h2>Collecte et utilisation des données</h2>
<p>Nous recueillons plusieurs types de données à différentes fins en vue de vous fournir notre Service et de l'améliorer.</p>

<h3>Types de données recueillies</h3>

<h4>Données à Caractère Personnel</h4>
<p>Lorsque vous utilisez notre Service, il est possible que nous vous demandions de nous fournir certaines données personnelles nominatives qui peuvent servir à vous Contactez ou à vous identifier ("Données à Caractère Personnel"). Les données personnelles nominatives peuvent comprendre, mais de manière non limitative:</p>

<ul>
                    <li>Cookies et Données d'Utilisation</li>
</ul>

<h4>Données d'Utilisation</h4>

<p>Nous pouvons également recueillir des informations relatives au mode d'accès et d'utilisation du Service ("Données d'Utilisation"). Ces Données d'Utilisation peuvent comprendre des informations telles que l'adresse de protocole Internet (c.-à-d. l'adresse IP) de votre ordinateur, le type de navigateur, la version du navigateur, les pages de notre Service que vous consultez, la date et l'heure de votre visite, le temps passé sur ces pages, les identifiants uniques de dispositifs ainsi que d'autres données de diagnostic.</p>

<h4>Suivi et données de cookies</h4>
<p>Nous avons recours à des cookies et à d'autres technologies de suivi similaires pour effectuer un suivi des activités effectuées dans notre Service, et nous conservons certaines informations.</p>
<p>Les cookies sont des fichiers à faible volume de données pouvant comporter un identifiant unique anonyme. Les cookies sont envoyés à votre navigateur depuis un site web et sont stockés sur votre dispositif. D'autres technologies de suivi telles que les pixels, les balises et les scripts sont également utilisées pour recueillir et suivre des informations et afin d'améliorer et d'analyser notre Service.</p>
<p>Vous pouvez demander à votre navigateur de refuser tous les cookies ou de vous avertir lorsqu'un cookie est envoyé. Toutefois, si vous n'acceptez pas les cookies, il se peut que vous ne puissiez pas utiliser certains éléments de notre Service.</p>
<p>Exemples de cookies que nous utilisons :</p>
<ul>
    <li><strong>Cookies de Session.</strong> Nous utilisons des Cookies de Session pour faire fonctionner notre Service.</li>
    <li><strong>Cookies de Préférences.</strong> Nous utilisons des Cookies de Préférences pour mémoriser vos préférences et vos différents paramètres.</li>
    <li><strong>Cookies de Sécurité.</strong> Nous utilisons des Cookies de Sécurité pour des raisons de sécurité.</li>
</ul>

<h2>Utilisation des données</h2> 

<p>Artisan utilise les données recueillies à des fins diverses:</p>    
<ul>
    <li>Pour fournir et assurer notre Service</li>
    <li>Pour vous faire part des changements apportés à notre Service</li>
    <li>Pour vous permettre d'utiliser les fonctions interactives de notre Service quand vous le souhaitez</li>
    <li>Pour assurer l'assistance client</li>
    <li>Pour recueillir des données précieuses ou d'analyses qui nous permettront d'améliorer notre Service</li>
    <li>Pour contrôler l'utilisation de notre Service</li>
    <li>Pour détecter, prévenir et régler les problèmes techniques</li>
</ul>

<h2>Transfert des données</h2>
<p>Les informations vous concernant, notamment vos Données à Caractère Personnel, peuvent être transférées de votre région, province, pays, ou autre division territoriale vers des ordinateurs   et stockées sur ces derniers   situés à un endroit où la législation relative à la protection des données diffère de celle du territoire où vous résidez.</p>
<p>Si vous résidez hors de/du Morocco et que vous choisissez de nous communiquer des informations, sachez que nous transférons les données, y compris les Données à Caractère Personnel, vers le/la Morocco et que nous les y traitons.</p>
<p>En acceptant la présente Politique de Confidentialité puis en soumettant ces informations, vous consentez à ce transfert.</p>
<p>Artisan prendra toutes les mesures raisonnablement nécessaires pour faire en sorte que vos données soient traitées de manière sécurisée et conformément à la présente Politique de Confidentialité et vos Données à Caractère Personnel ne seront transférées vers aucune organisation ni aucun pays à moins que des contrôles adéquats ne soient en place, notamment en ce qui concerne la sécurité de vos données et d'autres données personnelles.</p>

<h2>Communication de données</h2>

<h3>Exigences légales</h3>
<p>Artisan peut communiquer vos Données à Caractère Personnel si elle estime de bonne foi que cela est nécessaire pour:</p>
<ul>
    <li>S'acquitter d'une obligation légale</li>
    <li>Protéger et défendre les droits ou les biens de Artisan</li>
    <li>Prévenir d'éventuels actes répréhensibles ou enquêter sur de tels actes dans le cadre du Service </li>
    <li>Assurer la sécurité personnelle des utilisateurs du Service ou du public</li>
    <li>Se protéger contre la responsabilité civile</li>
</ul>

<h2>Sécurité des données</h2>
<p>La sécurité de vos données nous tient à c ur. Toutefois, n'oubliez pas qu'aucune méthode de transmission de données par Internet ou méthode de stockage électronique n'est sûre à 100 %. Bien que nous nous efforcions d'utiliser des méthodes commercialement acceptables pour protéger vos Données à Caractère Personnel, nous ne pouvons pas leur garantir une sécurité absolue.</p>

<h2>Prestataires de services</h2>
<p>Nous pouvons faire appel à des sociétés tierces et à des tierces personnes pour faciliter la prestation de notre Service ("Prestataires de Services"), assurer le Service en notre nom, assurer des services liés au Service ou nous aider à analyser la façon dont notre Service est utilisé.</p>
<p>Ces tiers n'ont accès à vos Données à Caractère Personnel que pour effectuer ces tâches en notre nom et il leur est interdit de les communiquer ou de les utiliser à quelle qu'autre fin. </p>



<h2>Liens pointant vers d'autres sites</h2>
<p>Il se peut que notre Service contienne des liens pointant vers d'autres sites que nous n'exploitons pas. Si vous cliquez sur un lien de tiers, vous serez redirigé vers le site de ce tiers. Nous vous recommandons vivement d'examiner la politique de confidentialité de chacun des sites que vous consultez.</p>
<p>Nous n'avons aucun contrôle sur le contenu, les politiques ou pratiques de confidentialité des sites ou services de tiers et déclinons toute responsabilité en ce qui les concerne.</p>


<h2>Vie privée des enfants</h2>
<p>Notre Service ne s'adresse pas aux personnes de moins de 18 ans ("Enfants").</p>
<p>Nous ne recueillons pas sciemment de données personnelles nominatives auprès de personnes de moins de 18 ans. Si vous êtes un parent ou un tuteur et que vous savez que votre Enfant nous a communiqué des Données à Caractère Personnel, veuillez nous Contactez. Si nous apprenons que nous avons recueilli des Données à Caractère Personnel auprès d'enfants sans vérifier s'il y a consentement parental, nous faisons le nécessaire pour supprimer ces informations de nos serveurs.</p>


<h2>Modifications de la présente Politique de Confidentialité</h2>
<p>Nous nous réservons le droit d'actualiser notre Politique de Confidentialité de temps à autre. Nous vous informerons de toute modification en publiant la nouvelle Politique de Confidentialité sur cette page.</p>
<p>Avant que la modification ne prenne effet, nous vous en informerons par e-mail et/ ou en plaçant un avis bien en vue dans notre Service et nous actualiserons la "date de prise d'effet" qui figure en haut de la présente Politique de Confidentialité.</p>
<p>Nous vous conseillons de consulter la présente Politique de Confidentialité périodiquement pour prendre connaissance de toute modification. Les modifications apportées à la présente Politique de Confidentialité prennent effet lorsqu'elles sont publiées sur cette page.</p>


<h2>Nous Contactez</h2>
<p>Pour toute question relative à la présente Politique de Confidentialité, veuillez nous Contactez:</p>
<ul>
        <li>Par courrier électronique: Artisan.GmbH@gmail.com</li>
          
        </ul>
        </p>
				
				
				
			
		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		

		<!-- FOOTER -->
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
