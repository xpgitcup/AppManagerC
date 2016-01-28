
<%@ page import="cn.edu.cup.UserApp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <g:set var="entityName" value="${message(code: 'userApp.label', default: 'UserApp')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    <asset:javascript src="user/user.js"/>
</head>
<body>
    <a href="#list-userApp" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li>
                程序名称：${appName}
            </li>
            <li>
                日志文件：${log}:${logok}
            </li>
        </ul>
    </div>
    <div id="list-userApp" class="content scaffold-list" role="main">
        <table>
            <g:each in="${lines}" status="i" var="line">
                <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                    <td>${line}</td>
                </tr>
            </g:each>
        </table>
    </div>
</body>
</html>
