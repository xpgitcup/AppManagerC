
<%@ page import="cn.edu.cup.UserApp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userApp.label', default: 'UserApp')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userApp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userApp" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userApp">
			
				<g:if test="${userAppInstance?.appName}">
				<li class="fieldcontain">
					<span id="appName-label" class="property-label"><g:message code="userApp.appName.label" default="App Name" /></span>
					
						<span class="property-value" aria-labelledby="appName-label"><g:fieldValue bean="${userAppInstance}" field="appName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userAppInstance?.appPath}">
				<li class="fieldcontain">
					<span id="appPath-label" class="property-label"><g:message code="userApp.appPath.label" default="App Path" /></span>
					
						<span class="property-value" aria-labelledby="appPath-label"><g:fieldValue bean="${userAppInstance}" field="appPath"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userAppInstance?.appPrefix}">
				<li class="fieldcontain">
					<span id="appPrefix-label" class="property-label"><g:message code="userApp.appPrefix.label" default="App Prefix" /></span>
					
						<span class="property-value" aria-labelledby="appPrefix-label"><g:link controller="appPrefix" action="show" id="${userAppInstance?.appPrefix?.id}">${userAppInstance?.appPrefix?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userAppInstance?.date}">
				<li class="fieldcontain">
					<span id="date-label" class="property-label"><g:message code="userApp.date.label" default="Date" /></span>
					
						<span class="property-value" aria-labelledby="date-label"><g:formatDate date="${userAppInstance?.date}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userAppInstance?.appRoles}">
				<li class="fieldcontain">
					<span id="appRoles-label" class="property-label"><g:message code="userApp.appRoles.label" default="App Roles" /></span>
					
						<span class="property-value" aria-labelledby="appRoles-label"><g:link controller="appRoles" action="show" id="${userAppInstance?.appRoles?.id}">${userAppInstance?.appRoles?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userAppInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userAppInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
