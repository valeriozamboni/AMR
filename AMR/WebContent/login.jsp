<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/signin/ -->
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>AMR Login</title>
	<!-- jquery -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-2.1.3.min.js"></script>

	
	
<!--     Bootstrap core CSS -->
<!--     <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet"> -->

<!--     Custom styles for this template -->
<!--     <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet"> -->
    	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./ie-emulation-modes-warning.js"></script><style type="text/css"></style>
	<link href="style.css" rel="stylesheet" type="text/css">
	
	
  </head>

  <body>

<%session.invalidate();%>
	
  <div class="row">
     <div class="col-md-4 col-md-offset-3">

    <div id="login_container">

   <form class="form-signin" id="login_form" action="Login"  method="post">
	  <div id="login_form">
        <h2 class="form-signin-heading">Login</h2>
        <label for="loginEmail" class="sr-only">Email address</label>
        <input type="email" name="loginEmail" class="form-control" placeholder="Email address" >
        <label for="loginPassword" class="sr-only">Password</label>
        <input type="password" name="loginPassword" class="form-control" placeholder="Password">
		</div>
		
        <br>
        <button class="btn btn-lg btn-primary btn-block" id="login_button" type="submit">Login</button>
      </form>
      <div class="form-signin" id="form-back"> 
       <button class="btn btn-lg btn-primary btn-block" id="go_reg_button" >Registrati</button>
      </div>
	  
    </div> 
    
    <div class = "container" id="reg_container" style="display: none;">
    	<form class="form-signin" id="reg_form" action="Registrati"  method="post">
    	<div id="reg_form" >
        <h2 class="form-signin-heading">Dati Personali</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="inputEmail" class="form-control" placeholder="Email address" >
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="inputPassword" class="form-control" placeholder="Password" >
		<label for="inputNome" class="sr-only">Nome</label>
        <input type="text" name="inputNome" class="form-control" placeholder="Nome" >
		<label for="inputCognome" class="sr-only">Cognome</label>
        <input type="text" name="inputCognome" class="form-control" placeholder="Cognome" >
		<label for="inputCF" class="sr-only">Codice Fiscale</label>
        <input type="text" name="inputCF" class="form-control" placeholder="Codice Fiscale" >
		<label for="inputResidenza" class="sr-only">Residenza</label>
        <input type="text" name="inputResidenza" class="form-control" placeholder="Residenza" >
        <label for="cod" class="sr-only">Codice Affiliazione</label>
        <input type="text" name="cod" class="form-control" placeholder="Codice Affiliazione" >
	<br>
      </div>
      		<button class="btn btn-lg btn-primary btn-block" id="reg_button" >Registrati</button>
      </form>
      <div class="form-signin" id="form-back-2">
      <button class="btn btn-lg btn-primary btn-block" id="back_button">Indietro</button>
      </div>
    </div>
	</div>
	</div>
	<script>
	
$(document).ready(function(){
    $("#go_reg_button").click(function(){
		$("#login_container").css('display','none');
		$("#reg_container").css('display','inline');
    }); 
	
	$("#back_button").click(function(){
		$("#login_container").css('display','inline');
		$("#reg_container").css('display','none');
    }); 
});


	</script>
	
	
	
	
</body></html>