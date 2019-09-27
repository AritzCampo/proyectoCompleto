<%@page import="com.ipartek.formacion.controller.backoffice.UsuarioController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>



	<h1>MIGRACION</h1>
	<BR>
	<BR>
	
	
	<h2>LINEAS LEIDAS ${leidas}</h2>
	<h2>LINEAS INSERTADAS ${insertadas}</h2>
	<h2>LINEAS ERRONEAS  ${error}</h2>
	
	
	
<!-- 	<ul class="list-group">
	  			<c:forEach items="${usuarios}" var="v" >	  
  				  	<li class="list-group-item">
  				  	
  				  	    <p>${v}</p>
				  			  		
				  	</li>					
		  	  
				</c:forEach>
			</ul>	
	
	
	 -->
	
	
<%@include file="../../includes/footer.jsp"%>