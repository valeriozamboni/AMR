

<!DOCTYPE html>
<%@ page import='com.amr.data.User' %>
<%@ page import='com.amr.db.Connector' %>
<%@ page import='java.util.ArrayList' %>
<%@ page import='java.util.List' %>


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
     <h1>Visualizza prenotazioni</h1>
     </div></div>

	 <br>
	  <br>
	
	<div class="row" id="alert-row" style="display:none">
    <div class="col-md-7 col-md-offset-3">
    <div class="alert alert-warning" >
  <strong>Attenzione!</strong> Non è stata effettuata nessuna prenotazione per il giorno selezionato.  Riprova in seguito.
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
    
   <br>
   
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="filtroF">Filtra per fascia:</label>
    <div class="col-sm-7">
<select class="form-control" id="filtroF" name= "filtroF" >
      <option value=""> Nessuna fascia selezionata</option>
      <option value="1">Pranzo</option>
      <option value="2">Cena</option>
      </select>
     </div>
  </div>
    
    <div class="row" >
    <div class="col-md-7 col-md-offset-2">
    
    <div id ="fields_div" style="display:none">
    
    <h2>Prenotazioni</h2>
  <table class="table table-striped" id="prentable">
    <thead>
      <tr>
        <th>Orario</th>
        <th>Nome</th>
        <th>Tavolo</th>
        <th>Fascia</th>
      </tr>
    </thead>
  </table>

</div> 

		</div></div>	  

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
	

	    $(function() {
	        $( "#datepicker" ).datepicker();
	        $('#datepicker').change(function() {
	        		$('#fields_div').css('display','inline');
	        		
	        		var date = $('#datepicker').val();
	        		$('#filtroF').val("");	        		
	        		$.get("/AMR/GetPrenotazioni?date="+date, function(responseText) {
	        			if(!responseText == ""){
 		        			$('#alert-row').css('display','none');
 		        			$("#prentable").find("tr:gt(0)").remove();
 		        			
 		        			var res = JSON.parse(responseText);
 	 			       		var pren = res.prenotazioni
 	 			       		
 	 			       		pren.forEach(function(entry) {
 	 			       			console.log(entry)
 	 			       			var fas = ""
 	 			       			if(entry.fascia == 1){
 	 			       				fas = "Pranzo"
 	 			       			}else{
 	 			       				fas = "Cena"
 	 			       			}
 	 			       			addRow('prentable', entry.orario, entry.cliente, entry.tavolo, fas)
 	 			       		});
 	 			       		
 	 			       		
 	 			       		
 	        			}else{
	        				$('#alert-row').css('display','inline');
							$('#fields_div').css('display','none');
 	        			}
	        			
	        			
	                });
	        		
	        	});
	      });
	    
	    

	    
	    function addRow(tableId, orario, nome, tavolo, fas) {

	        var table = document.getElementById(tableId);

	        var rowCount = table.rows.length;
	        var row = table.insertRow(rowCount);

	        var cell3 = row.insertCell(0);
	       	cell3.innerHTML = orario;
	       	var cell4 = row.insertCell(1);
	       	cell4.innerHTML = nome;
	       	var cell5 = row.insertCell(2);
	       	cell5.innerHTML = tavolo;

	       	var cell6 = row.insertCell(3);
	       	cell6.innerHTML = fas;
	       
	}
	    var usList = <%=Connector.getUtentiList()%>;
	    if(usList.length > 0){
	    usList.forEach(function(obj) {

	       		$('#filtroUt').append($("<option></option>")
			         .attr("value",obj.id)
			         .text(obj.nome + " " + obj.cognome));
	      		}
	    );
	    
	    $('#filtroF').change(function(){
	    	var id = $('#filtroF').val();
	    	var date = $('#datepicker').val()
	    	if($('#filtroUt').val() == ""){
        		$.get("/AMR/GetScelteCount?date="+date, function(responseText) {
        			//if(!responseText == ""){
// 		        			$('#alert-row').css('display','none');
// 		        			$("#primitable").children().remove()
// 		        			$("#seconditable").children().remove()
// 		        			$("#contornitable").children().remove()
// 		        			var res = JSON.parse(responseText);
// 	 			       		var primi = res.primi
// 	 			       		var secondi = res.secondi
// 	 			       		var contorni = res.contorni
	 			       		
// 	 			       		primi.forEach(function(entry) {
// 	 			       			addRow('primitable', entry.nome, entry.count)
// 	 			       		});
	 			       		
// 	 			       		secondi.forEach(function(entry) {
//  			       			addRow('seconditable', entry.nome, entry.count)
//  			       		});
	 			       		
// 	 			       		contorni.forEach(function(entry) {
// 			       				addRow('contornitable', entry.nome, entry.count)
// 			       			});
	 			       		
// 	        			}else{
//         				$('#alert-row').css('display','inline');
// 						$('#fields_div').css('display','none');
// 	        			}
        			
        			
                });
	    		
	    		
	    	}else{
	    		
		    	$.get("/AMR/GetPrenotazioni?date="+date+"&fascia="+id, function(responseText) {
		    		if(!responseText == ""){
		        			$('#alert-row').css('display','none');
		        			$("#prentable").find("tr:gt(0)").remove();
		        			
		        			var res = JSON.parse(responseText);
	 			       		var pren = res.prenotazioni
	 			       		
	 			       		pren.forEach(function(entry) {
	 			       			console.log(entry)
	 			       			var fas = ""
	 			       			if(entry.fascia == 1){
	 			       				fas = "Pranzo"
	 			       			}else{
	 			       				fas = "Cena"
	 			       			}
	 			       			addRow('prentable', entry.orario, entry.cliente, entry.tavolo, fas)
	 			       		});
	 			       		
	 			       		
	 			       		
	        			}else{
	        			$("#prentable").find("tr:gt(0)").remove();
        				$('#alert-row').css('display','inline');
						//$('#fields_div').css('display','none');
	        			}
		    	}
		    	
		    	);
	    		
	    		
	    		
	    	}


	    	
	    });

	    }

	

	</script>		

</body>
</html>

