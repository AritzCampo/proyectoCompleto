<%@page import="com.ipartek.formacion.controller.backoffice.VideoController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>

	<h1>Detalle Video</h1>
	
	<div class="row">
		<div class="col">
		
			<%@include file="../../includes/mensaje.jsp"%>
			
			<form action="backoffice/videos" method="post" class="mb-2">
			
				<input type="hidden" name="op" value="<%=VideoController.OP_GUARDAR%>">
			
				<div class="form-group">	
					<label for="id">Id:</label>
					<input type="text" name="id" value="${video.id}" readonly class="form-control">
				</div>
				
				<div class="form-group">
					<label for="nombre">Nombre:</label>
					<input type="text" name="nombre" value="${video.nombre}"
					       placeholder="Mínimio 3 máximo 150"
					       class="form-control">
				</div>
				
				<div class="form-group">
					<label for="codigo">Codigo:</label>
					<input type="text" name="codigo" value="${video.codigo}"
					       placeholder="Exactamente 11" 
						   class="form-control">
				</div>	
				
				<div class="form-group">
					<label for="categoria_id">Categoria:</label>
					<select name="categoria_id" id="categoria_id" class="form-control">
					  <c:forEach items="${categorias}" var="c">
					  		<option value="${c.id}" ${(c.id == video.categoria.id)?"selected":"" }> ${c.nombre}</option>					  	
					  </c:forEach>				  
					</select>
				</div>	
								
				<div class="form-group">
					<label for="usuario_id">Usuario:</label>
					<select name="usuario_id" id="usuario_id" class="form-control">
					
						<c:forEach items="${usuarios}" var="u">		
							<% //modificar video %>
							<c:if test="${video.id != -1}">				  				  
						  			<option value="${u.id}" ${(u.id == video.usuario.id)?"selected":"" }> ${u.nombre}</option>					  		
						  	</c:if>	
					  
						    <% //nuevo video %>
						 	<c:if test="${video.id == -1}">					  						  
						  			<option value="${u.id}" ${(u.id == sessionScope.usuario.id)?"selected":"" }> ${u.nombre}</option>					  		
						  	</c:if>
					   </c:forEach>
					  
					  				  
					</select>
				</div>	
			
				<input type="submit" value="${(video.id != -1)?'Modificar':'Crear'}" class="btn btn-outline-primary  btn-block">
			
			</form>
			
			<c:if test="${video.id != -1}">
			
				
				<!-- Button trigger modal -->
				<button type="button" class="btn btn-outline-danger btn-block" data-toggle="modal" data-target="#exampleModal">
				  Eliminar
				</button>
		
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">¿Estas Seguro de ELIMINAR el registro?</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <p>Cuidado porque operación no es reversible</p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        	<form action="backoffice/videos" method="post">	
							<input type="hidden" name="op" value="<%=VideoController.OP_ELIMINAR%>">
							<input type="hidden" name="id" value="${video.id}" readonly>			
							<input type="submit" value="Eliminar" class="btn btn-danger btn-block">	
						</form>
				      </div>
				    </div>
				  </div>
				</div>
				
				
			</c:if>	
			
			
			
			
			
			
			
			
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