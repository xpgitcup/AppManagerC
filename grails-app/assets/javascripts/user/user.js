/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    var apps = $("#appList").text();
    console.info(apps);
    var applist = eval(apps);
    console.info(applist);
    
});

function loadDataUser(pageNumber, pageSize) {
    console.info('loading...' + pageNumber);
    var offset = (pageNumber - 1) * pageSize;
    //调用testa--查询数据
    $.ajax({
        url: 'userAppManager/queryUserApp',
        data: 'offset=' + offset + '&max=' + pageSize,
        success: function (data, textStatus) {
            $('#userAppView').html(data);
            console.info(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
}

function loadData(pageNumber, pageSize) {
    console.info('loading...' + pageNumber);
    var offset = (pageNumber - 1) * pageSize;
    var tab = $("#appTabs");
    var role = tab.select().title;
    //调用testa--查询数据
    $.ajax({
        url: 'userAppManager/queryUserApp',
        data: 'offset=' + offset + '&max=' + pageSize + '&role=' + role,
        success: function (data, textStatus) {
            $('#appView').html(data);
            console.info(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
}