<%@ page import="menu.Modulo" %>


<p>
	<label for="nombre">
		<g:message code="modulo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<input name="nombre" required="" value="${moduloInstance?.nombre}"/>
</p>

<div class="fieldcontain ${hasErrors(bean: moduloInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="modulo.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${moduloInstance.constraints.estado.inList}" required="" value="${moduloInstance?.estado}" valueMessagePrefix="modulo.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: moduloInstance, field: 'imagen', 'error')} ">
	<label for="imagen">
		<g:message code="modulo.imagen.label" default="Imagen" />
		
	</label>
	<g:checkBox name="imagen" value="${moduloInstance?.imagen}" />
</div>

<div class="fieldcontain ${hasErrors(bean: moduloInstance, field: 'posicion', 'error')} ">
	<label for="posicion">
		<g:message code="modulo.posicion.label" default="Posicion" />
		
	</label>
	<g:textField name="posicion" value="${moduloInstance?.posicion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: moduloInstance, field: 'submodulos', 'error')} ">
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

</div>

<div class="fieldcontain ${hasErrors(bean: moduloInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="modulo.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${moduloInstance?.url}"/>
</div>

