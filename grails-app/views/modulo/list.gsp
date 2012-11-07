
<%@ page import="menu.Modulo" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'modulo.label', default: 'Modulo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

		<script type="text/javascript">
			$(document).ready(function(){
				$('#modulo-grid').jqGrid({
					url: '${createLink(action: 'listJSON')}',
					datatype: 'json',
					mtype: 'GET',
					colNames:['id', 'nombre', 'url', 'estado', 'posicion', 'imagen'],
					colModel:[
						{name:'id', index:'id', width:55, aling:'right'},
						{name:'nombre', index:'nombre', width:150},
						{name:'url', index:'url', width: 180},
						{name:'estado', index:'estado', width:100},
						{name:'posicion', index:'posicion', width:100},
						{name:'imagen', index:'imagen', width:100}
					],
					pager: '#pager',
					rowNum:5,
					rowList:[5,10,20,30],
					sortname:'id',
					sortorder:'desc',
					viewrecords: true,
					gridview:true,
					caption: 'Modulos'
				});

				
				$('#modulo-grid-edit').jqGrid({
					url:'${createLink(action:'listEditJSON')}',
					editurl:'${createLink(action:'updateJson')}',
					datatype: 'json',
					mytype: 'GET',
					colNames:['id', 'nombre', 'url', 'estado', 'posicion', 'imagen'],
					colModel:[
						{name:'id', index:'id', width:55, aling:'right'},
						{name:'nombre', editable:true, index:'nombre', width:150},
						{name:'url', editable:true, index:'url', width: 180},
						{name:'estado', editable:true, edittype:"select", editoptions:{value:"Activo:Activo;Inactivo:Inactivo"}, index:'estado', width:100},
						{name:'posicion', editable:true, index:'posicion', width:100},
						{name:'imagen', editable:true, edittype:'checkbox', index:'imagen', width:100}
					],
					pager:'#pager-edit',
					rowNum: 5,
					rowList: [5, 10, 20, 30],
					sortname: 'id',
					sortorder: 'desc',
					viewrecords: true,
					gridview: true,
					caption: 'Equipos'
				});

				jQuery('#modulo-grid-edit').jqGrid('navGrid', '#pager-edit', 
				  { view: true, edit: true, add: true, del: true, search: false }, 
				  {}, // use default settings for edit
				  {url:'${createLink(action: 'saveJson')}'}, // use default settings for add
				  {url:'${createLink(action: 'deleteJson')}'},  // delete instead that del:false we need this
				  {});

				jQuery('#modulo-grid-edit').filterToolbar({});

				//Boton editar
				$("#a1").click( function(){
					var id = jQuery("#modulo-grid").jqGrid('getGridParam','selrow');
					if (id)	{
						var ret = jQuery("#modulo-grid").jqGrid('getRowData',id);
						var link = $(this).attr("href");
						url = link + ret.id;
						window.open(url, "_self");
					} else { 
						alert("selecciona una fila");
					}
					return false;
				});

				//Boton eliminar
				$("#a2").click( function(){
					alert('eliminar');
					var id = jQuery("#modulo-grid").jqGrid('getGridParam','selrow');
					if (id)	{
						var ret = jQuery("#modulo-grid").jqGrid('getRowData',id);
						var idParam = ret.id
						alert('ret.id: ' + ret.id);
						var su=jQuery("#modulo-grid").jqGrid('delRowData',idParam);
						if(su) alert("Eliminado!!"); else alert("No se pudo eliminar");
						var link = $(this).attr("href");
						url:'${createLink(action: 'delete')}';
					} else { 
						alert("selecciona una fila");
					}
				});

			});

		</script>
	</head>
	<body>
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
		</div>
		<br><br>
		<div class="list">
			<table id="modulo-grid"></table>
			<div id="pager"></div>
			<table id="modulo-grid-edit"></table>
			<div id="pager-edit"></div>	
		</div>
	</body>
</html>