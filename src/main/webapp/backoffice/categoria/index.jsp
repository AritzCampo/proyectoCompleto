<%@page import="com.ipartek.formacion.controller.backoffice.UsuarioController"%>
<%@page import="com.ipartek.formacion.controller.backoffice.CategoriaController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

		
	<%@include file="../../includes/mensaje.jsp"%>
			
	
	<a href="backoffice/categoria?op=<%=CategoriaController.OP_MOSTRAR_FORMULARIO%>" class="mt-3 mb-3 btn btn-outline-primary btn-block">Nueva Categoria</a>
	
	
	<div class="row">
		<div class="col">
			<h1>Categorias</h1>
			<ul class="list-group">
	  			<c:forEach items="${categorias}" var="v" >	  
  				  	<li class="list-group-item">
				  		<a href="backoffice/categoria?op=<%=CategoriaController.OP_DETALLE%>&id=${v.id}">
				  			<p class="h3">${v.nombre}</p>
				  		</a>				  			
				  							  		
				  	</li>					
				</c:forEach>
			</ul>		
		</div>
		
		
		
		
	</div>
	
	
<%@include file="../../includes/footer.jsp"%>