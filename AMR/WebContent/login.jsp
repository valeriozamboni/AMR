<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/signin/ -->
<html>
<head>

    <title>AMR Login</title>
	
	<!-- jquery -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-2.1.3.min.js"></script>

	
	
    <!-- Bootstrap core CSS -->
    <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/signin/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="./Signin Template for Bootstrap_files/ie-emulation-modes-warning.js"></script><style type="text/css"></style>

  </head>

  <body>




    <div class="container" id="login_container">

   <form class="form-signin"  action="LoginServlet"  method="post">
	  <div id="login_form">
        <h2 class="form-signin-heading">Login</h2>
        <label for="loginEmail" class="sr-only">Email address</label>
        <input type="email" name="loginEmail" class="form-control" placeholder="Email address" required="" autofocus="">
        <label for="loginPassword" class="sr-only">Password</label>
        <input type="password" name="loginPassword" class="form-control" placeholder="Password" required="">
		</div>
		
        <br>
        <button class="btn btn-lg btn-primary btn-block" id="login_button" type="submit">Login</button>
        
      </form>
      <form class="form-signin">  
	  <button class="btn btn-lg btn-primary btn-block" id="go_reg_button" type="submit">Registrati</button>
      </form>
	  
    </div> 
    
    <div class = "container" id="reg_container" style="display: none;">
    	<form class="form-signin"  action="LoginServlet"  method="get">
    	<div id="reg_form" >
        <h2 class="form-signin-heading">Dati Personali</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="inputEmail" class="form-control" placeholder="Email address" required="" autofocus="">
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="inputPassword" class="form-control" placeholder="Password" required="">
		<label for="inputNome" class="sr-only">Nome</label>
        <input type="text" id="inputNome" class="form-control" placeholder="Nome" required="">
		<label for="inputCognome" class="sr-only">Cognome</label>
        <input type="text" id="inputCognome" class="form-control" placeholder="Cognome" required="">
		<label for="inputCF" class="sr-only">Codice Fiscale</label>
        <input type="text" id="inputCF" class="form-control" placeholder="Codice Fiscale" required="">
		<label for="inputResidenza" class="sr-only">Residenza</label>
        <input type="text" id="inputResidenza" class="form-control" placeholder="Residenza" required="">
	<br>
      </div>
      		<button class="btn btn-lg btn-primary btn-block" id="reg_button" type="submit">Registrati</button>
      </form>
      <div class="form-signin">
      <button class="btn btn-lg btn-primary btn-block" id="back_button">Indietro</button>
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