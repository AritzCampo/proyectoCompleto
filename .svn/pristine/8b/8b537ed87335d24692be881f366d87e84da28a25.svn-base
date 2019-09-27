<%@page import="com.ipartek.formacion.controller.frontoffice.MisVideosController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

	<h1>Detalle Video</h1>
	
	<div class="row">
		<div class="col">
		
			<%@include file="../../includes/mensaje.jsp"%>
			
			<form action="frontoffice/videos" method="post" class="mb-2">
			
				<input type="hidden" name="op" value="<%=VideoController.OP_GUARDAR%>">
				<input type="hidden" name="id" value="${video.id}">
				
				<div class="form-group">
					<label for="nombre">Nombre:</label>
					<input type="text" name="nombre" value="${video.nombre}"
					       placeholder="Mínimio 3 máximo 150"
					       class="form-control"
					       readonly>
				</div>
				
				<div class="form-group">
					<label for="codigo">Codigo:</label>
					<input type="text" name="codigo" value="${video.codigo}"
					       placeholder="Exactamente 11" 
						   class="form-control"
						   readonly>
				</div>	
				
				<div class="form-group">
					<label for="likes">Likes recibidos:</label>
					<input type="text" name="likes" value="${video.likes}"
						class="form-control"
						readonly>
				</div>
				
				<div class="form-group">
					<label for="categoria">Categoria:</label>
					<input type="text" name="categoria" value="${video.categoria.nombre}"
						class="form-control"
						readonly>
				</div>
			</form>			
		</div>
		
		<div class="col">	
		
			<div class="embed-responsive embed-responsive-16by9">
		
				<iframe class="embed-responsive-item"
				        src="https://www.youtube.com/embed/${video.codigo}" 
				        frameborder="0" 
				        allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" 
				        allowfullscreen></iframe>
			</div>        
		</div>
	</div>
	
<%@include file="../../includes/footer.jsp"%>