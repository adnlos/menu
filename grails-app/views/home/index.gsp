
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Index Home</title>
		<script type="text/javascript">
		$(document).ready(function(){
			$("#menujquery").menu();
		});
		</script>
		<style>
	    	.ui-menu { width: 150px; }
	    </style>
	</head>
	<body>
		<div>
			<ul id="menujquery">
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
		</div>
	</body>
</html>
