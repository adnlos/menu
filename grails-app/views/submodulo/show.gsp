
<%@ page import="menu.Submodulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'submodulo.label', default: 'Submodulo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-submodulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-submodulo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list submodulo">
			
				<g:if test="${submoduloInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="submodulo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${submoduloInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${submoduloInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="submodulo.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${submoduloInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${submoduloInstance?.funciones}">
				<li class="fieldcontain">
					<span id="funciones-label" class="property-label"><g:message code="submodulo.funciones.label" default="Funciones" /></span>
					
						<g:each in="${submoduloInstance.funciones}" var="f">
						<span class="property-value" aria-labelledby="funciones-label"><g:link controller="funcion" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${submoduloInstance?.imagen}">
				<li class="fieldcontain">
					<span id="imagen-label" class="property-label"><g:message code="submodulo.imagen.label" default="Imagen" /></span>
					
						<span class="property-value" aria-labelledby="imagen-label"><g:formatBoolean boolean="${submoduloInstance?.imagen}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${submoduloInstance?.modulo}">
				<li class="fieldcontain">
					<span id="modulo-label" class="property-label"><g:message code="submodulo.modulo.label" default="Modulo" /></span>
					
						<span class="property-value" aria-labelledby="modulo-label"><g:link controller="modulo" action="show" id="${submoduloInstance?.modulo?.id}">${submoduloInstance?.modulo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${submoduloInstance?.posicion}">
				<li class="fieldcontain">
					<span id="posicion-label" class="property-label"><g:message code="submodulo.posicion.label" default="Posicion" /></span>
					
						<span class="property-value" aria-labelledby="posicion-label"><g:fieldValue bean="${submoduloInstance}" field="posicion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${submoduloInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="submodulo.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${submoduloInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${submoduloInstance?.id}" />
					<g:link class="edit" action="edit" id="${submoduloInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
