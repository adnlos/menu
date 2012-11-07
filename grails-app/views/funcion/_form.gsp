<%@ page import="menu.Funcion" %>



<div class="fieldcontain ${hasErrors(bean: funcionInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="funcion.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${funcionInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionInstance, field: 'estado', 'error')} required">
	<label for="estado">
		<g:message code="funcion.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${funcionInstance.constraints.estado.inList}" required="" value="${funcionInstance?.estado}" valueMessagePrefix="funcion.estado"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionInstance, field: 'posicion', 'error')} ">
	<label for="posicion">
		<g:message code="funcion.posicion.label" default="Posicion" />
		
	</label>
	<g:textField name="posicion" value="${funcionInstance?.posicion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionInstance, field: 'submodulo', 'error')} required">
	<label for="submodulo">
		<g:message code="funcion.submodulo.label" default="Submodulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="submodulo" name="submodulo.id" from="${menu.Submodulo.list()}" optionKey="id" required="" value="${funcionInstance?.submodulo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: funcionInstance, field: 'url', 'error')} ">
	<label for="url">
		<g:message code="funcion.url.label" default="Url" />
		
	</label>
	<g:textField name="url" value="${funcionInstance?.url}"/>
</div>

