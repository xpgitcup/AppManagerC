<%@ page import="cn.edu.cup.AppPrefix" %>



<div class="fieldcontain ${hasErrors(bean: appPrefixInstance, field: 'alias', 'error')} required">
	<label for="alias">
		<g:message code="appPrefix.alias.label" default="Alias" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="alias" required="" value="${appPrefixInstance?.alias}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appPrefixInstance, field: 'prefix', 'error')} required">
	<label for="prefix">
		<g:message code="appPrefix.prefix.label" default="Prefix" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="prefix" required="" value="${appPrefixInstance?.prefix}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: appPrefixInstance, field: 'userApp', 'error')} ">
	<label for="userApp">
		<g:message code="appPrefix.userApp.label" default="User App" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${appPrefixInstance?.userApp?}" var="u">
    <li><g:link controller="userApp" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userApp" action="create" params="['appPrefix.id': appPrefixInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userApp.label', default: 'UserApp')])}</g:link>
</li>
</ul>


</div>

