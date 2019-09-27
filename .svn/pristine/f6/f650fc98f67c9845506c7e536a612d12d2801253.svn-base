<%@page import="com.ipartek.formacion.controller.backoffice.RolController"%>
<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%> 
<%@include file="../../includes/mensaje.jsp"%>


<p class="bg-success">${roles}</p>


	<div class="row">
		<div class="col">
			<h1>LISTADO DE ROLES</h1>
			<ul class="list-group">
	  			<c:forEach items="${roles}" var="r" >	  
  				  	<li class="list-group-item">
				  		<p class="h3 text-justify">${r.id} - ${r.nombre}</p>				  		
				  	</li>
				</c:forEach>
			</ul>		
		</div>
	</div>

<%@include file="../../includes/footer.jsp"%>