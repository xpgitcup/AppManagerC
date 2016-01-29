
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
    <!--顶部按钮-->
    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li>
                <g:link class="create" action="scanWebApp" controller="userAppManager">
                    刷新
                </g:link>
            </li>
            <li>
                <a class="edit" href="appRoles/index">程序类型编辑</a>
            </li>
            <li class="info">
                ${ip}
            </li>
        </ul>
    </div>
    <!--主体显示区-->
    <div class="hidden" id="appList">${apps}</div>
    <div id="list-userApp" class="content scaffold-list" role="main">
        <div id="appTabs" class="easyui-tabs" style="width:100%">   
        <g:each in="${apps}" status="i" var="app">
            <div title="${app.key}" style="padding:20px">   
                <div id="appView${app.key}"></div>
                <div class="easyui-panel">
                    <div id="appViewPagination${i}" 
                         class="easyui-pagination" 
                         data-options="total:${app.value}, 
                         pageSize:10, 
                         onSelectPage: function (pageNumber, pageSize) {
                         console.info(pageNumber);
                         console.info(pageSize);
                         $(this).pagination('loading');
                         //alert('pageNumber:' + pageNumber + ',pageSize:' + pageSize);
                         loadData(pageNumber, pageSize);
                         $(this).pagination('loaded');
                         }">
                </div>
            </div>
        </div>   
    </g:each>
</div>             
</div>
</body>
</html>
