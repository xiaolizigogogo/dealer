// JavaScript Document
$(function () {
    post = function (URL, PARAMS) {
        var temp = document.createElement("form");
        temp.action = URL;
        temp.method = "post";
        temp.style.display = "none";
        for (var x in PARAMS) {
            var opt = document.createElement("textarea");
            opt.name = x;
            opt.value = PARAMS[x];
            temp.appendChild(opt);
        }
        document.body.appendChild(temp);
        temp.submit();
    };
    /*Ajax Post Async */
    ajaxAsync = function (posturl, data, callback) {
        $.ajax({
            url: posturl,
            type: "POST",
            async: false,
            data: data,
            error: function () {
            },
            success: callback
        });
    };
    /*Ajax Post Sync */
    ajaxSync = function (posturl, data, callback) {
        $.ajax({
            url: posturl,
            type: "POST",
            async: false,
            data: data,
            error: function () {
            },
            success: callback
        });
    };

    paging= function (posturl, data, writetablefn, tc, colspan) {
        indata = data;
        inposturl = posturl;
        inwritetablefn = writetablefn;
        vcolspan = colspan;
        curPage = data.currentPage;
        tbodyContext = tc;
        ajaxAsync(posturl, data, function (da) {
            if ("1" == da) {

            } else {
                if (da && da.dataList && da.dataList.length > 0) {
                    var trContent = "";
                    $.each(da.dataList, function (i, commondata) {
                        trContent += writetablefn(commondata);
                    });
                    $("#" + tbodyContext).html(trContent);
                    totalPage = da.totalPage;
                    curPage = da.currentPage;
                    totalRecord = da.totalRecord;
                    pageSize = da.pageSize;
                    if(totalRecord==0){
                    	$("#" + tbodyContext).html("<div class='no-data' align='center'>暂无数据</div>");
                    }else{
                    	initPage();
                    }
                } else {
                    if (colspan)
                        $("#" + tbodyContext).html("<tr class='no-data'><td colspan='" + vcolspan + "' align='center'>暂无数据</td></tr>");
                    else
                        $("#" + tbodyContext).html("<div class='no-data' align='center'>暂无数据</div>");
                    totalPage = '1';
                    curPage = '1';
                    totalRecord = '0';
                    initPage(); // 重新显示分页栏

                }
            }
        })
    };
      
    initPage = function () {
        var pageHtml = "<div class=\"pages-area clearfix\"><div class=\"pages-total\">每页显示" + pageSize + "条，共" + totalRecord + "条</div>";
        pageHtml += "<form class= 'form-inline'><div class = 'input-group'><input type = 'text' id=\"goNum\" value=\"" + curPage + "\" class= 'form-control input-sm' size = '2'><span class= 'input-group-btn'><a href=\"javascript:submitPage($('#goNum').val());\" class=\"btn btn-sm btn-default\">转到</a></span></div></form>";
        pageHtml += "<ul class=\"pagination pagination-sm mar-r-20\">";
        if (parseInt(curPage) == parseInt(1)) {
            pageHtml += "<li><a href=\"javascript:void(0);\">首页</a></li><li><a href=\"javascript:void(0);\">«上一页</a></li>";
        }
        else {
            pageHtml += "<li><a href=\"javascript:submitPage('1');\">首页</a></li><li><a href=\"javascript:submitPage('" + (curPage - 1) + "');\">«上一页</a></li>";
        }
        var begen = 1;
        var end = totalPage;
        if (parseInt(curPage) > parseInt(4) && parseInt(totalPage) > parseInt(7)) {
            if (parseInt(curPage) > totalPage - 3) {
                begen = totalPage - 6;
            }
            else {
                begen = curPage - 3;
            }
        }
        if (totalPage > begen + 6) {
            end = begen + 6;
        }
        for (var i = begen; i <= end; i++) {
            if (i == curPage) {
                pageHtml += "<li class=\"active\"><a href=\"javascript:void(0);\">" + i + "</a></li>";
            }
            else {
                pageHtml += "<li><a href=\"javascript:submitPage('" + i + "');\">" + i + "</a></li>";
            }
        }
        if (parseInt(curPage) == parseInt(totalPage)) {
            pageHtml += "<li><a href=\"javascript:void(0);\">下一页»</a></li><li><a href=\"javascript:void(0);\">尾页</a></li></ul>";
        }
        else {
            pageHtml += "<li><a href=\"javascript:submitPage('" + (curPage + 1) + "');\">下一页»</a></li><li><a href=\"javascript:submitPage('" + totalPage + "');\">尾页</a></li></ul>";
        }
        //pageHtml += "<div class=\"input-group\"><input type=\"text\" value=\""+ curPage+"\"  class=\"form-control input-sm\" id=\"goNum\" size=\"2\" /><a href=\"javascript:submitPage($('#goNum').val());\" class=\"btn btn-sm btn-default\">转到</a></div></div>";
        $("#r-page").html(pageHtml);
    };

    submitPage = function (currentPage) {
        indata.currentPage = currentPage;
        if (currentPage <= 0 || currentPage > totalPage) {
            //alert("请输入正确的页码:"+currentPage);
            return;
        }
        paging(inposturl, indata, inwritetablefn, tbodyContext, vcolspan);
    };
});
