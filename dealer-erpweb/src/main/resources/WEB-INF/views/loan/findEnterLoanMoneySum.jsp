<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="<%= request.getContextPath() %>"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>卖钱翁金融网站后台管理--应付账单（放款账单）</title>
</head>
<link type="text/css" rel="stylesheet" href="${basePath}/css/css.css"/>
<link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css"/>
<link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css"/>
<link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css"/>
<link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css"/>
<link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css"/>
<link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css"/>
<link type="text/css" href="${basePath}/js/jquery-ui-master/themes/base/jquery.ui.all.css" rel="stylesheet"/>
<script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.core.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.widget.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.mouse.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.button.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.draggable.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.position.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery-ui-master/ui/jquery.ui.dialog.js"></script>
<script type="text/javascript" src="${basePath}/js/other.js"></script>
<script type="text/javascript" src="${basePath}/js/my.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
<script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
<script language="javascript">

    // 初始化对话框

    $(function () {


        $("#dialog-confirm2").dialog(
                {
                    modal: true,             // 创建模式对话框
                    autoOpen: false,
                    height: "350",
                    width: "400",
                    buttons: {
                        "应用": function () {
                            $(this).dialog('close');
                            completeUpdateRate();
                        },
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                }
        );
    });


    function completeUpdateRate() {
        var userRate = $("#userRate").val();
        var openIdRate = $("#openIdRate").val();
        var currentUserRate = $("#currentUserRate").val();
        var currentOpenIdRate = $("#currentOpenIdRate").val();
        var userId = $("#userId").val();
        var customerId = $("#customerId").val();


        if (userRate == null || userRate == '') {
            layer.msg("请输入默认的业务员提成比例");
            return;
        }
        if (openIdRate == null || openIdRate == '') {
            layer.msg("请输入默认的分销提成比例");
            return;
        }

        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/financeManager/completeUpdateRate',
            data: {
                userRate: userRate,
                openIdRate: openIdRate,
                currentUserRate: currentUserRate,
                currentOpenIdRate: currentOpenIdRate,
                customerId: customerId,
                userId: userId

            },
            dataType: "text",
            success: function (data) {
                var data1 = eval("(" + data + ")");

                var res = data1.res;

                if (res == true) {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        document.location.reload();
                        return true;
                    });

                } else {
                    layer.msg("操作失败!可能原因：" + res);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })
    }

    function search() {
        var conditionKey = $("#conditionKey").val();
        var conditionValue = $("#conditionValue").val();
        var chargedoffAt = $("#chargedoffAt").val();
        var chargedoffAtEnd = $("#chargedoffAtEnd").val();


        var url = "${basePath}/admin/financeManager/findEnterLoanMoneySum?startDate=" + chargedoffAt + "&endDate=" + chargedoffAtEnd;
        document.location.href = url;
    }


    function updateRate(userId, customerId) {
        $("#dialog-confirm2").dialog("open");
        $("#userId").val(userId);
        $("#customerId").val(customerId);
    }


    function timeStamp2String(time) {
        var datetime = new Date();
        datetime.setTime(time);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
        var hour = datetime.getHours() < 10 ? "0" + datetime.getHours() : datetime.getHours();
        var minute = datetime.getMinutes() < 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
        var second = datetime.getSeconds() < 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
        return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
    }


    function goPage(page) {

        var conditionKey = "${conditionKey}";
        var conditionValue = "${conditionValue}";
        var pledgeType = "${pledgeType}";
        var isExtended = "${isExtended}";
        var isEnded = "${isEnded}";
        var chargedoffAt = "${chargedoffAt}";
        var chargedoffAtEnd = "${chargedoffAtEnd}";
        var loanStatus = "${loanStatus}";

        var conditionKey = "${conditionKey}";
        var conditionValue = "${conditionValue}";
        var isEnded = "${isEnded}";
        var chargedoffAt = "${startDate}";
        var chargedoffAtEnd = "${endDate}";


        var url = "${basePath}/admin/financeManager/commissionManager?conditionKey=" + conditionKey + "&conditionValue=" + conditionValue
                + "&isEnded=" + isEnded + "&startDate=" + chargedoffAt + "&endDate=" + chargedoffAtEnd + "&page=" + page;
        document.location.href = url;
    }


    function istime(str) {
        var a = str.match(/^(\d{0,2}):(\d{0,2}):(\d{0,2})$/);
        if (a == null) return false;
        if (a[1] >= 24 || a[2] >= 60 || a[3] >= 60) return false;
        return true;
    }
    function isdatetime(str) {
        var a = str.match(/^(\d{0,4})-(\d{0,2})-(\d{0,2}) (\d{0,2}):(\d{0,2}):(\d{0,2})$/);
        if (a == null) return false;
        if (a[2] >= 13 || a[3] >= 32 || a[4] >= 24 || a[5] >= 60 || a[6] >= 60) return false;
        return true;
    }
    function isdate(str) {
        var a = str.match(/^(\d{0,4})-(\d{0,2})-(\d{0,2})$/);
        if (a == null) return false;
        if (a[2] >= 13 || a[3] >= 32 || a[4] >= 24) return false;
        return true;
    }


</script>
</head>
<body class="main-bg">


<div id="dialog-confirm2" title="提成比例信息" style="display: none">
    <div>
        <div class="table-area" id="con_one_9">
            <label class="label-s"><span> 默认业务员提成比例:<input name="userRate" id="userRate"
                                                           type="text" value="${userRate}"></span></label>
            <br/>
            <label class="label-s"><span> 默认分销员提成比例: <input name="openIdRate" id="openIdRate"
                                                            type="text" value="${openIdRate}"></span></label>
            <br/>
            <label class="label-s"><span> 当前业务员提成比例：<input name="currentUserRate" id="currentUserRate"
                                                           type="text">
            <input name="userId" id="userId"
                   type="hidden"></span></label>
            <br/>
            <label class="label-s"><span> 当前分销员提成比例：<input name="currentOpenIdRate" id="currentOpenIdRate"
                                                           type="text">
              <input name="customerId" id="customerId"
                     type="hidden"></span></label>

        </div>
    </div>
</div>


<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li>应付账单（佣金提成）</li>
    </ul>
</div>

<div class="main-con">

    <div class="filter-area">
        <div class="row mar-b-8" style="height:50px">
            <div class="form-group col-sm-3" style="width: 20%">
                <label>时间:&nbsp;&nbsp;</label>

                <div class="form-group">
                    <div class="input-group date form_date" data-date=""
                         data-date-format="yyyy-mm-dd"
                         data-link-field="chargedoffAt"
                         data-link-format="yyyy-mm-dd">
                        <input class="form-control" type="text"
                               value="" pattern="yyyy-MM-dd">
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="text" hidden="hidden" id="chargedoffAt" name="chargedoffAt"
                           value="" pattern="yyyy-MM-dd"/>
                        <span id="repay_end_date_div"
                              style="display:none">(提示:还款时间不能大于当前时间)</span><br/>
                </div>

            </div>

            <div class="form-group col-sm-3" style="width: 18%">
                <label>至:&nbsp;&nbsp;&nbsp;&nbsp;</label>

                <div class="form-group">
                    <div class="input-group date form_date" data-date=""
                         data-date-format="yyyy-mm-dd"
                         data-link-field="chargedoffAtEnd"
                         data-link-format="yyyy-mm-dd">
                        <input class="form-control" type="text"
                               value="" pattern="yyyy-MM-dd"/>
                                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span>

                    </div>
                    <input type="text" hidden="hidden" id="chargedoffAtEnd" name="dateJoinedEnd"
                           value=""/>
                        <span id="repay_end_date_div2"
                              style="display:none">(提示:还款时间不能大于当前时间)</span><br/>
                </div>


            </div>


            <div class="form-group col-sm-3" style="width: 18%">
                &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:search()" class="btn btn-01" id="selectBtn">搜索</a>
            </div>
        </div>

    </div>
    <div class="table-area" id="con_one_1">

        <table border="0" cellspacing="0" cellpadding="0"
               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
            <tr>
                <th colspan="2" align='center' valign="middle">卖钱翁车贷放款报表</th>
            </tr>

            <tr>
                <td align="center">车贷放款总金额合计：</td>
                <td align="center">${sumLoanMoney}</td>
            </tr>
            <tr>
                <td align="center">报表统计时间：</td>
                <td align="center">${startDate}&nbsp;至 &nbsp;${endDate}</td>
            </tr>


        </table>
    </div>

</div>


</body>

</html>
