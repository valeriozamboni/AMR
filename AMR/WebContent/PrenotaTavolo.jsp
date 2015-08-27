

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
	
	<script type="text/javascript" src="bootstrap-multiselect.js"></script>
	<link rel="stylesheet" href="bootstrap-multiselect.css" type="text/css"/>
	
	<link href="multiple-select.css" rel="stylesheet"/>
	<script src="jquery.multiple.select.js"></script>
		<link href="bootstrap.min.css" rel="stylesheet" type="text/css">
	

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
				<li id="pre_tavolo"><a href="visualizzascelte.jsp">Visualizza Scelte</a></li>
		
		
			
          </ul>
		  
	
		
		
		  
		<ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=utente.getEmail()%> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Prenota Tavolo</a></li>
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
    <label class="control-label col-sm-2" for="Tavoli">Tavoli:</label>
    <div class="col-sm-7">
<select  multiple="multiple" id="Tavoli" name= "Tavoli[]" >
      
      
	</select>
    </div>
  </div>
  
    
			  <div class="form-group">
    <label class="control-label col-sm-2" for="Fascia">Orario Indicativo:</label>
    <div class="col-sm-7">
    <input type="text" name="orario" id= "orario" class="form-control" placeholder="Inserisci un orario indicativo" >
    </div>
  </div>
  
    <div class="form-group">
    <label class="control-label col-sm-2" for="persone">Numero di Persone:</label>
    <div class="col-sm-7">
<select  class="form-control" id="persone" name= "persone" >
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      <option value="6">6</option>
      <option value="7">7</option>
      <option value="8">8</option>
      <option value="9">9</option>
      <option value="10">10</option>
      <option value="11">11</option>
      <option value="12">12</option>
      <option value="13">13</option>
      <option value="14">14</option>
      <option value="15">15</option>
      <option value="16">16</option>
      <option value="17">17</option>
      <option value="18">18</option>
      <option value="19">19</option>
      <option value="20">20</option> 
	</select>
    </div>
  </div>
  

     
 <input style="display:none" type="text" name="userid" value="<%=id %>"/>
  
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
	$('#Tavoli').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true
    });
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
		        			
		        			var res = JSON.parse(responseText);
	 			       		var tavoli = res.tavoli
	 			       		tavoli.forEach(function(entry) {
	 			       			$("#Tavoli").append($("<option></option>")
	 			       				.attr("value",entry.id)
	 			       				.text(entry.nome + "[" + entry.min + "-"+ entry.max + "]"));
	 			       		});
	 			       		$("#Tavoli").multiselect('rebuild')
	 			       		
// 	 			       		var primi = res.primi
// 	 			       		var secondi = res.secondi
// 	 			       		var contorni = res.contorni
// 	 			       		$('#menuid').val(id)
// 	 			       		primi.forEach(function(entry) {
// 	 			       		$('#selprimo').append($("<option></option>")
// 		        			         .attr("value",entry.id)
// 		        			         .text(entry.nome));
// 	 			      		});
// 	 			       		secondi.forEach(function(entry) {
// 	 			       		$('#selsecondo').append($("<option></option>")
// 		        			         .attr("value",entry.id)
// 		        			         .text(entry.nome));
// 	 			      		});
// 	 			       		contorni.forEach(function(entry) {
// 	 			       		$('#selcontorno').append($("<option></option>")
// 		        			         .attr("value",entry.id)
// 		        			         .text(entry.nome));
// 	 			      		});
		        			
		        			
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

