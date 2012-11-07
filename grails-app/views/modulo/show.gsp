
<%@ page import="menu.Modulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modulo.label', default: 'Modulo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navmenu">
			<div id="horizontalmenu">
				<div class="link">
						<a href="${createLink(uri: '/')}"><img src="${resource(dir:'images', file:'home.png')}" border="0" alt="Home" vspace="0" width="16" height="16" align="absbottom" /><g:message code="default.home.label"/></a>
				</div>
				<div class="link">
					<g:link action="list"><img src="${resource(dir:'images', file:'list.png')}" border="0" vspace="0" width="16" height="16" align="absbottom" alt="Lista" /><g:message code="default.list.label" args="[entityName]" /></g:link>
				</div>
				<div class="link">
					<g:link class="create" action="create"><img src="${resource(dir:'images', file:'new.png')}" border="0" vspace="0" width="16" height="16" align="absbottom" alt="Nuevo" /><g:message code="default.new.label" args="[entityName]" /></g:link>
				</div>
			</div>
		</div>
		<br><br>
		
		<div id="show-modulo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list modulo">
			
				<g:if test="${moduloInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="modulo.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${moduloInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="modulo.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${moduloInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.imagen}">
				<li class="fieldcontain">
					<span id="imagen-label" class="property-label"><g:message code="modulo.imagen.label" default="Imagen" /></span>
					
						<span class="property-value" aria-labelledby="imagen-label"><g:formatBoolean boolean="${moduloInstance?.imagen}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.posicion}">
				<li class="fieldcontain">
					<span id="posicion-label" class="property-label"><g:message code="modulo.posicion.label" default="Posicion" /></span>
					
						<span class="property-value" aria-labelledby="posicion-label"><g:fieldValue bean="${moduloInstance}" field="posicion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.submodulos}">
				<li class="fieldcontain">
					<span id="submodulos-label" class="property-label"><g:message code="modulo.submodulos.label" default="Submodulos" /></span>
					
						<g:each in="${moduloInstance.submodulos}" var="s">
						<span class="property-value" aria-labelledby="submodulos-label"><g:link controller="submodulo" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${moduloInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="modulo.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${moduloInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${moduloInstance?.id}" />
					<g:link class="edit" action="edit" id="${moduloInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
