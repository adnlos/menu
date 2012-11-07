
<%@ page import="menu.Funcion" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'funcion.label', default: 'Funcion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-funcion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-funcion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'funcion.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'funcion.estado.label', default: 'Estado')}" />
					
						<g:sortableColumn property="posicion" title="${message(code: 'funcion.posicion.label', default: 'Posicion')}" />
					
						<th><g:message code="funcion.submodulo.label" default="Submodulo" /></th>
					
						<g:sortableColumn property="url" title="${message(code: 'funcion.url.label', default: 'Url')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${funcionInstanceList}" status="i" var="funcionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${funcionInstance.id}">${fieldValue(bean: funcionInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: funcionInstance, field: "estado")}</td>
					
						<td>${fieldValue(bean: funcionInstance, field: "posicion")}</td>
					
						<td>${fieldValue(bean: funcionInstance, field: "submodulo")}</td>
					
						<td>${fieldValue(bean: funcionInstance, field: "url")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${funcionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
