
<%@ page import="cn.edu.cup.AppPrefix" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'appPrefix.label', default: 'AppPrefix')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-appPrefix" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-appPrefix" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list appPrefix">
			
				<g:if test="${appPrefixInstance?.alias}">
				<li class="fieldcontain">
					<span id="alias-label" class="property-label"><g:message code="appPrefix.alias.label" default="Alias" /></span>
					
						<span class="property-value" aria-labelledby="alias-label"><g:fieldValue bean="${appPrefixInstance}" field="alias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appPrefixInstance?.prefix}">
				<li class="fieldcontain">
					<span id="prefix-label" class="property-label"><g:message code="appPrefix.prefix.label" default="Prefix" /></span>
					
						<span class="property-value" aria-labelledby="prefix-label"><g:fieldValue bean="${appPrefixInstance}" field="prefix"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${appPrefixInstance?.userApp}">
				<li class="fieldcontain">
					<span id="userApp-label" class="property-label"><g:message code="appPrefix.userApp.label" default="User App" /></span>
					
						<g:each in="${appPrefixInstance.userApp}" var="u">
						<span class="property-value" aria-labelledby="userApp-label"><g:link controller="userApp" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:appPrefixInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${appPrefixInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
