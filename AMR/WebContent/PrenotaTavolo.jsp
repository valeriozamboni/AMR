

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
		
	<link href="bootstrap-datetimepicker.min.css" rel="stylesheet"/>
	<script src="bootstrap-datetimepicker.min.js"></script>
	

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
     <h1>Prenota tavolo</h1>
     </div></div>

	
	
	<div class="row" id="alert-row" style="display:none">
    <div class="col-md-7 col-md-offset-3">
    <div class="alert alert-warning" >
  <strong>Attenzione!</strong> Tutti i tavoli sono prenotati per la fascia selezionata
</div>
    </div>
    </div>
    
    
    
    <div class="row" >
    <div class="col-md-7 col-md-offset-3">
    <form class="form-horizontal" id="pren_form" action="PrenotaTavolo"  method="post">
    
    			  
    
    
    <div class="form-group">
    <label class="control-label col-sm-2" for="fascia">Fascia Oraria:</label>
    <div class="col-sm-7">
<select class="form-control" id="fascia" name= "fascia" >
      <option value="1">Pranzo</option>
      <option value="2">Cena</option>
      
	</select>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="date">Giorno:</label>
    <div class="col-sm-7">
    <input type="text" class="form-control" id="datepicker" name="giorno" placeholder="Seleziona un giorno">
    </div>
  </div>
  
  
  
  
    
    <div id ="fields_div" style="display: none;">
    <input style="display:none" type="text" name="fakeusernameremembered"/>
<input style="display:none" type="password" name="fakepasswordremembered"/>
    
    <div class="form-group">
    <label class="control-label col-sm-2" for="Tavoli">Seleziona un tavolo:</label>
    <div class="col-sm-7">
<select class="form-control" id="Tavoli" name= "Tavoli" >
     
      
	</select>
    </div>
  </div>
  
  
       <div class="form-group">
    <label class="control-label col-sm-2" for="ora">Orario Indicativo:</label>
    <div class="col-sm-7">
<select class="form-control" id="ora" name= "ora" >

      
	</select>
    </div>
  </div>
    
  

     
 <input style="display:none" type="text" name="userid" value="<%=utente.getId() %>"/>
  
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
	
// 	 $('#Tavoli').multipleSelect();
// 	$('#Tavoli').multiselect({
//         includeSelectAllOption: true,
//         enableFiltering: true
//     });
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
	        	orario: {
	                required: true
	        		                
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
	        $( "#datepicker" ).datepicker({
	            includeSelectAllOption: true,
	            enableFiltering: true
	        });
	        $('#datepicker').change(function() {	
	        	$('#fields_div').css('display','inline');	
	        	$("#Tavoli").empty();
				
	        		var date = $('#datepicker').val();
	        		var fascia = $('#fascia').val()
	        		
	        		$.get("/AMR/getTavoli?giorno="+date+"&fascia="+fascia, function(responseText) {
	        			if(!responseText == ""){
		        			$('#alert-row').css('display','none');
		        			console.log(responseText);
		        			
		        			var res = JSON.parse(responseText);
	 			       		var tavoli = res.tavoli
	 			       		tavoli.forEach(function(entry) {
	 			       			$("#Tavoli").append($("<option></option>")
	 			       				.attr("value",entry.id)
	 			       				.text(entry.nome + "[" + entry.min + "-"+ entry.max + "]"));
	 			       		}); 			       		

		        			
	        			}else{
	        				$('#alert-row').css('display','inline');
							$('#fields_div').css('display','none');
							
	        			}
	        			
	        			

	        			
	        			
	                });
	        		

	        		
	        	});
	      });
	    $('#fascia').change(function() {
	    	if($('#fascia').val() == "1"){
	    		
	    		$("#ora").empty();
	    		
	    		$("#ora").append($("<option></option>")
		       				.attr("value","11:00")
		       				.text("11:00"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","11:30")
	       				.text("11:30"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","12:00")
	       				.text("12:00"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","12:30")
	       				.text("12:30"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","13:00")
	       				.text("13:00"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","13:30")
	       				.text("13:30"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","14:00")
	       				.text("14:00"));
	    		$("#ora").append($("<option></option>")
	       				.attr("value","14:30")
	       				.text("14:30"));
		       		
	    	}else{
	    		
	    		$("#ora").empty();
	    		
	    	$("#ora").append($("<option></option>")
	       				.attr("value","18:00")
	       				.text("18:00"));
    		$("#ora").append($("<option></option>")
       				.attr("value","18:30")
       				.text("18:30"));
    		$("#ora").append($("<option></option>")
       				.attr("value","19:00")
       				.text("19:00"));
    		$("#ora").append($("<option></option>")
       				.attr("value","19:30")
       				.text("19:30"));
    		$("#ora").append($("<option></option>")
       				.attr("value","20:00")
       				.text("20:00"));
    		$("#ora").append($("<option></option>")
       				.attr("value","20:30")
       				.text("20:30"));
    		$("#ora").append($("<option></option>")
       				.attr("value","21:00")
       				.text("21:00"));
    		$("#ora").append($("<option></option>")
       				.attr("value","21:30")
       				.text("21:30"));
    		$("#ora").append($("<option></option>")
       				.attr("value","22:00")
       				.text("22:00"));
    		$("#ora").append($("<option></option>")
       				.attr("value","22:30")
       				.text("22:30"));
    		$("#ora").append($("<option></option>")
       				.attr("value","23:00")
       				.text("23:00"));
    		$("#ora").append($("<option></option>")
       				.attr("value","23:30")
       				.text("23:30"));
	    		
	    	}
	    });
	    $("#fascia").trigger('change');
	

	</script>		

</body>
</html>

