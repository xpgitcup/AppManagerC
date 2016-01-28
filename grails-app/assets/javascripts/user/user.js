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
    
    $('#normalAppViewPagination').pagination({
        layout:['list','sep','first','prev','sep','links','sep','next','last','sep'],
        displayMsg: '',
        onSelectPage: function (pageNumber, pageSize) {
            console.info(pageNumber);
            console.info(pageSize);
            $(this).pagination('loading');
            //alert('pageNumber:' + pageNumber + ',pageSize:' + pageSize);
            loadData(pageNumber, pageSize);
            $(this).pagination('loaded');
        }
    });
    //
    $('#normalAppViewPagination').pagination('select', 1); //缺省的状态，调出1页
    //
    $('#userAppViewPagination').pagination({
        layout:['list','sep','first','prev','sep','links','sep','next','last','sep'],
        displayMsg: '',
        onSelectPage: function (pageNumber, pageSize) {
            console.info(pageNumber);
            console.info(pageSize);
            $(this).pagination('loading');
            //alert('pageNumber:' + pageNumber + ',pageSize:' + pageSize);
            loadDataUser(pageNumber, pageSize);
            $(this).pagination('loaded');
        }
    });
    //
    $('#userAppViewPagination').pagination('select', 1); //缺省的状态，调出1页
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
    //调用testa--查询数据
    $.ajax({
        url: 'userAppManager/queryNormalApp',
        data: 'offset=' + offset + '&max=' + pageSize,
        success: function (data, textStatus) {
            $('#normalAppView').html(data);
            console.info(data);
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            console.info(XMLHttpRequest);
            console.info(textStatus);
            console.info(errorThrown);
        }
    });
}