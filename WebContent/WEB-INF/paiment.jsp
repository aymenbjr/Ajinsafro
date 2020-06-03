<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">


<div class="container">


<div class="row">
	<aside class="col-sm-6">
<legend>Artisan PAY</legend>

<article class="card">
<div class="card-body p-5">

<ul class="nav bg-light nav-pills rounded nav-fill mb-3" role="tablist">

	<li class="nav-item">
		<a class="nav-link active" data-toggle="pill" href="#nav-tab-card">
		
		<i class="fa fa-credit-card"></i> Carte Credit</a></li>
	
</ul>

<div class="tab-content">
<div class="tab-pane fade show active" id="nav-tab-card">
	
	<form role="form"  method="post" action="paiment">
	<div class="form-group">
		<label for="username">Nom Complet</label>
		<input type="text" class="form-control" name="username" placeholder="" required="">
	</div> <!-- form-group.// -->

	<div class="form-group">
		<label for="cardNumber">Numero de la Carte</label>
		<div class="input-group">
			<input type="text" class="form-control" name="cardNumber" placeholder="" required="">
			<div class="input-group-append">
				<span class="input-group-text text-muted">
					<i class="fab fa-cc-visa"></i>   <i class="fab fa-cc-amex"></i>   
					<i class="fab fa-cc-mastercard"></i> 
				</span>
			</div>
		</div>
	</div> <!-- form-group.// -->

	<div class="row">
	    <div class="col-sm-8">
	        <div class="form-group">
	            <label><span class="hidden-xs">Date d'Expiration</span> </label>
	        	<div class="input-group">
	        		<input type="number" class="form-control" placeholder="MM" name="" required="">
		            <input type="number" class="form-control" placeholder="YY" name="" required="">
	        	</div>
	        </div>
	    </div>
	    <div class="col-sm-4">
	        <div class="form-group">
	            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
	            <input type="number" class="form-control" required="">
	        </div> <!-- form-group.// -->
	    </div>
	    <div class="form-group">
		<label for="username"></label>
		<input type="hidden" class="form-control" name="email" value="${email }">
	</div>
	</div> <!-- row.// -->
	<a href="http://localhost:8080/Ajinsafro/paiment2"  >
	<button class="subscribe btn btn-primary btn-block" type="button"> Confirmer  </button>

	<button class="subscribe btn btn-primary btn-block" type="button">Payer Cash </button>
	</a>
	</form>
</div> <!-- tab-pane.// -->


</div> <!-- tab-content .// -->

</div> <!-- card-body.// -->
</article> <!-- card.// -->


	</aside> <!-- col.// -->
</div> <!-- row.// -->

</div> 
<!--container end.//-->

<br><br>
