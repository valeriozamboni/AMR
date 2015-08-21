<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  boolean admin = false;
  if(utente.getEmail() != null){
	  admin = utente.isAdmin();
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
            <li><a href="creamenu.jsp">Crea Menu</a></li>
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
					<li id="gest_affilia"><a href="#">Affilia Azienda</a></li>

		<li id="vis_scelte"><a href="visualizzascelte.jsp">Visualizza Scelte</a></li>
		<li id="agg_tav"><a href="aggiungitavolo.jsp">Aggiungi Tavolo</a></li>
		
			
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
  <br>
      <div class="row">
     <div class="col-md-6 col-md-offset-3">
     <h1>Aggiungi Tavolo</h1>
     </div></div>
<br>
<br>
  
      <div class="row">
    <div class="col-md-7 col-md-offset-3">
    <form class="form-horizontal" id="addTavolo" action="AddTavolo"  method="post">
    
    			  <div class="form-group">
    <label class="control-label col-sm-2" for="nome">Nome Tavolo:</label>
    <div class="col-sm-7">
      <input type="text" class="form-control" name="nome" placeholder="Inserisci il Nome del Tavolo">
    </div>
  </div>
  
      			  <div class="form-group">
    <label class="control-label col-sm-2" for="PostiMin">Posti Minimi:</label>
    <div class="col-sm-7">
<select class="form-control" id="PostiMin" name= "PostiMin" >
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
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="PostiMax">Posti Massimi:</label>
    <div class="col-sm-7">
<select class="form-control" id="PostiMax" name= "PostiMax" >
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
	</select>    </div>
  </div>
  	<br>

    <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-7">
      <button type="submit" class="btn btn-lg btn-primary btn-block">SALVA</button>
    </div>
  </div>

  </form>
<div class="row">
     <div class="col-md-7 col-md-offset-2">
     <form action="home.jsp">
    <input type="submit" class="btn btn-lg btn-primary btn-block" value="INDIETRO">
</form>
     </div></div>
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
		$("#agg_tav").css('display','none');
	<%
	}
	
	%>
	
	$("#affilia").validate({
        rules: {
            nome: {
                required: true,
                minlength: 1
            },
            PostiMin: {
                required: true,
            },
            PostiMax: {
                required: true,
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

