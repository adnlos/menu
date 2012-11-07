
<%@ page import="menu.Submodulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'submodulo.label', default: 'Submodulo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		<script type="text/javascript">
			$(document).ready(function(){
				//Tabs
				$("#tabs").tabs();

				//Grid submodulo
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
					gridview:true,
					caption: 'Submodulo'
				});
				//buscador
				$('#submodulo-grid').filterToolbar({});
			});
		</script>
	</head>
	<body>
		<div id="tabs">
		    <ul>
		        <li><a href="#tabs-1">Lista Submenu</a></li>
		        <li><a href="#tabs-2">Nuevo Submenu</a></li>
		    </ul>
		    <div id="tabs-1">
		    	<div class="navmenu">
				<div id="horizontalmenu">
					<div class="link">
							<a href="${createLink(uri: '/')}"><img src="${resource(dir:'images', file:'home.png')}" border="0" alt="Home" vspace="0" width="16" height="16" align="absbottom" /><g:message code="default.home.label"/></a>
					</div>
					<div class="link">
						<g:link class="create" action="create"><img src="${resource(dir:'images', file:'new.png')}" border="0" vspace="0" width="16" height="16" align="absbottom" alt="Nuevo" /><g:message code="default.new.label" args="[entityName]" /></g:link>
					</div>
					<div class="link">
						<a id="a1" href="/menu/modulo/edit/"><img src="${resource(dir:'images', file:'edit.png')}" border="0" vspace="0" width="16" height="16" align="absbottom" alt="Editar" />Editar</a>
					</div>
					<div class="link"><a id="a2" href="#"><img src="${resource(dir:'images', file:'delete.png')}" border="0" vspace="0" width="16" height="16" align="absbottom" alt="Eliminar" />Eliminar</a>
					</div>
				</div>
				<br><br>
				<div>
			        <table id="submodulo-grid"></table>
					<div id="pager"></div>
			    </div>
			</div>
		    <div id="tabs-2">
		        <div class="form">
		        	
				</div>
		    </div>
	</body>
</html>
