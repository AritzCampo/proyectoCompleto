<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

	<h1>Ejemplo Servlet GET y POST</h1>
	
	
	<h2>Ejemplo GET</h2>
	<p>El método GET solicita una representación del recurso especificado. Las solicitudes que usan GET solo deben recuperar datos y no deben tener ningún otro efecto. Sirven para solicitar datos al servidor.</p>
	<p>Si escribimos la url en el navegador es GET, si pulsamos un enlace con la etiqueta <code>a</code> es GET, un formulario tambien puede ser GET.</p>
	
	<a href="getpost?nombre=Manolo" class="btn btn-outline-primary">Peticion GET getpost?nombre=Manolo</a>
	
	
	<h2>Ejemplo POST</h2>
	<p>Envía los datos para que sean procesados por el recurso identificado. Los datos se incluirán en el cuerpo de la petición. Esto puede resultar en la creación de un nuevo recurso o de las actualizaciones de los recursos existentes o ambas cosas.</p>
	<p>Siempre se envia mediante una etiqueta <code>form</code> con el <code>method="post"</code></p>
	<form action="getpost" method="post">	
		<input type="text" name="nombre" placeholder="Dime tu nombre" required>
		<br>
		<input type="submit" value="Enviar">	
	</form>	


<%@include file="../includes/footer.jsp"%>