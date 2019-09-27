<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

	<h1>Ejemplo Servlet Basico sin JSP</h1>
	<p>Vamos a crear un servlet para mostrar la REQUEST y RESPONSE</p>
	<p>El Servlet será el encargado de pintar la respuesta a pelo, sin usar una JSP.</p>
	
	<a class="btn btn-primary btn-block mb-2" href="controlador1">PETICION GET</a>
	
	
	<a class="btn btn-primary btn-block mb-2" href="controlador1?param1=value1&param2=foo&p3=manolito">PETICION GET con parametros</a>
	
	
	<a class="btn btn-danger btn-block" href="controladorNoExistente">PETICION GET - Response 404</a>
	

<%@include file="../includes/footer.jsp"%>