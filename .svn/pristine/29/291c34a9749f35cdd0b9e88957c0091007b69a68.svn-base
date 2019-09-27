<%@page import="com.ipartek.formacion.controller.backoffice.UsuarioController"%>

<%@include file="../../includes/header.jsp"%>
<%@include file="../../includes/navbar.jsp"%>



	<h1>Listado Usuarios</h1>
	
	
	<%@include file="../../includes/mensaje.jsp"%>
			
	
	<a href="backoffice/usuario?op=<%=UsuarioController.OP_NUEVO%>" class="mb-3 btn btn-outline-primary">Nuevo Usuario</a>
	<a href="backoffice/rol" class="mb-3 btn btn-outline-primary">GESTIONAR ROLES</a>
	
	
	<form action="backoffice/usuario">
		
		
			
		
		<div class="form-row">
		    <div class="col-4">
		      <input type="search" name="nombreBuscar" class="form-control" placeholder="Buscar por Nombre" required>
		      <input type="hidden" name="op" value="<%=UsuarioController.OP_BUSCAR%>">
		    </div>
	
		    <div class="col-4">
		      <button type="submit" class="btn btn-secondary">Filtrar</button>
		    </div>
	  	</div>
	</form>
	
	
	
	
	<div class="container mt-5 mb-3">
        

        <table id="usuarios" class="display" style="width:100%">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Rol</th>
                    <th>Fecha Alta</th>
                    <th>Dado De Baja</th>
                    <th>Total Vídeos</th>
                    <th>Total Likes</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${usuarios}" var="u">
	                <tr>
	                    <td>${u.id}</td>
	                    <td><a href="backoffice/usuario?op=<%=UsuarioController.OP_DETALLE%>&id=${u.id}">${u.nombre}</a></td>
	                    <td>${u.rol.nombre}</td>
	                    <td>
							<fmt:formatDate value="${u.fechaCreacion}" pattern="dd-MM-yyyy" />
						</td>
	                    <td>
							<c:if test="${not empty u.fechaEliminacion}">
								<i class="fas fa-check text-success"></i>
							</c:if>
						</td>
	                    <td>${u.totalVideos}</td>
	                    <td>${u.totalLikes}</td>
	                </tr>
	        	</c:forEach>
            </tbody>
            <tfoot>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Rol</th>
                    <th>Fecha Alta</th>
                    <th>Dado De Baja</th>
                    <th>Total Vídeos</th>
                    <th>Total Likes</th>
                </tr>
            </tfoot>
        </table>

    </div>
	
<%@include file="../../includes/footer.jsp"%>