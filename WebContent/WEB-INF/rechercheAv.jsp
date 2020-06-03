<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		<meta charset="utf-8">
		<title>Recherche</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- LINEARICONS -->
		<link rel="stylesheet" href="fonts/linearicons/style3.css">

		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

		<!-- DATE-PICKER -->
		<link rel="stylesheet" href="vendor/date-picker/css/datepicker.min.css">
		
		<!-- style3 CSS -->
		<link rel="stylesheet" href="css/style3.css">
	</head>

	<body>

		<div class="wrapper">
			<div class="inner">
				<form method="post" action="recherche2">
					<h3>Cherchez votre Voyage</h3>
					<c:if test="${erreur != null }">
					<div >
				  	<strong> <c:out value=" ${erreur} "></c:out> </strong>
				</div>
				<br/>
				</c:if>  
					<div class="form-row">
						<div class="form-wrapper">
							<label for="">destination</label>
							<input type="text" class="form-control"   name="destination">
						</div>
						<div class="form-wrapper">
							<label for="">type</label>
							<input type="text" class="form-control" name="type">
						</div>
					</div>
					<div class="form-row">
						
						<div class="form-wrapper">
							<label for="">dureeMin</label>
							<input type="text" class="form-control"   name="dureeMin">
						</div>
						 <div class="form-wrapper">
							<label for="">dureeMax</label>
							<input type="text" class="form-control"   name="dureeMax">
						</div>
					</div>
					<div class="form-row">
						
						<div class="form-wrapper">
							<label for="">budge</label>
							<input type="text" class="form-control"   name="budge">
						</div>
						  
					</div>
					
					<button data-text="Notez 20!">
						<span>Chercher</span>
					</button>
				</form>
			</div>
		</div>
		
		<script src="js/jquery-3.3.1.min.js"></script>

		<!-- DATE-PICKER -->
		<script src="vendor/date-picker/js/datepicker.js"></script>
		<script src="vendor/date-picker/js/datepicker.en.js"></script>

		<script src="js/main.js"></script>
	</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>