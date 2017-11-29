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
    <title>e车贷管理系统--借款信息详情</title>
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

    function search() {
        var conditionKey = $("#conditionKey").val();
        var conditionValue = $("#conditionValue").val();
        var pledgeType = $("#pledgeType").val();
        var isExtended = $("#isExtended").val();
        var isEnded = $("#isEnded").val();
        var chargedoffAt = $("#chargedoffAt").val();
        var chargedoffAtEnd = $("#chargedoffAtEnd").val();
        var loanStatus = $("#loanStatus").val();

        var url = "${basePath}/admin/loan/findEndLoanAllByCondition.html?" + "conditionKey=" + conditionKey + "&conditionValue=" + conditionValue + "&pledgeType=" + pledgeType + "&isExtended=" + isExtended
                + "&isEnded=" + isEnded + "&chargedoffAt=" + chargedoffAt + "&chargedoffAtEnd=" + chargedoffAtEnd + "&loanStatus=" + loanStatus;
        document.location.href = url;
    }


    function completeSpecialRepayment() {
        var loanId = $("#repaymentLoanId").val();
        var repaymentMoney = $("#repaymentMoney").val();
        var repaymentId = "${repaymentId}";
        var remark = $("#callRemark").val();


        if(repaymentMoney == null || repaymentMoney =='' ){
            layer.msg("请输入特殊还款金额");
            return ;
        }

        if(remark == null || remark =='' ){
            layer.msg("备注信息不能为空");
            return ;
        }

        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/completeSpecialRepayment',
            data: {
                loanId: loanId,
                repaymentId: repaymentId,
                repaymentMoney: repaymentMoney,
                remark:remark
            },
            dataType: "text",
            success: function (data) {
                var data1 = eval("(" + data + ")");

                var res = data1.res;

                if (res == '0000') {
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

    document.location.reload

    function repaymentInfo(loanId) {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loanPort/getLoanRepaymentList',
            data: {
                loanId: loanId
            },
            dataType: "text",
            success: function (data) {
                var data1 = eval("(" + data + ")");

                var code = data1.res;
                var datalist = data1.repaymentList;
                $("#repaymentTable  tr:not(:first)").html("");

                if (code == '0000') {
                    $("#dialog-confirm").dialog("open");

                    $.each(datalist, function (i, item) {

                        var repaymentDate = "";
                        if ((item.repayDate != 0 && item.repayDate != null)) {
                            repaymentDate = timeStamp2String(item.repayDate);
                        }

                        var acutRepaymentTime = "";
                        if (item.acutRepaymentTime != 0 && item.acutRepaymentTime != null) {
                            acutRepaymentTime = timeStamp2String(item.acutRepaymentTime);
                        }

                        var actuRpaymentSum = "";
                        if (item.actuRpaymentSum != 0 && item.actuRpaymentSum != null) {
                            actuRpaymentSum = item.actuRpaymentSum;
                        }

                        var repaymentType = "";
                        if (item.repaymentType != 0 && item.repaymentType != null) {


                            if (item.repaymentType == "commonRepayment") {
                                repaymentType = "正常还款";
                            } else if (item.repaymentType == "continueRepayment") {
                                repaymentType = "续借还款";
                            } else if (item.repaymentType == "advancedRepayment") {
                                repaymentType = "提前还款";
                            } else {
                                repaymentType = "其他";
                            }

                        }


                        var repayType = "";

                        if (item.repayType != 0 && item.repayType != null) {


                            if (item.repayType == "AverageCapitalPlusInterest") {
                                repayType = "等额本息";
                            } else if (item.repayType == "InterestRatesBefore") {
                                repayType = "先息后本";
                            } else if (item.repayType == "flexiblerepaymentv2") {
                                repayType = "灵活还款";
                            } else if (item.repayType == "averagePrincipalreduceinterest") {
                                repayType = "等本减息";
                            } else if (item.repayType == "averagePrincipalzerointerestrent") {
                                repayType = "等本零息(押证)";
                            } else if (item.repayType == "intrestbeforePrincipaltransfer") {
                                repayType = "先息后本(押车)";
                            } else if (item.repayType == "intrestbeforePrincipalrent") {
                                repayType = "先息后本(押证)";
                            } else{
                                repayType = "其他";
                            }

                        }

                        var actuRpaymentSum = "";
                        if (item.actuRpaymentSum != 0 && item.actuRpaymentSum != null) {
                            actuRpaymentSum = item.actuRpaymentSum;
                        }

                        var isRepay = item.isRepay;
                        if (isRepay == 1) {
                            isRepay = "已还款"
                        } else if (isRepay == 0) {
                            isRepay = "待还清"
                        } else {
                            isRepay = "未知"
                        }


                        var tr = "<tr><td>" + item.prodectName + "</td>" +
                                "<td>" + item.repayPeriod + "</td>" +
                                "<td>" + item.repayCap + "</td>" +
                                "<td>" + item.repayIns + "</td>" +
                                "<td>" + item.gpsCost + "</td>" +
                                "<td>" + item.parkCost + "</td>" +
                                "<td>" + item.manageFee + "</td>" +
                                "<td>" + repaymentDate + "</td>" +
                                "<td>" + acutRepaymentTime + "</td>" +
                                "<td>" + item.repayTotal + "</td>" +
                                "<td>" + actuRpaymentSum + "</td>" +
                                "<td>" + item.overdueDay + "</td>" +
                                "<td>" + item.overdueFee + "</td>" +
                                "<td>" + isRepay + "</td>" +
                                "<td>" + repaymentType + "</td>" +
                                "<td>" + repayType + "</td>" +
                                "</tr>";
                        $("#repaymentTable").append(tr)
                    });
                    return true;

                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })
    }


    function repaymentProof(loanId) {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loanPort/getSignContractReview',
            data: {
                loanId: loanId
            },
            dataType: "text",
            success: function (data) {
                var data1 = eval("(" + data + ")");

                var code = data1.res;
                var datalist = data1.signContractReviewList;

                $("#repaymentProofTable  tr:not(:first)").html("");


                if (code == '0000') {
                    $("#dialog-confirm3").dialog("open");
                    $.each(datalist, function (i, item) {
                        var flag = item.isValid;

                        if (flag == true) {
                            flag = "有效"
                        } else if (flag = false) {
                            flag = "无效";
                        } else {
                            flag = "其他"
                        }

                        var tr = "<tr><td>" + item.id + "</td>" +
                                "<td>" + item.attachmentTitle + "</td>" +
                                "<td>" + flag + "</td>" +
                                "<td><a href=" + item.attachmentPath + " target=\"_blank\" class=\"link-01\">查看</a>" + "</td>" +
                                "</tr>";
                        $("#repaymentProofTable").append(tr)

                    });
                    return true;

                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })
    }


    function loanInfoAttachmentList(loanId) {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loanPort/getLoanInfoAttachmentList',
            data: {
                loanId: loanId
            },
            dataType: "text",
            success: function (data) {
                var data1 = eval("(" + data + ")");

                var code = data1.res;
                var datalist = data1.loanInfoAttachment;

                $("#loanInfoAttachmentTable tr:not(:first)").html("");


                if (code == '0000') {
                    $("#dialog-confirm4").dialog("open");
                    $.each(datalist, function (i, item) {
                        var flag = item.isValid;

                        if (flag == true) {
                            flag = "有效"
                        } else if (flag = false) {
                            flag = "无效";
                        } else {
                            flag = "其他"
                        }

                        var tr = "<tr><td>" + item.id + "</td>" +
                                "<td>" + item.attachmentTitle + "</td>" +
                                "<td>" + flag + "</td>" +
                                "<td><a href=" + item.attachmentPath + " target=\"_blank\" class=\"link-01\">查看</a>" + "</td>" +
                                "</tr>";
                        $("#loanInfoAttachmentTable").append(tr)

                    });
                    return true;

                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })
    }

    function specialRepayment(loanId) {
        $("#dialog-confirm5").dialog("open");
        $("#repaymentLoanId").val(loanId);
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

    function vehicleInfo(id) {
        var loanId = id;
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/vehicleInfo',
            data: {
                loanId: loanId
            },
            dataType: "text",
            success: function (data) {

                var data1 = eval("(" + data + ")");

                var code = data1.res;


                var purchaseDate = data1.loanInfo.guaranteeEvaluateInfo.purchaseDate;
                if ((purchaseDate != 0 && purchaseDate != null)) {
                    purchaseDate = timeStamp2String(purchaseDate);
                }

                if (code == '0000') {
                    $("#dialog-confirm2").dialog("open");
                    $("#vehicleBrand").html(data1.loanInfo.guaranteeEvaluateInfo.vehicleBrand);
                    $("#vehicleModels").html(data1.loanInfo.guaranteeEvaluateInfo.vehicleModels);
                    $("#vehicleNo").html(data1.loanInfo.guaranteeEvaluateInfo.vehicleNo);
                    $("#engineNo").html(data1.loanInfo.guaranteeEvaluateInfo.engineNo);
                    $("#color").html(data1.loanInfo.guaranteeEvaluateInfo.color);
                    $("#displacement").html(data1.loanInfo.guaranteeEvaluateInfo.displacement);
                    $("#vehicleIdentification").html(data1.loanInfo.guaranteeEvaluateInfo.vehicleIdentification);
                    $("#purchaseDate").html(purchaseDate);
                    $("#isExamined").html(data1.loanInfo.guaranteeEvaluateInfo.isExamined);
                    $("#isInsure").html(data1.loanInfo.guaranteeEvaluateInfo.isInsure);
                    $("#darkLocks").html(data1.loanInfo.guaranteeEvaluateInfo.darkLocks);
                    $("#darkLocksPosition").html(data1.loanInfo.guaranteeEvaluateInfo.darkLocksPosition);
                    $("#buyTheWay").html(data1.loanInfo.guaranteeEvaluateInfo.buyTheWay);
                    $("#evaluatePrice").html(data1.loanInfo.guaranteeEvaluateInfo.evaluatePrice);
                    var towStatus = data1.loanInfo.guaranteeEvaluateInfo.towStatus;
                    $("#attachmentPath").attr("href",data1.attachmentPath);

                    if (towStatus == 'waitTruck') {
                        towStatus = '待拖车';
                    } else if (towStatus == 'noTowTruck') {
                        towStatus = '未能拖车';
                    } else if (towStatus == 'alreadyTowTruck') {
                        towStatus = '已拖车';
                    } else if (towStatus == 'alreadyTowTruck') {
                        towStatus = '已拖车';
                    } else {
                        towStatus = '无';
                    }
                    $("#towStatus").html(towStatus);
                s

                    return true;

                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })

    }


    $(function () {
        /** 还款凭证 */
        $("#repaymentUploadProofUpload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#repaymentUploadProofUploadSpan'));
            }
        });

        var doneProcess = function (data, obj) {
            $.each(data.result, function (index, file) {
                if (file.code == "0000") {
                    obj.removeClass("cblue");
                    obj.addClass("cgreen");
                    obj.text("已上传");
                    layer.msg("上传成功！");
                } else {
                    layer.msg(file.message);
                }
            });
        };
        // 初始化对话框
        $("#dialog-confirm").dialog(
                {
                    modal: true,             // 创建模式对话框
                    autoOpen: false,
                    height: "400",
                    width: "1200",
                    buttons: {
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                }
        );
        $("#dialog-confirm2").dialog(
                {
                    modal: true,             // 创建模式对话框
                    autoOpen: false,
                    height: "250",
                    width: "600",
                    buttons: {
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                }
        );

        $("#dialog-confirm3").dialog(
                {
                    modal: true,             // 创建模式对话框
                    autoOpen: false,
                    height: "300",
                    width: "700",
                    buttons: {
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                }
        );

        $("#dialog-confirm4").dialog(
                {
                    modal: true,             // 创建模式对话框
                    autoOpen: false,
                    height: "350",
                    width: "700",
                    buttons: {
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                }
        );

        $("#dialog-confirm5").dialog(
                {
                    modal: true,             // 创建模式对话框
                    autoOpen: false,
                    height: "450",
                    width: "400",
                    buttons: {
                        "确认": function () {
                            $(this).dialog('close');
                            completeSpecialRepayment();
                        },
                        "取消": function () {
                            $(this).dialog('close');
                        }
                    }
                }
        );
    });

    function goPage(page) {
        var conditionKey = "${conditionKey}";
        var conditionValue = "${conditionValue}";
        var pledgeType = "${pledgeType}";
        var isExtended = "${isExtended}";
        var isEnded = "${isEnded}";
        var chargedoffAt = "${chargedoffAt}";
        var chargedoffAtEnd = "${chargedoffAtEnd}";
        var loanStatus = "${loanStatus}";
        var url = "${basePath}/admin/loan/findEndLoanAllByCondition.html?page=" + page + "&conditionKey=" + conditionKey + "&conditionValue=" + conditionValue + "&pledgeType=" + pledgeType + "&isExtended=" + isExtended
                + "&isEnded=" + isEnded + "&chargedoffAt=" + chargedoffAt + "&chargedoffAtEnd=" + chargedoffAtEnd + "&loanStatus=" + loanStatus;
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

<div id="dialog-confirm5" title="特殊还款" style="display: none">
    <br/>

    <div>
        <div class="table-area" id="con_one_9">
            <strong class="cred">*</strong>
            <label class="label-s"><span> 特殊还款金额:<input name="repaymentMoney" id="repaymentMoney"
                                                        type="text"></span></label>
            <span><input name="repaymentLoanId" id="repaymentLoanId" type="hidden"></span>
            <br/><br/>

            <div class="row">
                <div class="form-group col-md-6">
                    <label class="label-s"> <strong class="cred">*</strong> 收款凭证上传<span
                            id="repaymentUploadProofUploadSpan" class="small_span">
                                        (上传的附件在借款附件栏目查看) </span><span id="ownerVehicleRepaymentFileuploadSpan"
                                                                      class="cred">(必传)</span></label>
                    <input id="repaymentUploadProofUpload" type="file"
                           class="form-control"
                           name="files[]"
                           data-url="${basePath}/admin/file/upload/${repaymentId}/ownerVehicleRepayment.html"/>
                </div>

                <div class="con clearfix" id="loan_attachment_div">
                    <!-- load loanAttachment页面 -->
                </div>
            </div>
            <br/>

            <div class="row">
                <div class="form-group col-md-12"><strong class="cred">*</strong>
                    <label>特殊还款备注</label>
                    <textarea cols="150" rows="2" class="form-control" id="callRemark"
                              name="callRemark"></textarea>
                </div>
            </div>

        </div>
    </div>
</div>


<div id="dialog-confirm4" title="相关附件信息" style="display: none">

        <div class="table-area" id="con_one_6">
            <table border="0" cellspacing="0" cellpadding="0"
                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s"
                   id="loanInfoAttachmentTable">
                <tr>
                    <th>附件编号</th>
                    <th>附件标题</th>
                    <th>是否有效</th>
                    <th>查看</th>
                </tr>
            </table>
        </div>

</div>

<div id="dialog-confirm3" title="还款凭证" style="display: none" >

        <div class="table-area" id="con_one_5">
            <table border="0" cellspacing="0" cellpadding="0"
                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s"
                   id="repaymentProofTable">
                <tr>
                    <th>附件编号</th>
                    <th>附件标题</th>
                    <th>是否有效</th>
                    <th>查看</th>
                </tr>
            </table>
        </div>
</div>

<div id="dialog-confirm" title="还款信息" style="display: none" >

        <div class="table-area" id="con_one_3">
            <table border="0" cellspacing="0" cellpadding="0"
                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s"
                   id="repaymentTable">
                <tr>
                    <th>项目名称</th>
                    <th>还款期数</th>
                    <th>还款本金</th>
                    <th>还款利息</th>
                    <th>gps费用</th>
                    <th>停车费</th>
                    <th>管理费用</th>
                    <th>应还款时间</th>
                    <th>实还款时间</th>
                    <th>应还金额</th>
                    <th>实还金额</th>
                    <th>逾期天数</th>
                    <th>产生罚息</th>
                    <th>是否还款</th>
                    <th>当前还款状态</th>
                    <th>处理方式</th>
                </tr>
            </table>
        </div>

</div>


<div id="dialog-confirm2" title="车辆信息" style="display: none">

        <div class="table-area" id="con_one_2">
            <table border="0" cellspacing="0" cellpadding="0"
                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
                <tr>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <td align="center">车辆品牌</td>
                    <td align="center" id="vehicleBrand"></td>
                </tr>
                <tr>
                    <td align="center">车辆型号</td>
                    <td align="center" id="vehicleModels"></td>
                </tr>
                <tr>
                    <td align="center">车牌号</td>
                    <td align="center" id="vehicleNo"></td>
                </tr>
                <tr>
                    <td align="center">发动机号</td>
                    <td align="center" id="engineNo"></td>
                </tr>
                <tr>
                    <td align="center">颜色</td>
                    <td align="center" id="color"></td>
                </tr>
                <tr>
                    <td align="center">排量</td>
                    <td align="center" id="displacement"></td>
                </tr>
                <tr>
                    <td align="center">车架号</td>
                    <td align="center" id="vehicleIdentification"></td>
                </tr>
                <tr>
                    <td align="center">购置日期</td>
                    <td align="center" id="purchaseDate"></td>
                </tr>
                <tr>
                    <td align="center">年审是否有效</td>
                    <td align="center" id="isExamined"></td>
                </tr>
                <tr>
                    <td align="center">购买车辆全险</td>
                    <td align="center" id="isInsure"></td>
                </tr>
                <tr>
                    <td align="center">暗锁</td>
                    <td align="center" id="darkLocks"></td>
                </tr>
                <tr>
                    <td align="center">暗锁位置</td>
                    <td align="center" id="darkLocksPosition"></td>
                </tr>
                <tr>
                    <td align="center">购买方式</td>
                    <td align="center" id="buyTheWay"></td>
                </tr>

                <tr>
                    <td align="center">评估价格</td>
                    <td align="center" id="evaluatePrice"></td>
                </tr>
                <tr>
                    <td align="center">评估结果</td>
                    <td align="center" id="evaluateConclusion"></td>
                </tr>
                <tr>
                    <td align="center">拖车状态</td>
                    <td align="center" id="towStatus"></td>
                </tr>


                <tr>
                    <td align="center">人车合照</td>
                    <td align="center"><a id="attachmentPath" target="_blank" class="link-01">查看</a></td>
                </tr>


                </tr>

            </table>
        </div>

</div>


<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li>贷后信息列表</li>
    </ul>
</div>

<div class="main-con">

    <div class="filter-area">
        <div class="row mar-b-8">
            <label> &nbsp;&nbsp;&nbsp;&nbsp;查询条件:</label>

            <div class="form-group col-sm-3" style="width: 15%">
                <select class="form-control" id="conditionKey" name="conditionKey">
                    <option value="" selected="selected">--请选择--</option>
                    <option value="idCard">借款人身份证</option>
                    <option value="criMobile">借款人电话</option>
                    <option value="customerName">借款人姓名</option>
                    <option value="nickname">客户经理姓名</option>
                    <option value="userMobile">客户经理电话</option>
                </select>
            </div>

            <label> 查询值:</label>

            <div class="form-group col-sm-3" style="width: 14%">
                <input type="text" class="form-control" id="conditionValue" name="conditionValue"
                       size="15">
            </div>

            <label> 贷款类型:</label>

            <div class="form-group col-sm-3" style="width: 10%">
                <select class="form-control" id="pledgeType" name="pledgeType">
                    <option value="" selected="selected">--请选择--</option>
                    <option value="drivePledge">押证</option>
                    <option value="vehiclePledge">押车</option>
                </select>
            </div>

            <label> 续借状态:</label>

            <div class="form-group col-sm-3" style="width: 10%">
                <select class="form-control" id="isExtended" name="isExtended">
                    <option value="" selected="selected">--请选择--</option>
                    <option value=1>续借</option>
                    <option value=0>未续借</option>
                </select>
            </div>

            <label>结清状态:</label>

            <div class="form-group col-sm-3" style="width:10%">
                <select class="form-control" id="isEnded" name="isEnded">
                    <option value="" selected="selected">--请选择--</option>
                    <option value=0>未结清</option>
                    <option value=1>已结清</option>
                </select>
            </div>


            <label> 借款状态:</label>

            <div class="form-group col-sm-3" style="width: 10%">
                <select class="form-control" id="loanStatus" name="loanStatus">
                    <option value="" selected="selected">--请选择--</option>
                    <option value="badLoanApplication">坏账归档</option>
                    <option value="vehicleNoSaleRepayment">还款不提车</option>
                    <option value="detainedCarRepayment">还款提车</option>
                    <option value="saleRepayment">卖车还款</option>
                    <option value="repaymentedHandle">已拖车处理</option>

                </select>
            </div>

        </div>

    </div>


    <div class="filter-area">
        <div class="row mar-b-8" style="height:50px">
            <div class="form-group col-sm-3" style="width: 20%">
                <label>借款时间:&nbsp;&nbsp;</label>

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
                <th>借款人姓名</th>
                <th>借款人电话</th>
                <th>审批金额</th>
                <th>办理类型</th>
                <th>所属部门</th>
                <th>所属公司</th>
                <th>是否结清</th>
                <th>放款时间</th>
                <th>结清时间</th>
                <th>续借状态</th>
                <th>还款状态</th>
                <th>客户经理</th>
                <th>经理电话</th>
                <th>车辆信息</th>
                <th>还款信息</th>
                <th>催收信息</th>
                <th>还款凭证</th>
                <th>相关附件</th>
                <th>操作</th>
            </tr>

            <c:set var="tp" value="${endedLoanPage}"/>
            <c:forEach items="${tp.context}" var="l">
                <tr>
                    <td align="center">${l.customerRegisterInfo.customerName }</td>
                    <td align="center">${l.customerRegisterInfo.mobile }</td>
                    <td align="center">${l.loanMoney}</td>
                    <c:choose>
                        <c:when test="${l.pledgeType == 'drivePledge'}">
                            <td align="center">押证</td>
                        </c:when>
                        <c:when test="${l.pledgeType == 'vehiclePledge'}">
                            <td align="center">押车</td>
                        </c:when>
                        <c:otherwise>
                            <td align="center">其他</td>
                        </c:otherwise>
                    </c:choose>

                    <td align="center">${l.deptName}</td>
                    <td align="center">${l.companyName}</td>
                    <c:if test="${l.isEnded == true}">
                        <td align="center">已结清</td>
                    </c:if>
                    <c:if test="${l.isEnded == false}">
                        <td align="center">未结清</td>
                    </c:if>

                    <td align="center"><fmt:formatDate value="${l.chargedoffAt}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>

                    <td align="center"><fmt:formatDate value="${l.endedAt}"
                                                       pattern="yyyy-MM-dd HH:mm"/></td>


                    <c:choose>
                        <c:when test="${l.isExtended == false}">
                            <td align="center">未续借</td>
                        </c:when>
                        <c:when test="${l.isExtended == true}">
                            <td align="center">已续借</td>
                        </c:when>
                        <c:otherwise>
                            <td align="center">其他</td>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${l.loanStatus == 'saleRepayment'}">
                            <td align="center">卖车还款</td>
                        </c:when>
                        <c:when test="${l.loanStatus == 'detainedCarRepayment'}">
                            <td align="center">提车还款</td>
                        </c:when>
                        <c:when test="${l.loanStatus == 'badLoanApplication'}">
                            <td align="center">坏账归档</td>
                        </c:when>
                        <c:when test="${l.loanStatus == 'vehicleNoSaleRepayment'}">
                            <td align="center">还款不提车</td>
                        </c:when>
                        <c:when test="${l.loanStatus == 'commonRepayment'}">
                            <td align="center">正常还款</td>
                        </c:when>
                        <c:when test="${l.loanStatus == 'continueRepayment'}">
                            <td align="center">续借还款</td>
                        </c:when>
                        <c:when test="${l.loanStatus == 'advancedRepayment'}">
                            <td align="center">提前还款</td>
                        </c:when>
                        <c:otherwise>
                            <td align="center">其他状态</td>
                        </c:otherwise>
                    </c:choose>
                    <td align="center">${l.user.realname}</td>
                    <td align="center">${l.user.mobile}</td>
                    <td align="center">
                        <a href="javascript:vehicleInfo('${l.uuid}')"
                           class="link-01">查看</a>
                    </td>
                    <td align="center">
                        <a href="javascript:repaymentInfo('${l.uuid}')"
                           class="link-01">查看</a>
                    </td>


                    <td align="center">
                        <a href="${basePath}/admin/loan/adminShowLoanEndRepaymentOrderAllByProcessInds.html?loanId=${l.uuid}"
                           class="link-01">查看</a>
                    </td>

                    <td align="center">
                        <a href="javascript:repaymentProof('${l.uuid}')"
                           class="link-01">查看</a>
                    </td>
                    <td align="center">
                        <a href="javascript:loanInfoAttachmentList('${l.uuid}')"
                           class="link-01">查看</a>
                    </td>


                    <c:choose>
                        <c:when test="${l.loanStatus == 'vehicleNoSaleRepayment'}">
                            <td align="center">
                                <a href="javascript:specialRepayment('${l.uuid}')"
                                   class="link-01">特殊还款</a>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td align="center">
                                无
                            </td>
                        </c:otherwise>

                    </c:choose>


                </tr>

            </c:forEach>
            <tr>
                <td colspan="7">
                    共有<strong style="color:red">${tp.totalcount }</strong>条记录,分为<strong
                        style="color:red">${tp.totalpage }</strong>页,当前是<strong
                        style="color:red">${tp.currentpage+1 }</strong>页
                    &nbsp; &nbsp;
                    <c:if test="${tp.haslast }">
                        <a href="javascript:goPage(0)">首页</a>
                        <a href="javascript:goPage(${tp.currentpage-1 })">上一页</a>
                    </c:if>
                    <c:if test="${!tp.haslast }">
                        首页
                        上一页
                    </c:if>
                    <c:if test="${tp.hasnext }">
                        <a href="javascript:goPage(${tp.currentpage+1})">下一页</a>
                        <a href="javascript:goPage(${tp.totalpage-1})">尾页</a>
                    </c:if>
                    <c:if test="${!tp.hasnext }">
                        下一页
                        尾页
                    </c:if>
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>

</div>


</body>

</html>
