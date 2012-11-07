<%@ page import="menu.Submodulo" %>



<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="submodulo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${submoduloInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="submodulo.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${submoduloInstance.constraints.estado.inList}" required="" value="${submoduloInstance?.estado}" valueMessagePrefix="submodulo.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'funciones', 'error')} ">
	<label for="funciones">
		<g:message code="submodulo.funciones.label" default="Funciones" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${submoduloInstance?.funciones?}" var="f">
    <li><g:link controller="funcion" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="funcion" action="create" params="['submodulo.id': submoduloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'funcion.label', default: 'Funcion')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'imagen', 'error')} ">
	<label for="imagen">
		<g:message code="submodulo.imagen.label" default="Imagen" />
		
	</label>
	<g:checkBox name="imagen" value="${submoduloInstance?.imagen}" />
</div>

<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'modulo', 'error')} required">
	<label for="modulo">
		<g:message code="submodulo.modulo.label" default="Modulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="modulo" name="modulo.id" from="${menu.Modulo.list()}" optionKey="id" required="" value="${submoduloInstance?.modulo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'posicion', 'error')} ">
	<label for="posicion">
		<g:message code="submodulo.posicion.label" default="Posicion" />
		
	</label>
	<g:textField name="posicion" value="${submoduloInstance?.posicion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: submoduloInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="submodulo.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${submoduloInstance?.url}"/>
</div>

