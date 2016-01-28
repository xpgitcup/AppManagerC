<%@ page import="cn.edu.cup.AppRoles" %>



<div class="fieldcontain ${hasErrors(bean: appRolesInstance, field: 'appRight', 'error')} required">
	<label for="appRight">
		<g:message code="appRoles.appRight.label" default="App Right" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="appRight" type="number" value="${appRolesInstance.appRight}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: appRolesInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="appRoles.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${appRolesInstance?.name}"/>

</div>

