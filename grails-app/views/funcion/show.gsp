
<%@ page import="menu.Funcion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funcion.label', default: 'Funcion')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-funcion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-funcion" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list funcion">
			
				<g:if test="${funcionInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="funcion.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${funcionInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="funcion.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${funcionInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionInstance?.posicion}">
				<li class="fieldcontain">
					<span id="posicion-label" class="property-label"><g:message code="funcion.posicion.label" default="Posicion" /></span>
					
						<span class="property-value" aria-labelledby="posicion-label"><g:fieldValue bean="${funcionInstance}" field="posicion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionInstance?.submodulo}">
				<li class="fieldcontain">
					<span id="submodulo-label" class="property-label"><g:message code="funcion.submodulo.label" default="Submodulo" /></span>
					
						<span class="property-value" aria-labelledby="submodulo-label"><g:link controller="submodulo" action="show" id="${funcionInstance?.submodulo?.id}">${funcionInstance?.submodulo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${funcionInstance?.url}">
				<li class="fieldcontain">
					<span id="url-label" class="property-label"><g:message code="funcion.url.label" default="Url" /></span>
					
						<span class="property-value" aria-labelledby="url-label"><g:fieldValue bean="${funcionInstance}" field="url"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${funcionInstance?.id}" />
					<g:link class="edit" action="edit" id="${funcionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
