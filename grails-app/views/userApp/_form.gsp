<%@ page import="cn.edu.cup.UserApp" %>



<div class="fieldcontain ${hasErrors(bean: userAppInstance, field: 'appName', 'error')} required">
	<label for="appName">
		<g:message code="userApp.appName.label" default="App Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appName" required="" value="${userAppInstance?.appName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userAppInstance, field: 'appPath', 'error')} required">
	<label for="appPath">
		<g:message code="userApp.appPath.label" default="App Path" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="appPath" required="" value="${userAppInstance?.appPath}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userAppInstance, field: 'appPrefix', 'error')} ">
	<label for="appPrefix">
		<g:message code="userApp.appPrefix.label" default="App Prefix" />
		
	</label>
	<g:select id="appPrefix" name="appPrefix.id" from="${cn.edu.cup.AppPrefix.list()}" optionKey="id" value="${userAppInstance?.appPrefix?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userAppInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="userApp.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${userAppInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userAppInstance, field: 'appRoles', 'error')} ">
	<label for="appRoles">
		<g:message code="userApp.appRoles.label" default="App Roles" />
		
	</label>
	<g:select id="appRoles" name="appRoles.id" from="${cn.edu.cup.AppRoles.list()}" optionKey="id" value="${userAppInstance?.appRoles?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

