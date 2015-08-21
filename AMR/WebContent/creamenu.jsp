

<!DOCTYPE html>
<%@ page import='com.amr.data.User' %>
<%@ page import='com.amr.db.Connector' %>
<%@ page import='java.util.ArrayList' %>

<html>
  <head>
     
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-2.1.3.min.js"></script>
		  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
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
  boolean admin = false;
  String pass = null;
  
  if(utente.getEmail() != null){
	  admin = utente.isAdmin();
	  pass = utente.getPass();
  }else{
	  %>
	  <jsp:forward page="login.jsp" />
	  <%
  }
  %>
  <script>
  var primi = <%= Connector.getPiattiList("primo") %>;
  var secondi = <%= Connector.getPiattiList("secondo") %>;
  var contorni = <%= Connector.getPiattiList("contorno") %>;
  </script>
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
			<li id="sel_menu"><a href="#">Seleziona Menu</a></li>
		
		<li id="prenotazioni" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Prenotazioni <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Prenota Tavolo</a></li>
            <li><a href="#">Elimina Prenotazione</a></li>
          </ul>
        </li>
		
		<li id="gest_menu" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestisci Menu Affiliati<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Crea Menu</a></li>
			<li><a href="#">Modifica Menu</a></li>
            <li><a href="#">Elimina Menu</a></li>
          </ul>
        </li>
		
		<li id="gest_tavoli" class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Gestisci Tavoli<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Crea Tavolo</a></li>
			<li><a href="#">Modifica Tavolo</a></li>
            <li><a href="#">Elimina Tavolo</a></li>
          </ul>
        </li>
					<li id="gest_affilia"><a href="affiliaazienda.jsp">Affilia Azienda</a></li>
<li id="vis_scelte"><a href="visualizzascelte.jsp">Visualizza Scelte</a></li>
		
		
			
          </ul>
		  
	
		
		
		  
		<ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=utente.getEmail()%> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Visualizza Profilo</a></li>
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
     <h1>Crea Menù</h1>
     </div></div>
	
	<div class="row" id="alert-row" style="display:none">
    <div class="col-md-7 col-md-offset-3">
    <div class="alert alert-warning" >
  <strong>Attenzione!</strong> Il menù è già stato inserito per il giorno selezionato. Sarà possibile ora modificarlo.
  Una modifica, tuttavia annullerà le scelte effettuate dai clienti fino ad ora.
</div>
    </div>
    </div>
    
    
    <div class="row" >
    <div class="col-md-7 col-md-offset-3">
    <form class="form-horizontal" id="crea_form" action="AddMenu"  method="post">
    
    			  <div class="form-group">
    <label class="control-label col-sm-2" for="date">Giorno:</label>
    <div class="col-sm-7">
    <input type="text" class="form-control" id="datepicker" name="date" placeholder="Seleziona un giorno">
    </div>
  </div>
    
    
    
    <div id ="fields_div" style="display:none">
    <input style="display:none" type="text" name="fakeusernameremembered"/>
<input style="display:none" type="password" name="fakepasswordremembered"/>
    
    
    
			  <div class="form-group">
    <label class="control-label col-sm-2" for="primo_1">primo_1:</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" name="primo_1" id="primo_1" placeholder="Inserisci un primo" >
    </div>
  </div>
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="primo_2">primo_2:</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" name="primo_2" id="primo_2" placeholder="Inserisci un primo" >
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="primo_3">primo_3:</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" name="primo_3" id="primo_3" placeholder="Inserisci un primo" >
    </div>
  </div>
  
  <br>
  <br>
  
  
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="sec_1">secondo_1:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="sec_1" id="sec_1" placeholder="Inserisci un secondo" >
    </div>
  </div>
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="sec_2">secondo_2:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="sec_2" id="sec_2" placeholder="Inserisci un secondo" >
    </div>
  </div>
      <div class="form-group">
    <label class="control-label col-sm-2" for="sec_3">secondo_3:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="sec_3" id="sec_3" placeholder="Inserisci un secondo" >
    </div>
  </div>
  
   <br>
  <br>
  
        <div class="form-group">
    <label class="control-label col-sm-2" for="contorno_1">contorno_1:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="contorno_1" id="contorno_1" placeholder="Inserisci un contorno" >
    </div>
  </div>
  
        <div class="form-group">
    <label class="control-label col-sm-2" for="contorno_2">contorno_2:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="contorno_2" id="contorno_2" placeholder="Inserisci un secondo" >
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="contorno_3">secondo_3:</label>
    <div class="col-sm-7"> 
      <input type="text" class="form-control" name="contorno_3" id="contorno_3" placeholder="Inserisci un secondo" >
    </div>
  </div>
 
  
  <br>

  <div class="form-group"> 
    <div class="col-md-7 col-md-offset-2">
      <button type="submit" class="btn btn-lg btn-primary btn-block">SALVA</button>
    </div>
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
    
    
    </div>
    </div>


	<script>
	<%
	if(admin){
		%>
		
		$("#sel_menu").css('display','none');
		$("#prenotazioni").css('display','none');
	<%
	}else{
		%>
		$("#gest_menu").css('display','none');
		$("#gest_tavoli").css('display','none');
		$("#gest_affilia").css('display','none');
	<%
	}
	
	%>
	
	jQuery.validator.addMethod("equals", function(value, element, param) { 
		  return this.optional(element) || value === param; 
		}, "You must enter {0}");
	
	    $("#crea_form").validate({
	        rules: {
	        	primo_1: {
	                required: true,
	                minlength: 2
	            },
	            primo_2: {
	                minlength: 2
	            },
	            primo_3: {
	                minlength: 2
	            },
	            sec_1: {
	            	required: true,
	                minlength: 2
	            },
	            sec_2: {
	            	minlength: 2
	            	
	            },
	            sec_3: {
	            	minlength: 2
	            },
	            contorno_1: {
	            	required: true,
	            	minlength: 2
	            },
	            contorno_2: {
	            	minlength: 2
	            },
	            contorno_2: {
	            	minlength: 2
	            },
	            contorno_2: function(element) {
	                $(element).closest('.form-group').addClass('has-error');
	            },
	            contorno_3: function(element) {
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

	    $(function() {
	        $( "#datepicker" ).datepicker();
	        $('#datepicker').change(function() {
	        		$('#fields_div').css('display','inline');
	        		var date = $('#datepicker').val();
	        		
	        		$.get("/AMR/GetMenu?date="+date, function(responseText) {
	        			if(!responseText == ""){
	 			       		var res = JSON.parse(responseText);
	 			       		var id = res.id
	 			       		var primi = res.primi
	 			       		var secondi = res.secondi
	 			       		var contorni = res.contorni
	 			       		$('#alert-row').css('display','inline');	
	 			       		$('#primo_1').val(primi[0].nome);
	 			       		$('#primo_2').val(primi[1].nome);
	        				$('#primo_3').val(primi[2].nome);	
		        			$('#sec_1').val(secondi[0].nome);
		        			$('#sec_2').val(secondi[1].nome);
		        			$('#sec_3').val(secondi[2].nome);		        			
		        			$('#contorno_1').val(contorni[0].nome);
		        			$('#contorno_2').val(contorni[1].nome);
		        			$('#contorno_3').val(contorni[2].nome);		        			
	        			}else{	
	        				$('#alert-row').css('display','none');
	        				$('#primo_1').val("");
		        			$('#primo_2').val("");
		        			$('#primo_3').val("");
		        			$('#sec_1').val("");
		        			$('#sec_2').val("");
		        			$('#sec_3').val("");
		        			$('#contorno_1').val("");
		        			$('#contorno_2').val("");
		        			$('#contorno_3').val("");
	        			}
	        			
	        			
	                });
	        		
	        	});
	      });
	    
	$("#primo_1").autocomplete({
		source: primi,
		appendTo: $("form:first")
	});	
	$("#primo_2").autocomplete({
		source: primi,
		appendTo: $("form:first")
	});
	$("#primo_3").autocomplete({
		source: primi,
		appendTo: $("form:first")
	});
	
	$("#sec_1").autocomplete({
		source: secondi,
		appendTo: $("form:first")
	});
	$("#sec_2").autocomplete({
		source: secondi,
		appendTo: $("form:first")
	});
	$("#sec_3").autocomplete({
		source: secondi,
		appendTo: $("form:first")
	});
	
	$("#contorno_1").autocomplete({
		source: contorni,
		appendTo: $("form:first")
	});
	$("#contorno_2").autocomplete({
		source: contorni,
		appendTo: $("form:first")
	});
	$("#contorno_3").autocomplete({
		source: contorni,
		appendTo: $("form:first")
	});
 

 

	

	</script>		

</body>
</html>

