<%@include file="includes/header.jsp"%>
<%@include file="includes/navbar.jsp"%>
    
   	<h1>Login</h1>
   	
   	<%@include file="includes/mensaje.jsp"%>
   	
   	<div class="d-flex align-content-center">
   	
	   	<form action="login" method="post" class="">
	   		<div class="form-group">
	   			<input type="text" name="nombre" autofocus placeholder="Tu Nombre Usuario" class="form-control">
	   		</div>
	   		<div class="form-group">
	   			<input type="password" name="contrasenya" placeholder="Contraseña" class="form-control">
	   		</div>
	   		<input type="submit" value="Entrar" class="btn btn-block btn-primary">
	   	
	   	</form>
   	
   	</div>
    	    	
<%@include file="includes/footer.jsp"%>   