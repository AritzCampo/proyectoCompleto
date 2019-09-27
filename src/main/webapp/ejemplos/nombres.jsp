<%@page import="java.util.ArrayList"%>

<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

	<h1>Listado Nombres</h1>
	
	<% if ( request.getAttribute("mensaje") != null ){ %>
	<div class="row">	
	 	<div class="col alert alert-${mensaje.tipo} alert-dismissible fade show" role="alert">
		  <p>${mensaje.texto}</p>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
	</div>	
	<%} %>
	
	<div class="row">	
		<div class="col-8 bg-light border border-secondary p-4">		
			
			<form method="get" action="nombres" class="form-inline">			  	
			  <label class="sr-only" for="buscar">Name</label>
			  <input type="search"
			  		 name="buscar"
			  		 id="buscar"
			  		 value="${buscar}"
			  		 required
			  		 class="form-control mb-2 mr-sm-2"  
			  		 placeholder="nombre a buscar">			  		 
			  <button type="submit" class="btn btn-primary mb-2">Buscar</button>
			  <a href="nombres" class="btn btn-danger ml-2 mb-1">Limpiar Filtro</a>
			</form>
			
			<% if ( request.getAttribute("buscar") != null ){ %>
				<p class="text-muted">Resultados para la busqueda de <b>${buscar}</b></p>
			<% } %>	
			
			
			
			<ul class="list-group">
			  <%
			 	 ArrayList<String> nombres = (ArrayList<String>)request.getAttribute("nombres");
			  
			     if ( nombres.isEmpty() ){
			  %>
			  	<li class="list-group-item text-danger">Lo Sentimos pero no hay coincidencias</li>
			  <%  	 
			     }
			  
			     for( String nombre : nombres ){
			  %>	
			  		<li class="list-group-item"><%=nombre%></li>
			  <%
			     } // end for
			  %>
			</ul>		
		</div>
				
		<div class="col-3 offset-1 bg-light p-4 border border-secondary">
			<form method="post" action="nombres" class="">			  	
			  <label class="sr-only" for="nombre">Nombre</label>
			  <input type="text"
			  		 name="nombre"
			  		 id="nombre"			  		 
			  		 required
			  		 class="form-control mb-2 mr-sm-2"  
			  		 placeholder="Nuevo Nombre">			  		 
			  <button type="submit" class="btn btn-block btn-primary mb-2">Dar De Alta</button>
			  
			</form>	
		</div>	
	</div>
	<!-- .row -->
	


<%@include file="../includes/footer.jsp"%>