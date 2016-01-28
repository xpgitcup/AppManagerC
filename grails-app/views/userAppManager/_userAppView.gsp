<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<table>
    <thead>
        <tr>
            <g:sortableColumn property="appName" title="${message(code: 'userApp.appName.label', default: 'App Name')}"/>
            <th>外网地址</th>
            <g:sortableColumn property="appPath" title="${message(code: 'userApp.appPath.label', default: 'App Path')}" />
            <th>操作</th>
            <th>Debug</th>
        </tr>
    </thead>
    <tbody>
        <g:each in="${userAppInstanceList}" status="i" var="userAppInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                <td>
                    <a href="${userAppInstance.appPrefix.prefix}${userAppInstance.appPath}">${userAppInstance.appName}</a>
                </td>
                <td>
                    <a href="${userAppInstance.appPrefix.internetPrefix}${userAppInstance.appPath}">${userAppInstance.appName}</a>
                </td>
                <td>${fieldValue(bean: userAppInstance, field: "appPath")}</td>
                <td>
                    <g:link action="edit" id="${userAppInstance.id}" controller="userApp">
                        编辑
                    </g:link>
                </td>
                <td>
                    <g:link action="showLogs" id="${userAppInstance.id}" controller="userAppManager">
                        Debug
                    </g:link>
                </td>
            </tr>
        </g:each>
    </tbody>
</table>

