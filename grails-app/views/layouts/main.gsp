<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.9.0.custom.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'ui.jqgrid.css')}" type="text/css" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'form.css')}" type="text/css" />

		<g:javascript src="jquery-1.7.2.min.js"/>
		<g:javascript src="i18n/grid.locale-es.js"/>
		<g:javascript src="jquery.jqGrid.min.js"/>
		<g:javascript src="jquery.tools.min.js"/>
		<g:javascript src="jquery-ui-1.9.0.custom.js"/>
		<g:layoutHead/>
        <r:layoutResources />
	</head>
	
	<body>
		<header>
			<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
			<ul id="menu">
				<!--Modulo-->
				<g:each in="${menu.Modulo?.list()}" status="i" var="moduloInstance">
					<g:if test="${moduloInstance.estado == 'Activo'}">
						<li>
							<g:if test="${moduloInstance.imagen == true}">
								<g:link class="selected" uri="${moduloInstance.url}">${fieldValue(bean:moduloInstance , field: "nombre")} <img  src="${resource(dir: 'images', file: 'menu_down.png')}" /></g:link>
							</g:if>
							<g:else>
								<g:link class="selected" uri="${moduloInstance.url}">${fieldValue(bean:moduloInstance , field: "nombre")}</g:link>
							</g:else>
							<ul>
								<!-- Submodulo -->
								<g:each in="${menu.Submodulo.list().sort {it.posicion}}" status="i1" var="submoduloInstance">
									<g:if test="${submoduloInstance.modulo.id == moduloInstance.id}">
										<li>
											<g:if test="${submoduloInstance.imagen == true}">
												<g:link uri="${submoduloInstance.url}">${fieldValue(bean: submoduloInstance, field: "nombre")} <img  src="${resource(dir: 'images', file: 'menu_left.png')}" /></g:link>
											</g:if>
											<g:else>
												<g:link uri="${submoduloInstance.url}">${fieldValue(bean: submoduloInstance, field: "nombre")}</g:link>
											</g:else>
											<ul>
												<!--Funciones-->
												<g:each in="${submoduloInstance?.funciones?.sort{it.posicion}}" status="i3" var="funcionesSubmodulo" >
													<li>
														<g:link uri="${funcionesSubmodulo.url}">${fieldValue(bean: funcionesSubmodulo, field: "nombre")}</g:link>
													</li>
												</g:each>
											</ul>
										</li>
									</g:if>
								</g:each>
							</ul>
						</li>
					</g:if>
				</g:each>
			</ul>
		</header>
		<div id="contenido">
			<g:layoutBody/>
		</div>
		<footer class="footer">
			Alargando la sombra de las 6
		</footer>
		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		<g:javascript library="application"/>
        <r:layoutResources />
	</body>
</html>