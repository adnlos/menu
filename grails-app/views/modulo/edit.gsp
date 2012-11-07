<%@ page import="menu.Modulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modulo.label', default: 'Modulo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'form.css')}" type="text/css">
	</head>
	<body>
		<!--
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		-->
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
		<div class="form">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:form method="post" name="myform" >
				<g:hiddenField name="id" value="${moduloInstance?.id}" />
				<g:hiddenField name="version" value="${moduloInstance?.version}" />
				<fieldset>
					<p>
						<label for="nombre">
							<g:message code="modulo.nombre.label" default="Nombre" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="nombre" required="required" value="${moduloInstance?.nombre}"/>
					</p>
					<p>
						<label for="estado">
							<g:message code="modulo.estado.label" default="Estado" />
							<span class="required-indicator">*</span>
						</label>
						<g:select name="estado" from="${moduloInstance.constraints.estado.inList}" required="required" value="${moduloInstance?.estado}" valueMessagePrefix="modulo.estado"/>
					</p>

					<p>
						<label for="imagen">
							<g:message code="modulo.imagen.label" default="Imagen" />
						</label>
						<g:checkBox name="imagen" value="${moduloInstance?.imagen}" />
					</p>

					<p>
						<label for="posicion">
							<g:message code="modulo.posicion.label" default="Posicion" />
						</label>
						<g:textField name="posicion" value="${moduloInstance?.posicion}"/>
					</p>
					<p>
						<label for="submodulos">
							<g:message code="modulo.submodulos.label" default="Submodulos" />	
						</label>
						
						<ul class="one-to-many">
						<g:each in="${moduloInstance?.submodulos?}" var="s">
						    <li><g:link controller="submodulo" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
						</g:each>
						<li class="add">
						<g:link controller="submodulo" action="create" params="['modulo.id': moduloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'submodulo.label', default: 'Submodulo')])}</g:link>
						</li>
						</ul>
					</p>
					<p>
						<label for="url">
							<g:message code="modulo.url.label" default="Url" />
						</label>
						<g:textField name="url" value="${moduloInstance?.url}"/>
					</p>
					<p>
						<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" />
					</p>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
