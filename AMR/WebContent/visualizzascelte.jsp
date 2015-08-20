

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
  int id = -1;

  if(utente.getEmail() != null){
	  admin = utente.isAdmin();
	  pass = utente.getPass();
	  id = utente.getId();

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
     <h1>Visualizza scelte</h1>
     </div></div>

	
	
	<div class="row" id="alert-row" style="display:none">
    <div class="col-md-7 col-md-offset-3">
    <div class="alert alert-warning" >
  <strong>Attenzione!</strong> Il menù non è stato ancora inserito per il giorno selezionato.  Riprova in seguito.
</div>
    </div>
    </div>
    
    
    
    <div class="row" >
    <div class="col-md-7 col-md-offset-3">
    <form class="form-horizontal" id="visualizza_form" action="VisualizzaScelte"  method="post">
    
    			  <div class="form-group">
    <label class="control-label col-sm-2" for="date">Giorno:</label>
    <div class="col-sm-7">
    <input type="text" class="form-control" id="datepicker" name="date" placeholder="Seleziona un giorno">
    </div>
  </div>
    
    
    
    <div id ="fields_div" style="display:none">
    <input style="display:none" type="text" name="fakeusernameremembered"/>
<input style="display:none" type="password" name="fakepasswordremembered"/>
    
    
  <table class="table table-striped" id="myTable">
    <thead>
      <tr>
        <th>Nome Piatto</th>
        <th>Quantità</th>
      </tr>
    </thead>
  </table>
</div> 

			  
     

  <input style="display:none" type="text" id="menuid" name="menuid"/>
  
  <br>
</form>
  
  
  <div class="row">
     <div class="col-md-7 col-md-offset-2">
     <form action="home.jsp">
    <input type="submit" class="btn btn-lg btn-primary btn-block" value="INDIETRO">
</form>
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
	        			}
	        			
	        			
	                });
	        		
	        	});
	      });
	    
	    

	    
	   
	    

 

	

	</script>		

</body>
</html>

