<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

	<h1>Ejemplo Servlet Basico con JSP</h1>
	<p>Hacemos una peticion GET a traves del enlace (botón) de abajo.</p>
	<p>Cuando recibe la peticion el servlet realizar una request internar a esta misma jps, pasandole dos atributos.</p>
	
	
	<a href="useragent" class="btn btn-outline-primary">Detectar Nagevador que estas usando</a>
	
	<h2>Respuesta</h2>
	<p>${navegador}</p>
	<p>${movil}</p>
	

<%@include file="../includes/footer.jsp"%>