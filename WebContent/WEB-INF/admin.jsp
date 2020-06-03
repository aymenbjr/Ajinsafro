<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ page import="entities.Commande" %>
    
    <%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="web.AgenceServlet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<title>Administration</title>
		<link rel="stylesheet" href="css/style6.css" type="text/css" media="all" />

</head>
<body>
<!-- Header -->
<div id="header">
	<div class="shell">
		<!-- Logo + Top Nav -->
		<div id="top">
			<h1><a href="http://localhost:8080/Ajinsafro/admin_commande" class="logo">
									<img src="./img/logogogo.png" alt="" width="170" height="75">
								</a></h1>
			<div id="top-navigation">
				Welcome <a><strong></strong></a>
				<span>|</span>
				<a href="http://localhost:8080/Ajinsafro/deconnection">Déconnection</a>
			</div>
		</div>
		<!-- End Logo + Top Nav -->
		
		<!-- Main Nav -->
		<div id="navigation">
		
			<ul>
			     <li><a href="http://localhost:8080/Ajinsafro/admin_commande" class="active"><span>Gestion des Commandes</span></a></li>
			    <li><a href="http://localhost:8080/Ajinsafro/admin_voyage"><span>Gestion des Voyages</span></a></li>
		</div>
		<!-- End Main Nav -->
		
		
	</div>
</div>
<!-- End Header -->

<!-- Container -->
<div id="container">
	<div class="shell">
		
		<!-- Small Nav -->
		<div class="small-nav">
			<a href="#">Dashboard</a>
			<span>&gt;</span>
			Commandes
		</div>
		<!-- End Small Nav -->
		<!--  Des alerts bootstrap -->
<c:if test="${succes != null }">
	<H2 style="color: green" role="alert">
  		<c:out value=" ${succes} "></c:out>
	</H2>
</c:if>
<c:if test="${erreur != null }">
	<H2 style="color: red"" role="alert">
  		<c:out value=" ${erreur} "></c:out>
	</H2>
</c:if>
		
		<!-- Message OK -->		
		
		<!-- End Message Error -->
		<br />
		<!-- Main -->
		<div id="main">
			<div class="cl">&nbsp;</div>
			
			<!-- Content -->
			<div id="content">
				<div class="box">
					
					<!-- Box Head -->
					<div class="box-head">
						<h2>Management</h2>
					</div>
					<!-- End Box Head-->
					
					<div class="box-content">
						<a href="http://localhost:8080/Ajinsafro/ajout_voyage" class="add-button"><span>Ajouter un Voyage</span></a>
						<div class="cl">&nbsp;</div>
					</div>
				</div>
				<!-- Box -->
				<div class="box"> 
					<div class="box-head">
						<h2 class="left">Liste des Commandes</h2>
					</div>
					<!-- End Box Head -->	
					<!-- Table -->
					<div class="table">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>Numero Commande</th>
								<th>Nom Client</th>
								<th>Numero Voyage</th>
								<th>Destination</th>
								<th>Type de Voyage</th>
								<th>Date de depard</th>
								<th>Duree</th>
								<th width="110" class="ac">Actions</th>
							</tr>
								<c:forEach items="${ commande}" var="commande">
							<tr>
								<td> ${ commande.id_commande}</td>
								<td> ${ commande.nom_cl}</td>
								<td> ${ commande.id_Voyage}</td>
								<td> ${ commande.destination}</td>
								<td> ${ commande.type}</td>
								<td> ${ commande.date}</td>
								<td> ${ commande.duree}</td>
								<td><a href="http://localhost:8080/Ajinsafro/supprimer_commande?id_c=${ commande.id_commande}" class="ico del">Supprimer</a></td>
							</tr> 
							</c:forEach>
						<!-- End Pagging -->
						
					</div>
					<!-- Table -->
					
				</div>
				<!-- End Box -->
				
				<!-- Box -->
				
				<!-- End Box -->

			</div>
			<!-- End Content -->
			
			<!-- Sidebar -->
			<div id="sidebar">
				
				<!-- Box -->
				
				<!-- End Box -->
			
			<!-- End Sidebar -->
			
			<div class="cl">&nbsp;</div>			
		</div>
		<!-- Main -->
	</div>
</div>
<!-- End Container -->

<!-- Footer -->
<!-- End Footer -->
	
</body>
</html>