

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
            <li id="gest_creamenù"><a href="selezionamenu.jsp">Seleziona Menu</a></li>
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
     <h1>Seleziona i Piatti</h1>
     </div></div>

	
	
	<div class="row" id="alert-row" style="display:none">
    <div class="col-md-7 col-md-offset-3">
    <div class="alert alert-warning" >
  <strong>Attenzione!</strong> Il menù non è stato ancora inserito per il giorno selezionato.  Riprova in seguito.
</div>
    </div>
    </div>
    
    	<div class="row" id="alert-row-2" style="display:none">
    <div class="col-md-7 col-md-offset-3">
    <div class="alert alert-warning" >
  <strong>Attenzione!</strong> Le scelte sono già state effettuate per il giorno selezionato. Sarà possibile ora modificarle.
</div>
    </div>
    </div>
    
    
    <div class="row" >
    <div class="col-md-7 col-md-offset-3">
    <form class="form-horizontal" id="crea_form" name="crea_form" action="AddSceltaGiornaliera"  method="post">
    
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
    <label class="control-label col-sm-2" for="selprimo">seleziona primo:</label>
    <div class="col-sm-7">
<select class="form-control" id="selprimo" name= "selprimo" >
      <option disabled selected value=""> -- seleziona un primo --</option>
      </select>
     </div>
  </div>
  
    
  
  <br>
  <br>
  
  
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="selsecondo">seleziona secondo:</label>
    <div class="col-sm-7"> 
	<select class="form-control" id="selsecondo" name= "selsecondo" >
	<option disabled selected value= ""> -- seleziona un secondo --
      </option>
	</select>
    </div>
  </div>
  
    
  
   <br>
  <br>
  
        <div class="form-group">
    <label class="control-label col-sm-2" for="selcontorno">selziona contorno:</label>
    <div class="col-sm-7"> 
      <select class="form-control" id="selcontorno" name= "selcontorno" >
      <option disabled selected value=""> -- seleziona un contorno --
      </option>
	</select>
    </div>
  </div>
     
 <input style="display:none" type="text" name="userid" value="<%=utente.getId() %>"/>
  <input style="display:none" type="text" id="menuid" name="menuid"/>
  
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
	
	jQuery.validator.addMethod("notEqual", function(value, element, param) {
		  return this.optional(element) || value != param;
		}, "Please specify a different (non-default) value");
	
	    $("#crea_form").validate({
	        rules: {
	        	selprimo: {
	                required:true    
	            },
	            selsecondo: {
	            	required:true
	            },
	            selcontorno: {
	            	required:true
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
	        		$("#selprimo").empty();
	        		$('#selprimo').append($("<option disabled selected></option>")
	        				.attr("value","")
       			         .text("-- seleziona un primo --"));
	        		$("#selsecondo").empty();
	        		$('#selsecondo').append($("<option disabled selected></option>")
	        			 .attr("value","")
       			         .text("-- seleziona un secondo --"));
	        		$("#selcontorno").empty();
	        		$('#selcontorno').append($("<option disabled selected></option>")
	        			 .attr("value","")
       			         .text("-- seleziona un contorno --"));
	        		var date = $('#datepicker').val();
	        		
	        		$.get("/AMR/GetMenu?date="+date, function(responseText) {
	        			if(!responseText == ""){
		        			$('#alert-row').css('display','none');
		        			
		        			var res = JSON.parse(responseText);
	 			       		var id = res.id
	 			       		
	 			       		
	 			       		var primi = res.primi
	 			       		var secondi = res.secondi
	 			       		var contorni = res.contorni
	 			       		$('#menuid').val(id)
	 			       		primi.forEach(function(entry) {
	 			       		$('#selprimo').append($("<option></option>")
		        			         .attr("value",entry.id)
		        			         .text(entry.nome));
	 			      		});
	 			       		secondi.forEach(function(entry) {
	 			       		$('#selsecondo').append($("<option></option>")
		        			         .attr("value",entry.id)
		        			         .text(entry.nome));
	 			      		});
	 			       		contorni.forEach(function(entry) {
	 			       		$('#selcontorno').append($("<option></option>")
		        			         .attr("value",entry.id)
		        			         .text(entry.nome));
	 			      		});
		        			
		        			
	        			}else{
	        				$('#alert-row').css('display','inline');
							$('#fields_div').css('display','none');
							$('#alert-row-2').css('display','none');
	        			}
	        			
	        			
		        		$.get("/AMR/GetScelta?idMenu="+id+"&idCliente="+<%=utente.getId() %>, function(responseText) {
		        			if(!responseText == ""){
		        				$('#alert-row-2').css('display','inline');
			        			var scelta = JSON.parse(responseText);
			        			var primo = scelta.primo.id
			        			var secondo = scelta.secondo.id
			        			var contorno = scelta.contorno.id
			        			$('#selprimo').val(primo);
			        			$('#selsecondo').val(secondo);
			        			$('#selcontorno').val(contorno);
		        			}else{
		        				$('#alert-row-2').css('display','none');
		        			}
		                });
	        			
	        			
	                });
	        		

	        		
	        	});
	      });
	    
	

 

	

	</script>		

</body>
</html>

