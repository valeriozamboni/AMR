

<!DOCTYPE html>
<%@ page import='com.amr.data.User' %>

<html>
  <head>
     
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-2.1.3.min.js"></script>
	<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link href="style.css" rel="stylesheet" type="text/css">
	
	

  </head>
  <body>
  <jsp:useBean id="utente" scope="session" class="com.amr.data.User"/>
  <%
  boolean admin = true;
  boolean affiliato = true;
  if(utente.getEmail() != null){
	  admin = utente.isAdmin();
	  affiliato = utente.isAffiliato();
  }else{
	  %>
	  <jsp:forward page="login.jsp" />
	  <%
  }
  %>
  <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
           <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="home.jsp">AMR</a>
    </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
			
		
		<li id="prenotazioni-usr" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Prenotazioni <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="PrenotaTavolo.jsp">Prenota Tavolo</a></li>
            <li><a href="#">Le mie prenotazioni</a></li>
          </ul>
        </li>
		
		<li id="menu-aff" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Menu Affiliati<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li id="gest_creamen�"><a href="selezionamenu.jsp">Seleziona Menu</a></li>
			<li><a href="#">I miei Menu</a></li>
          </ul>
        </li>
		
		<li id="gest-tavoli" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestione Tavoli<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="aggiungitavolo.jsp">Crea Tavolo</a></li>
			<li><a href="#">I miei tavoli</a></li>
          </ul>
        </li>
        <li id="prenotazioni-admin" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestione Prenotazioni<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="visualizzaprenotazioni.jsp">Visualizza Prenotazioni</a></li>
			<li><a href="PrenotaTavolo.jsp">Inserisci Prenotazione</a></li>
          </ul>
        </li>
        <li id="menu-admin" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestione Menu<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="creamenu.jsp">Inserisci Menu</a></li>
			<li><a href="visualizzascelte.jsp">Visualizza Scelte</a></li>
			<li><a href="#">I miei menu</a></li>
          </ul>
        </li>
        
		<li id="affilia"><a href="affiliaazienda.jsp">Affilia Azienda</a></li>

          </ul>
		  
	
		
		
		  
		<ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=utente.getEmail()%> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="visualizzaprofilo.jsp">Visualizza Profilo</a></li>
            <li><a href="login.jsp">Logout</a></li>
          </ul>
        </li>
      </ul>
        </div>
      </div>
    </nav>
    <br>
    <br>
    <div class="row">
     <div class="col-md-6 col-md-offset-3">
     <h1>Modifica le tue informazioni</h1>
     </div></div>
    <br>
    <br>
    
    <div class="row">
    <div class="col-md-7 col-md-offset-3">
    <form class="form-horizontal" id="mod_form" action="ModificaProfilo"  method="post">
    
    <input style="display:none" type="text" name="fakeusernameremembered"/>
<input style="display:none" type="password" name="fakepasswordremembered"/>
    
    
    
			  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Email:</label>
    <div class="col-sm-7">
      <input type="email" class="form-control" name="email" placeholder="Enter email" value=<%=utente.getEmail() %>>
    </div>
  </div>
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password corrente:</label>
    <div class="col-sm-7"> 
      <input type="password" name="pwd" class="form-control" placeholder="Enter password" value=<%=utente.getPass() %>>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="new_pwd">Nuova password:</label>
    <div class="col-sm-7"> 
      <input type="password" class="form-control" name="new_pwd" id="new_pwd" placeholder="Enter password">
    </div>
  </div>
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="new_pwd_chk">Inserisci di nuovo la password:</label>
    <div class="col-sm-7"> 
      <input type="password" class="form-control" name="new_pwd_chk" placeholder="Enter password" >
    </div>
  </div>
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="nome">Nome:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="nome" placeholder="Nome" value=<%=utente.getNome() %>>
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="cognome">Cognome:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="cognome" placeholder="Cognome" value=<%=utente.getCognome() %>>
    </div>
  </div>
  
        <div class="form-group">
    <label class="control-label col-sm-2" for="residenza">Residenza:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="residenza" placeholder="Residenza" value=<%=utente.getResidenza() %>>
    </div>
  </div>
  
        <div class="form-group">
    <label class="control-label col-sm-2" for="cf">Codice Fiscale:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="cf" placeholder="Codice Fiscale" value=<%=utente.getCf() %>>
    </div>
  </div>
  
  <input type="hidden" name="oldemail" value=<%=utente.getEmail() %>>
  
  <br>

  <div class="form-group"> 
    <div class="col-md-7 col-md-offset-2">
      <button type="submit" class="btn btn-lg btn-primary btn-block">SALVA</button>
    </div>
  </div>
  
  </form>
  <div class="row">
     <div class="col-md-7 col-md-offset-2">
     <form action="home.jsp">
    <input type="submit" class="btn btn-lg btn-primary btn-block" value="INDIETRO">
</form>
		</div>
    </div>
    
    
    
  




	<script>
		<%
	if(admin){
		//Admin hides: prenotazioni-usr, menu-aff
		%>
		
		$("#menu-aff").css('display','none');
		$("#prenotazioni-usr").css('display','none');
	<%
	}else{
		
		//User hides: gest-tavoli, prenotazioni-admin, affilia, menu-admin
		%>
		
		$("#gest-tavoli").css('display','none');
		$("#prenotazioni-admin").css('display','none');
		$("#affilia").css('display','none');
		$("#menu-admin").css('display','none');
		<%
		if(!affiliato){
		%>
			$("#menu-aff").css('display','none');
		<%
		}	
	}
	%>
	
	
	jQuery.validator.addMethod("equals", function(value, element, param) { 
		  return this.optional(element) || value === param; 
		}, "You must enter {0}");
	
	    $("#mod_form").validate({
	        rules: {
	            nome: {
	                required: true,
	                minlength: 2
	            },
	            cognome: {
	                required: true,
	                minlength: 2
	            },
	            residenza: {
	                required: true,
	                minlength: 2
	            },
	            cf: {
	                required: true,
	                minlength: 16,
	                maxlenght: 16
	            },
	            pwd: {
	            	required: true,
	            	minlength: 4,
	            	equals: "<%=utente.getPass()%>"
	            	
	            },
	            new_pwd: {
	            	minlength: 4
	            },
	            new_pwd_chk: {
	            	equalTo: "#new_pwd",
	            	minlength: 4
	            },
	            highlight: function(element) {
	                $(element).closest('.form-group').addClass('has-error');
	            },
	            unhighlight: function(element) {
	                $(element).closest('.form-group').removeClass('has-error');
	            },
	            errorElement: 'span',
	            errorClass: 'help-block',
	            errorPlacement: function(error, element) {
	                if(element.parent('.input-group').length) {
	                    error.insertAfter(element.parent());
	                } else {
	                    error.insertAfter(element);
	                }
	            }
	        }
	    });

	

	</script>		

</body>
</html>

