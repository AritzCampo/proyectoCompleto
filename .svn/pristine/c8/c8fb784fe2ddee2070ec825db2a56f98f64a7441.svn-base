<%@page isErrorPage="true" %>
<%@include file="includes/header.jsp"%>
<%@include file="includes/navbar.jsp"%>
    
	    	
    	<div class="jumbotron mt-4">
		  <h1 class="display-4">Error 500</h1>
		  <p class="lead">Lo sentimos pero parece que hay algun problema.</p>		  
		  <a href="mailto:formacion@ipartek.com" class="btn btn-primary btn-lg" href="#" role="button">Mandanos un email por favor</a>
		</div>
	    	    	
	    <div class="p-2 border border-danger">
	    	<h2>Usar solo en Desarrollo</h2>	    	
		    <p class="text-danger"><%=exception%></p>    
		    <!-- Stack trace -->
			<jsp:scriptlet>
			  exception.printStackTrace(new java.io.PrintWriter(out));
			</jsp:scriptlet>
		</div>
    	    	
<%@include file="includes/footer.jsp"%>