
<%@ page import="cn.edu.cup.AppPrefix" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'appPrefix.label', default: 'AppPrefix')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-appPrefix" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                       <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                           </ul>
                           </div>
                           <div id="list-appPrefix" class="content scaffold-list" role="main">
                       <h1><g:message code="default.list.label" args="[entityName]" /></h1>
                        <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                        </g:if>
                        <table>
                            <thead>
                                <tr>
                                    
                                        <g:sortableColumn property="alias" title="${message(code: 'appPrefix.alias.label', default: 'Alias')}" />
                                        
                                        <g:sortableColumn property="prefix" title="${message(code: 'appPrefix.prefix.label', default: 'Prefix')}" />
                                        
                                </tr>
                            </thead>
                            <tbody>
                                <g:each in="${appPrefixInstanceList}" status="i" var="appPrefixInstance">
                                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                        
                                        <td><g:link action="show" id="${appPrefixInstance.id}">${fieldValue(bean: appPrefixInstance, field: "alias")}</g:link></td>
                                        
                                        <td>${fieldValue(bean: appPrefixInstance, field: "prefix")}</td>
                                        
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                        <div class="paginationGrails">
                            <g:paginate total="${appPrefixInstanceCount ?: 0}" />
                        </div>
                        </div>
                        </body>
                        </html>
