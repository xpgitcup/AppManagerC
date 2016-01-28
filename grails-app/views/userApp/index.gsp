
<%@ page import="cn.edu.cup.UserApp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'userApp.label', default: 'UserApp')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-userApp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                       <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                           </ul>
                           </div>
                           <div id="list-userApp" class="content scaffold-list" role="main">
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table>
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="appName" title="${message(code: 'userApp.appName.label', default: 'App Name')}" />
                                        
                                        <g:sortableColumn property="appPath" title="${message(code: 'userApp.appPath.label', default: 'App Path')}" />
                                        
                                    <th><g:message code="userApp.appPrefix.label" default="App Prefix" /></th>
                                        
                                        <g:sortableColumn property="date" title="${message(code: 'userApp.date.label', default: 'Date')}" />
                                        
                                    <th><g:message code="userApp.appRoles.label" default="App Roles" /></th>
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${userAppInstanceList}" status="i" var="userAppInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${userAppInstance.id}">${fieldValue(bean: userAppInstance, field: "appName")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: userAppInstance, field: "appPath")}</td>
                                        
                                        <td>${fieldValue(bean: userAppInstance, field: "appPrefix")}</td>
                                        
                                        <td><g:formatDate date="${userAppInstance.date}" /></td>
                                        
                                        <td>${fieldValue(bean: userAppInstance, field: "appRoles")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="paginationGrails">
                            <g:paginate total="${userAppInstanceCount ?: 0}" />
                        </div>
                        </div>
                        </body>
                        </html>
