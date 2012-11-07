<%@ page import="menu.Modulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modulo.label', default: 'Modulo')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
		
		<script type="text/javascript">
			$(document).ready(function(){
				//$('#myform').validator();
				document.getElementById('modal').style.display='none';
				$('#open-modal').click(function(){
					$('#modal').dialog({
						title:'Agregar submodulos',
						height:450,
						width:900,
						draggable: true,
						resizable:false,
						position:'middle'
					});
				});

				$('#submodulo-grid').jqGrid({
					url: '${createLink(controller:'submodulo', action: 'listEditJSON')}',
					datatype: 'json',
					mtype: 'GET',
					colNames:['id', 'nombre', 'url', 'estado', 'posicion', 'imagen', 'modulo'],
					colModel:[
						{name:'id', index:'id', width:55, aling:'right'},
						{name:'nombre', index:'nombre', width:150},
						{name:'url', index:'url', width: 180},
						{name:'estado', index:'estado', width:100},
						{name:'posicion', index:'posicion', width:100},
						{name:'imagen', index:'imagen', width:100},
						{name:'modulo.nombre', index:'modulo.nombre', width:100}
					],
					pager: '#pager',
					rowNum:5,
					rowList:[5,10,20,30],
					sortname:'id',
					recordpos: 'left',
					sortorder:'desc',
					viewrecords: true,
					multiselect: true,
					gridview:true,
					caption: 'Submodulo'
				});
				//buscador
				$('#submodulo-grid').filterToolbar({});

				//Recupera elementos seleccionados
				$("#selectcheck").click( function() {
					var s;
					s = $("#submodulo-grid").jqGrid('getGridParam','selarrrow');
					alert(s);
				});
			});
		</script>
	</head>
	<body>
		<!--
		<a href="#create-modulo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
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
			</div>
		</div>
		<br><br>
		<div class="form">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:form name="myform" action="save" >
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
						<!--
						<li class="add">
						<g:link controller="submodulo" action="create" params="['modulo.id': moduloInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'submodulo.label', default: 'Submodulo')])}</g:link>
						</li>
						-->
						<li>
							<img id="open-modal" src="${resource(dir:'images', file:'buscar.png')}" alt="agregar submodulos" heignt="16px" width="16px">
						</li>
						</ul>
						<div id="modal">
							<table id="submodulo-grid"></table>
							<div id="pager"></div>
							<div class="navmenu">
								<div id="horizontalmenu">
									<div class="link">
										<a id="selectcheck" href="javascript:void(0)"><img src="${resource(dir:'images', file:'guardar.png')}" border="0" vspace="0" width="16" height="16" alt="Guardar" />Guardar</a>
									</div>
								</div>
							</div>
						</div>

					</p>

					<p>
						<label for="url">
							<g:message code="modulo.url.label" default="Url" />
							
						</label>
						<g:textField name="url" value="${moduloInstance?.url}"/>
					</p>
					<p>
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
					</p>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
