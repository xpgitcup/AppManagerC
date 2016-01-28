
<%@ page import="cn.edu.cup.AppRoles" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'appRoles.label', default: 'AppRoles')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-appRoles" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                       <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                           </ul>
                           </div>
                           <div id="list-appRoles" class="content scaffold-list" role="main">
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table>
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="appRight" title="${message(code: 'appRoles.appRight.label', default: 'App Right')}" />
                                        
                                        <g:sortableColumn property="name" title="${message(code: 'appRoles.name.label', default: 'Name')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${appRolesInstanceList}" status="i" var="appRolesInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${appRolesInstance.id}">${fieldValue(bean: appRolesInstance, field: "appRight")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: appRolesInstance, field: "name")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="paginationGrails">
                            <g:paginate total="${appRolesInstanceCount ?: 0}" />
                        </div>
                        </div>
                        </body>
                        </html>
