

<!DOCTYPE html>
<%@ page import='com.amr.data.User' %>

<html>
  <head>
     
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="jquery-2.1.3.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<link href="style.css" rel="stylesheet" type="text/css">
	<link href="bootstrap.min.css" rel="stylesheet" type="text/css">

  </head>
  <body>
  
    <jsp:useBean id="utente" scope="session" class="com.amr.data.User"/>
  <%
  User user = (User)request.getAttribute("user");
  if(user != null){
	  utente.setNome(user.getNome());
	  utente.setCognome(user.getCognome());
	  utente.setCf(user.getCf());
	  utente.setEmail(user.getEmail());
	  utente.setAdmin(user.isAdmin());
	  utente.setAffiliato(user.isAffiliato());
	  utente.setPass(user.getPass());
	  utente.setResidenza(user.getResidenza());
	  utente.setId(user.getId());
  }
  

  if(utente.getEmail() == null){
	  %>
	  <jsp:forward page="login.jsp" />
	  <%
  }
  boolean admin = utente.isAdmin();
  
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
			<li id="sel_menu"><a href="selezionamenu.jsp">Seleziona Menu</a></li>
		
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
            <li id="gest_creamenù"><a href="creamenu.jsp">Crea Menu</a></li>
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
					<li id="agg_tav"><a href="aggiungitavolo.jsp">Aggiungi Tavolo</a></li>
					<li id="pren_tav"><a href="PrenotaTavolo.jsp">Prenota Tavolo</a></li>

		
		
			
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
  
  
	<div class="container theme-showcase" id="main_container" role="main">
		<div class="jumbotron">
			<h1>Title</h1>
			<p>sottotitolo</p> 
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
		$("#vis_scelte").css('display','none');
		$("#agg_tav").css('display','none');
	<%
	}
	
	%>
	
	

	</script>		

</body>
</html>

