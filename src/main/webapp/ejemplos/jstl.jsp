<%@include file="../includes/header.jsp"%>
<%@include file="../includes/navbar.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<h1>JSTL - Java Servlet Tag Libraries</h1>
	
	<section class="p-3 mb-3 bg-light">
		<p>JavaServer Pages (JSP) es una tecnología que ayuda a los desarrolladores de software a crear páginas web dinámicas basadas en HTML y XML, entre otros tipos de documentos. JSP es similar a PHP, pero usa el lenguaje de programación Java.</p>
		<p class="">*recordar que hay que importar los taglibraries <code>taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core</code></p> 
		<a href="https://www.tutorialspoint.com/jsp/jsp_standard_tag_library.htm" target="_blank">Documentación y ejemplos</a>
	</section>
	
	
	<section class="p-3 mb-3 bg-light">
		<h2>&lt;c:foreach&gt;</h2>
		<p>Sirve para iterar sobre una coleccion sin tener que usar <code>&lt;% ...  %&gt;</code> scriplets</p>
		<p>usando EL con el <code>&dollar;{colores}</code> => ${colores}</p>
	
		<ol>
			<c:forEach items="${colores}" var="color">
				<li>${color}</li>
			</c:forEach>
		</ol>		
		
	</section>
	
	
	<c:if test="${isLunes}"><p>Hoy Es Lunes</p></c:if>
	<c:if test="${!isLunes}"><p>Hoy NO Es Lunes</p></c:if>
	


<%@include file="../includes/footer.jsp"%>