<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

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

<br/>


<form class="form-horizontal" method="post" action="ajout_voyage" >
<fieldset>

<!-- Form Name -->
<center><legend>Ajouter voyage</legend></center>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="titre">Destination</label>  
  <div class="col-md-4">
  	<input id="product_id" name="destination" placeholder="Destination" class="form-control input-md" required="" type="text">    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="type">Continent</label>
  <div class="col-md-4">
    <select id="type" name="continent" placeholder="Continent" class="form-control">
   		<option val="" disabled></option>
        <option val="AFRIQUE">Afrique</option>
        <option val="AMERIQUE">Amerique</option>
        <option val="ASIE">Asie</option>
        <option val="EUROPE">Europe</option>
        <option val="AUSTRALIE">Australie</option>
    </select>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="type">Type de voyage</label>
  <div class="col-md-4">
    <select id="type" name="type" placeholder="Type de Voyage" class="form-control">
   		<option val="" disabled></option>
        <option val="accompagne">Accompagné</option>
        <option val="individuel">Individuel</option>
    </select>
  </div>
</div>


<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">Date</label>  
  <div class="col-md-4">
  <input id="product_name_fr" name="date" placeholder="Date" class="form-control input-md" required="" type="date">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="available_quantity">Prix</label>  
  <div class="col-md-4">
  <input id="available_quantity" name="prix" placeholder="Prix" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="available_quantity">Duree</label>  
  <div class="col-md-4">
  <input id="available_quantity" name="duree" placeholder="Duree" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Text input-->


<div class="form-group">
  <label class="col-md-4 control-label" for="type">Theme</label>
  <div class="col-md-4">
    <select id="type" name="theme" placeholder="Theme de Voyage" class="form-control">
   		<option val="" disabled>Theme</option>
        <option val="vacance">Vacance</option>
        <option val="aventure">Aventure</option>
        <option val="travail">Travail</option>
    </select>
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="Poids">hebergement</label>  
  <div class="col-md-4">
  <input id="product_weight" name="hebergement" placeholder="hebergement " class="form-control input-md" required="" type="text">
    
  </div>
</div>


<!-- Button-->
  <center><button type="submit" class="btn btn-primary">Ajouter</button></center>

</fieldset>
</form>
