<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统--填写借款申请</title>
    <%--<%@include file="../common/taglibs.jsp" %>--%>

    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css" />

    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>

    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>

    <script src="${basePath}/js/jquery.validate.js"></script>

    <script>
        var getContactsInfo = function (customerId) {
            $.get("${basePath}/admin/customer/queryContactsCusId.html?uuid=" + customerId,
                    function (result) {
                        $(result).each(function (i) {
                            if (result[i].relation == "配偶") {
                                $("#spouse_id").val(result[i].id);
                                $("#spouse_name").val(result[i].contactsName);
                                $("#spouse_tel").val(result[i].contactsTel);
                                $("#spouse_mobile").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#spouse_ck").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "直系亲属1") {
                                $("#immediate_id1").val(result[i].id);
                                $("#immediate_name1").val(result[i].contactsName);
                                $("#immediate_relation1").val(result[i].relation);
                                $("#immediate_Mobile1").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#immediate_ck1").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "直系亲属2") {
                                $("#immediate_id2").val(result[i].id);
                                $("#immediate_name2").val(result[i].contactsName);
                                $("#immediate_relation2").val(result[i].relation);
                                $("#immediate_Mobile2").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#immediate_ck2").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "其他联系人1") {
                                $("#other_id1").val(result[i].id);
                                $("#other_name1").val(result[i].contactsName);
                                $("#other_relation1").val(result[i].relation);
                                $("#other_mobile1").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#other_ck2").attr("checked", "checked");
                                }
                            }
                            if (result[i].contactsTel == "其他联系人2") {
                                $("#other_id2").val(result[i].id);
                                $("#other_name2").val(result[i].contactsName);
                                $("#other_relation2").val(result[i].relation);
                                $("#other_mobile2").val(result[i].contactsMobile);
                                if (result[i].know) {
                                    $("#other_ck").attr("checked", "checked");
                                }
                            }
                        });
                    })
        };

        var isKnowLoan = function (pid, ckId) {
            var id = $(pid).val();
            var isKnow = 0;
            if ($(ckId).attr("checked") == "checked") {
                isKnow = 1;
            }
            if (id == "" || id == null || isKnow === "" || isKnow == null) {
                layer.msg("请先输入客户姓名！");
                return;
            }
            $.get("${basePath}/admin/loan/contacts.html?id=" + id + "&isKnow=" + isKnow,
                    function (result) {
                        if (result == '0000') {
                            layer.msg("操作成功！");
                        } else {
                            layer.msg("操作失败！");
                        }
                    });
        };

        $(function () {
            /** 编辑页面的借款人姓名不可以修改 */
            var cusName = "${loanInfo.customerRegisterInfo.customerName}";
            if (cusName != null && cusName != "") {
                var loaObj = $('input[name="loaner"]');
                loaObj.attr("disabled", 'disabled');

                $("#accountName").attr("value", cusName);
                $("#phone").html("${loanInfo.customerRegisterInfo.mobile}");
                $("#idCard").attr("value", "${loanInfo.customerRegisterInfo.idCard}");
                $("#customerId").attr("value", "${loanInfo.customerRegisterInfo.uuid}");
                $("#mobile").attr("value", "${loanInfo.customerRegisterInfo.mobile}");
                getContactsInfo("${loanInfo.customerRegisterInfo.uuid}");
            }

            var loanerObj = $("#loaner");
            loanerObj.completer({
                complete: function () {
                    var loaner = loanerObj.val();
                    var loaners = loaner.split("-");
                    loanerObj.attr("value", loaners[0]);
                    $("#accountName").attr("value", loaners[0]);
                    $("#phone").html(loaners[1]);
                    $("#idCard").attr("value", loaners[2]);
                    $("#customerId").attr("value", loaners[3]);
                    $("#mobile").attr("value", loaners[1]);
                    getContactsInfo(loaners[3]);
                },
                source: ${customers},
                position: "right",
                suggest: true
            });

            loanerObj.blur(function () {
                if (loanerObj.val() == null || loanerObj.val() == "") {
                    $("#phone").html("");
                    $("#idCard").attr("value", "");
                    $("#customerId").attr("value", "");
                    $("#mobile").attr("value", "");
                }
            });

            /** 年利率转月利率 */
            $("#year_rate").change(function () {
                var year_rate = $("#year_rate").val();
                var monthly_rate = changeFourDecimal(accDiv(year_rate, 12));
                $("#monthly_rate").val(monthly_rate);
            });

            /*编辑页面计算月利率*/
            var loanRateVal = "${loanInfo.loanRate}";
            if (loanRateVal != null) {
                var year_rate = $("#year_rate").val();
                var monthly_rate = changeFourDecimal(accDiv(year_rate, 12));
                $("#monthly_rate").val(monthly_rate);
            }

            /** 月利率转年利率 */
            $("#monthly_rate").change(function () {
                var monthly_rate = $("#monthly_rate").val();
                var year_rate = changeFourDecimal(accMul(monthly_rate, 12));
                $("#year_rate").val(money(year_rate));
            });

            var repayWayObj = $("#repayWay");
            repayWayObj.change(function () {
                var managerFeeObj = $("#managerFee");
                if (this.value == "AverageCapitalPlusInterest") {
                    managerFeeObj.attr("value", "1.0")
                } else if (this.value == "InterestRatesBefore") {
                    managerFeeObj.attr("value", "2.0")
                }
            });


            /**借款用途为其他弹出文本框输入*/

            $("#loanPurpose").live("change",function(){
                var supplementObj = $("#supplement");
                if(this.value=='other'){
                    supplementObj.html("<laber>其它：</laber><input type='text' class='form-control' name='purpose' id='purpose'>");

                }else{
                    supplementObj.html("");
                }

            });




            $.validator.addMethod("checkSelected", function (value, element, params) {
                return value != '0';
            }, '<font color="red">请选择！</font>');

            $("#loanForm").validate({
                rules: {
                    loaner: {
                        required: true
                    }, applyMoney: {
                        required: true,
                        digits: true
                    }, loanPurpose: {
                        required: true
                    }, repaySource: {
                        required: true
                    }, loanRate: {
                        required: true,
                        number: true
                    }, monthlyRate: {
                        required: true
                    }, loanLimitTime: {
                        required: true,
                        digits: true
                    }, vehicleBrand: {
                        required: true
                    }, vehicleNo: {
                        required: true
                    }, mileaged: {
                        required: true
                    }, purchaseDate: {
                        required: true
                    }, vehicleIdentification: {
                        required: true
                    }, engineNo: {
                        required: true
                    }, evaluateby: {
                        required: true
                    }, evaluatePrice: {
                        required: true,
                        digits: true
                    }, evaluateConclusion: {
                        required: true
                    }, hostOpinion: {
                        required: true
                    }, remark: {
                        required: true
                    }, companyId: {
                        checkSelected: true
                    }, deptId: {
                        checkSelected: true
                    }, responsibleCmId: {
                        checkSelected: true
                    }
                },
                messages: {
                    loaner: {
                        required: '<font color="red">不能为空！</font>'
                    }, applyMoney: {
                        required: '<font color="red">不能为空！</font>',
                        digits: "<font color='red'>不合法!</font>"
                    }, loanPurpose: {
                        required: '<font color="red">不能为空！</font>'
                    }, repaySource: {
                        required: '<font color="red">不能为空！</font>'
                    }, loanRate: {
                        required: '<font color="red">不能为空！</font>',
                        number: "<font color='red'>不合法!</font>"
                    }, monthlyRate: {
                        required: '<font color="red">不能为空！</font>'
                    }, loanLimitTime: {
                        required: '<font color="red">不能为空！</font>',
                        digits: "<font color='red'>不合法!</font>"
                    }, vehicleBrand: {
                        required: '<font color="red">不能为空！</font>'
                    }, vehicleNo: {
                        required: '<font color="red">不能为空！</font>'
                    }, mileaged: {
                        required: '<font color="red">不能为空！</font>'
                    }, purchaseDate: {
                        required: '<font color="red">不能为空！</font>'
                    }, vehicleIdentification: {
                        required: '<font color="red">不能为空！</font>'
                    }, engineNo: {
                        required: '<font color="red">不能为空！</font>'
                    }, evaluateby: {
                        required: '<font color="red">不能为空！</font>'
                    }, evaluatePrice: {
                        required: '<font color="red">不能为空！</font>',
                        digits: "<font color='red'>不合法!</font>"
                    }, evaluateConclusion: {
                        required: '<font color="red">不能为空！</font>'
                    }, hostOpinion: {
                        required: '<font color="red">不能为空！</font>'
                    }, remark: {
                        required: '<font color="red">不能为空！</font>'
                    }
                }, submitHandler: function (form) {
                    /** 判断附件是否上传完毕 */
                    var idCard = $("#idCardType").val();// 身份证
                    var vehicleLicense = $("#vehicleLicense").val();//车辆行驶证
                    var registrationCertificate = $("#registrationCertificate").val();//机动车登记证书
                    var businessInsurancePolicy = $("#businessInsurancePolicy").val();//机动车商业保险单
                    var loanPurValObj = $("#loanPurpose");
                    if (loanPurValObj.val() == 'other') {
                        loanPurValObj.get(0).options[5].value = $("#purpose").val();
                    }

                    if (idCard == null || idCard == "") {
                        layer.msg("身份证必须上传！");
                        return false;
                    }
                    if (vehicleLicense == null || vehicleLicense == "") {
                        layer.msg("车辆行驶证必须上传！");
                        return false;
                    }
                    if (registrationCertificate == null || registrationCertificate == "") {
                        layer.msg("机动车登记证书上传！");
                        return false;
                    }
                    if (businessInsurancePolicy == null || businessInsurancePolicy == "") {
                        layer.msg("机动车商业保险单必须上传！");
                        return false;
                    }
                    $.ajax({
                        type: 'POST',
                        url: '${basePath}/admin/loan/saveOrUpdate.html',
                        data: $("#loanForm").serializeArray(),
                        dataType: "text",
                        success: function (data) {
                            if (data == '0000') {
                                layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                    document.location.href =
                                            '${basePath}/admin/loan/myPersonalLoanList.html';
                                    return true;
                                });
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
            });
        });

    </script>
</head>

<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li><a class="link-01" href="${basePath}/admin/loan/loanInfoList.html">借款管理</a></li>
        <li>填写借款申请</li>
    </ul>
</div>
<div class="main-con">

    <div class="normal-title clearfix">
        <h1>借款申请</h1>
    </div>
    <div class="normal-area">
        <form class="form-inline clearfix" action="javascript:;" id="loanForm" method="POST">
            <div id="loanError"></div>
            <div class="title clearfix"><h2>基本信息</h2></div>
            <div class="con clearfix">
                <div class="row">
                    <input type="text" hidden id="uuid" name="uuid" value="${loanInfo.uuid}">
                    <input type="text" hidden id="loanId" name="loanId" value="${loanInfo.uuid}">
                    <input type="text" hidden id="customerId" name="customerId">
                    <input type="text" hidden id="mobile" name="mobile" >

                    <div class="form-group col-md-5">
                        <strong class="cred">*</strong><label>借款人：</label>
                        <input type="text" class="form-control" autofocus id="loaner"
                               name="loaner" value="${loanInfo.customerRegisterInfo.customerName}">
                        <span class="corange" id="phone"></span>
                    </div>
                    <div class="form-group col-md-5">
                        <label>身份证号码：</label>
                        <input type="text" class="form-control" id="idCard" name="idCard"
                               value="${loanInfo.idCard}" readonly="readonly">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <strong class="cred">*</strong><label>借款金额：</label>
                        <input type="text" class="form-control" name="applyMoney" id="applyMoney"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false"
                               value='<fmt:formatNumber value="${loanInfo.applyMoney}"
                               type="number" pattern="#"/>'>元
                    </div>
                    <div class="form-group col-md-4">
                        <strong class="cred">*</strong><label>借款用途：</label>
                            <select class="form-control" name="loanPurpose" id="loanPurpose">
                                <option value="生意周转">生意周转</option>
                                <option value="采购原材料">采购原材料</option>
                                <option value="房屋装修">房屋装修</option>
                                <option value="发工资">发工资</option>
                                <option value="支付货款">支付货款</option>
                                <option value="other">其他</option>
                            </select>
                        <%--<input type="text" class="form-control" name="loanPurpose"--%>
                               <%--value="${loanInfo.loanPurpose}">--%>
                    </div>
                    <div class="form-group col-md-4" id="supplement"></div>
                </div>
                <div class="row">
                    <div class="form-group col-md-12">
                        <strong class="cred">*</strong><label>还款来源介绍：<br></label>
                        <textarea name="repaySource" cols="100" rows="3"
                                  class="form-control">${loanInfo.repaySource}</textarea>
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>利率、期限：</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-4" id="yearinstrest">
                        <strong class="cred">*</strong><label>年利率：</label>
                        <input type="text" class="form-control" size="5" name="loanRate"
                               id="year_rate"
                               value="<fmt:formatNumber  value="${loanInfo.loanRate}" pattern="#.##"/>">
                        %
                    </div>
                    <div class="form-group col-md-4" id="monthinstrest">
                        <strong class="cred">*</strong><label>月利率：</label>
                        <input type="text" class="form-control" size="5" id="monthly_rate"
                               name="monthlyRate"> %
                    </div>
                    <div class="form-group col-md-4">
                        <strong class="cred">*</strong><label>借款期限：</label>
                        <input type="text" class="form-control" size="5" name="loanLimitTime"
                               id="loanLimitTime" value="${loanInfo.loanLimitTime}"> 月
                        <input type="text" hidden="hidden" name="loanLimitTimeUnit" value="month">
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>其他费用：</h2>
            </div>
            <div class="con clearfix" >
                <div class="row" id="manage_fee">
                    <div class="form-group col-md-4">
                        <label>管理费：</label>
                        <input type="text" class="form-control" id="managerFee" readonly = "readonly"
                               value="1.0" name="manageFee" size="5"> %
                    </div>
                </div>
                <div class="row"  id="depreciation_fee">
                    <div class="form-group col-md-4">
                        <label>车辆折旧费：</label>
                        <input type="text" class="form-control" id="depreciationFee"
                               value="21.84" name="depreciationFee" size="5"  onkeyup="if(isNaN(value))execCommand('undo')" onafterpaste="if(isNaN(value))execCommand('undo')" > <label id="percentage">%</label>
                    </div>
                </div>

                <div class="row" id="drunkdrive_fee">
                    <div class="form-group col-md-4">
                        <label>酒毒驾：</label>
                        <select class="form-control" id="drunkDrive" name="drunkDrive">
                            <option value="1000">1000</option>
                            <option value="2000">2000</option>
                        </select>
                    </div>
                </div>

                <div class="row" id="cashdeposit_fee">
                    <div class="form-group col-md-4">
                        <label>保证金：</label>
                        <input type="text" class="form-control" id="cashdepositFee"
                               value="5.0" name="cashdepositFee" size="5" readonly = "readonly" > %
                    </div>
                </div>

                <div class="row" id="certificate_fee">
                    <div class="form-group col-md-4">
                        <label>认证费：</label>
                        <input type="text" class="form-control" id="certificatefee"
                               value="400" name="certificatefee" size="5" readonly = "readonly" >
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>押车/押证：</label>
                        <select class="form-control" id="pledgeType" name="pledgeType">
                            <option value="drivePledge">押证</option>
                            <option value="vehiclePledge">押车</option>
                        </select>
                    </div>

                    <div class="form-group col-md-4" id="gps">
                        <label>GPS：</label>
                        <select class="form-control" id="gpsWay" name="gpsWay">
                            <option value="">请选择</option>
                            <option value="gps_month_cost">按月支付租金</option>
                            <option value="gps_once_cost">一次买断</option>
                        </select>
                    </div>
                    <label id="gpsLabel"></label>
                </div>
                <div class="tips-box"></div>
            </div>

            <div class="title clearfix">
                <h2>还款信息</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-8">
                        <label>还款方式：</label>
                        <select class="form-control" id="repayWay" name="repayWay">
                            <option value="AverageCapitalPlusInterest"
                                    <c:if test="${loanInfo.repayWay eq 'AverageCapitalPlusInterest'}">selected</c:if>>
                                等本等息
                            </option>
                            <option value="InterestRatesBefore"
                                    <c:if test="${loanInfo.repayWay eq 'InterestRatesBefore'}">selected</c:if>>
                                先息后本
                            </option>
                            <option value="flexiblerepaymentv2"
                                    <c:if test="${loanInfo.repayWay eq 'flexiblerepaymentv2'}">selected</c:if>>
                                灵活还款
                            </option>
                            <option value="averagePrincipalreduceinterest"
                                    <c:if test="${loanInfo.repayWay eq 'averagePrincipalreduceinterest'}">selected</c:if>>
                                等本减息
                            </option>
                            <option value="averagePrincipalzerointerestrent"
                                    <c:if test="${loanInfo.repayWay eq 'averagePrincipalzerointerestrent'}">selected</c:if>>
                                等本零息
                            </option>
                            <option value="intrestbeforePrincipalrent"
                                    <c:if test="${loanInfo.repayWay eq 'intrestbeforePrincipalrent'}">selected</c:if>>
                                先息后本(押证)
                            </option>
                            <option value="intrestbeforePrincipaltransfer"
                                    <c:if test="${loanInfo.repayWay eq 'intrestbeforePrincipaltransfer'}">selected</c:if>>
                                先息后本(押车)
                            </option>
                        </select>
                        <a href="#plan-list" class="btn btn-03 plan-show">生成还款计划</a>
                    </div>
                </div>
                <div class="plan-area">
                    <a name="plan-list"></a>

                    <div class="plan-title">还款列表</div>
                    <div class="plan-con">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                               class="table table-condensed table-hover tb-01">
                            <thead>
                            <tr>
                                <th>期数</th>
                                <th>还款本金</th>
                                <th>还款利息</th>
                                <th>本息和</th>
                                <th>剩余本金</th>
                                <th>管理费</th>
                                <th>GPS费用</th>
                                <th>查档费</th>
                                <th>停车费</th>
                                <th>折旧费</th>
                                <th>毒酒驾</th>
                                <th>保证金</th>
                                <th>认证费</th>
                                <th>提前还款</th>
                                <th>还款日期</th>
                            </tr>
                            </thead>
                            <tbody id="repayPlayDetail">

                            </tbody>

                            <c:forEach items="${repayPlan.planList}" var="plan">
                                <tr>
                                    <td align='center'>${plan.repayPeriod}</td>
                                    <td align='center'>${plan.repayCapital}</td>
                                    <td align='center'>${plan.repayInterest}</td>
                                    <td align='center'>${plan.repayTotal}</td>
                                    <td align='center'>${plan.surplusCapital}</td>
                                    <td align='center'>${plan.manageFee}</td>
                                    <td align='center'>${plan.gpsCost}</td>
                                    <td align='center'>${plan.checkCost}</td>
                                    <td align='center'>${plan.parkCost}</td>
                                    <td align='center'>${plan.depreciationFee}</td>
                                    <td align='center'>${plan.drunkDrive}</td>
                                    <td align='center'>${plan.cashdepositFee}</td>
                                    <td align='center'>${plan.certificateFee}</td>
                                    <td align='center'>${plan.advancerepay}</td>
                                    <td align='center'><fmt:formatDate value="${plan.repayDate}"
                                                                       pattern="yyyy-MM-dd" /></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${repayPlan != null}">
                                <tr>
                                    <td align='center'>总额：</td>
                                    <td align='center'>${repayPlan.sumCaptial}</td>
                                    <td align='center'>${repayPlan.sumInvest}</td>
                                    <td align='center'>${repayPlan.sumInvest + repayPlan.sumCaptial}</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                    <td align='center'>----</td>
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>账号信息</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-4">
                        <strong class="cred">*</strong><label>开户名：</label>
                        <input type="text" class="form-control" size="10" name="accountName"
                               id="accountName" value="${accountInfo.accountName}">
                    </div>
                    <div class="form-group col-md-4">
                        <strong class="cred">*</strong><label>开户行：</label>
                        <input type="text" class="form-control" id="bankName"
                               name="bankName" value="${accountInfo.bankName}">
                    </div>
                    <div class="form-group col-md-4">
                        <strong class="cred">*</strong><label>银行账号：</label>
                        <input type="text" class="form-control" name="accountNum"
                               onkeyup="this.value=this.value.replace(/[^\d]/g,'')"
                               onpaste="return false"
                               value="${accountInfo.accountNum}">
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>必传附件<span class="small_span">(支持.jpg、.png、.pdf格式，上传.pdf将自动转为.jpg格式。)</span></h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">身份证：<span id="idCardFileuploadSpan"
                                                         class="cred">(必传)</span></label>
                        <input id="idCardFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/idCardType.html" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="label-s">车辆行驶证：<span
                                id="vehicleLicenseFileuploadSpan"
                                class="cred">(必传)</span></label>
                        <input id="vehicleLicenseFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/vehicleLicense.html" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">机动车登记证书：<span
                                id="registrationCertificateFileuploadSpan"
                                class="cred">(必传)</span></label>
                        <input id="registrationCertificateFileupload" type="file"
                               class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/registrationCertificate.html" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="label-s">机动车商业保险单：<span
                                id="businessInsurancePolicyFileuploadSpan"
                                class="cred">(必传)
                                    </span></label>
                        <input id="businessInsurancePolicyFileupload" type="file"
                               class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/businessInsurancePolicy.html" />
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>可选附件</h2>
            </div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">附件：<span id="otherFileuploadSpan" class="cblue">(可选)
                        </span></label>
                        <input id="otherFileupload" type="file" class="form-control" name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/other.html" />
                    </div>
                </div>
            </div>

            <div class="title clearfix">
                <h2>已上传附件</h2>

                <div class="checkbox pull-right">
                    <a href="javascript:init();" class="btn btn-link">刷新附件</a>|<a
                        href="javascript:deleteLoanAttachment();" class="btn btn-link">删除选中附件</a>
                </div>
            </div>
            <div class="con clearfix" id="loan_attachment_div">
                <!-- load loanAttachment页面 -->
            </div>

            <div class="row">
                <div class="form-group col-md-12">
                    <strong class="cred">*</strong><label>主办意见：</label>
                        <textarea cols="168" rows="3" class="form-control" id="hostOpinion"
                                  name="hostOpinion">${loanInfo.hostOpinion}</textarea>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-12">
                    <strong class="cred">*</strong><label>备注：</label>
                        <textarea cols="168" rows="3" class="form-control" id="remark"
                                  name="remark">${loanInfo.remark}</textarea>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-4">
                    <strong class="cred">*</strong><label>所属分公司：</label>
                    <select class="form-control" id="companyId" name="companyId">
                        <option value="0">请选择</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <strong class="cred">*</strong><label>所属部门：</label>
                    <select class="form-control" id="deptId" name="deptId">
                        <option value="0">请选择</option>
                    </select>
                </div>
                <div class="form-group col-md-4">
                    <strong class="cred">*</strong><label>所属客户经理：</label>
                    <select class="form-control" name="responsibleCmId" id="responsibleCmId">
                        <option value="0">请选择</option>
                    </select>
                </div>
            </div>

            <div class="title clearfix">
                <h2>联系人信息</h2>
            </div>
            <div class="con clearfix">

                <div class="row">
                    <input type="hidden" id="spouse_id" />

                    <div class="form-group col-md-3">
                        <label>配偶姓名：</label>
                        <input type="text" class="form-control" readonly="readonly"
                               id="spouse_name" size="5">
                    </div>
                    <div class="form-group col-md-3">
                        <label>单位电话：</label>
                        <input type="text" class="form-control" id="spouse_tel"
                               readonly="readonly" size="10">
                    </div>
                    <div class="form-group col-md-3">
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="spouse_mobile"
                               readonly="readonly" size="14">
                    </div>
                    <div class="form-group col-md-3">
                        <label>知晓本次借款：</label>
                        <input type="checkbox" id="spouse_ck"
                               onclick="isKnowLoan('#spouse_id', '#spouse_ck')">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="immediate_id1" />

                    <div class="form-group col-md-3">
                        <label>直系亲属姓名：</label>
                        <input type="text" class="form-control" id="immediate_name1"
                               readonly="readonly" size="5">
                    </div>
                    <div class="form-group col-md-3">
                        <label>关系：</label>
                        <input type="text" class="form-control" id="immediate_relation1"
                               readonly="readonly" size="8">
                    </div>
                    <div class="form-group col-md-3">
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="immediate_Mobile1"
                               readonly="readonly" size="15">
                    </div>
                    <div class="form-group col-md-3">
                        <label>知晓本次借款：</label>
                        <input type="checkbox" id="immediate_ck1"
                               onclick="isKnowLoan('#immediate_id1', '#immediate_ck1')">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="immediate_id2" />

                    <div class="form-group col-md-3">
                        <label>直系亲属姓名：</label>
                        <input type="text" class="form-control" id="immediate_name2"
                               readonly="readonly" size="5">
                    </div>
                    <div class="form-group col-md-3">
                        <label>关系：</label>
                        <input type="text" class="form-control" id="immediate_relation2"
                               readonly="readonly" size="8">
                    </div>
                    <div class="form-group col-md-3">
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="immediate_Mobile2"
                               readonly="readonly" size="15">
                    </div>
                    <div class="form-group col-md-3">
                        <label>知晓本次借款：</label>
                        <input type="checkbox" id="immediate_ck2"
                               onclick="isKnowLoan('#immediate_id2', '#immediate_ck2')">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="other_id1" />

                    <div class="form-group col-md-3">
                        <label>其他联系人姓名：</label>
                        <input type="text" class="form-control" id="other_name1"
                               readonly="readonly" size="5">
                    </div>
                    <div class="form-group col-md-3">
                        <label>关系：</label>
                        <input type="text" class="form-control" id="other_relation1"
                               readonly="readonly" size="8">
                    </div>
                    <div class="form-group col-md-3">
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="other_mobile1"
                               readonly="readonly" size="15">
                    </div>
                    <div class="form-group col-md-3">
                        <label>知晓本次借款：</label>
                        <input type="checkbox" id="other_ck2" onclick="isKnowLoan('#other_id1',
                        '#other_ck2')">
                    </div>
                </div>
                <div class="row">
                    <input type="hidden" id="other_id2" />

                    <div class="form-group col-md-3">
                        <label>其他联系人姓名：</label>
                        <input type="text" class="form-control" id="other_name2"
                               readonly="readonly" size="5">
                    </div>
                    <div class="form-group col-md-3">
                        <label>关系：</label>
                        <input type="text" class="form-control" id="other_relation2"
                               readonly="readonly" size="8">
                    </div>
                    <div class="form-group col-md-3">
                        <label>手机号码：</label>
                        <input type="text" class="form-control" id="other_mobile2"
                               readonly="readonly" size="15">
                    </div>
                    <div class="form-group col-md-3">
                        <label>知晓本次借款：</label>
                        <input type="checkbox" id="other_ck" onclick="isKnowLoan('#other_id2',
                        '#other_ck')">
                    </div>
                </div>
                <div class="tips-box"></div>
            </div>

            <div class="btn-area">
                <input type="submit" class="btn btn-01" id="submit" value="提交申请">
            </div>
        </form>
    </div>

</div>
</body>

<script type="text/javascript">
    $(function () {
        init();
        /** 身份证 */
        $('#idCardFileupload').fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#idCardFileuploadSpan'));
            }
        });

        /** 车辆行驶证 */
        $("#vehicleLicenseFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#vehicleLicenseFileuploadSpan'));
            }
        });
        /** 机动车登记证书 */
        $("#registrationCertificateFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#registrationCertificateFileuploadSpan'));
            }
        });

        /** 机动车商业保险单 */
        $("#businessInsurancePolicyFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#businessInsurancePolicyFileuploadSpan'));
            }
        });

        /** 其他附件 */
        $("#otherFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#otherFileuploadSpan'));
            }
        });

        var doneProcess = function (data, obj) {
            $.each(data.result, function (index, file) {
                if (file.code == "0000") {
                    obj.removeClass("cblue");
                    obj.addClass("cgreen");
                    obj.text("已上传");
                    layer.msg("上传成功！");
                    /** 查询出借款附件 */
                    $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}")
                } else {
                    layer.msg(file.message);
                }
            });
        };

        /** 动态加载公司列表 */
        var companyIdObj = $("#companyId");
        $.get("${basePath}/admin/company/queryCompanyList.html", function (result) {
            var html = '';
            $(result).each(function (i) {
                html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
            });
            companyIdObj.append(html);

            /*修改时选中所属公司*/
            companyIdObj.find("option[value='" + ${loanInfo.companyId} +"']").attr("selected", true);

            /*获取部门的方法*/
            getDept('${loanInfo.companyId}');
        });

        /*动态加载公司部门*/
        companyIdObj.live("change", function () {
            getDept(this.value);
        });

        /* 根据公司Id查询部门*/
        var deptIdObj = $("#deptId");
        var getDept = function (companyId) {
            if (companyId != null && companyId != "") {
                $.get("${basePath}/admin/dept/queryDeptComById?companyId=" + companyId + "&type=yw", function (result) {
                    var html = '';
                    $(result).each(function (i) {
                        html += '<option value="' + result[i].id + '">' + result[i].name +
                                '</option>';
                    });
                    deptIdObj.html(html);
                    if (result[0] != null) {
                        getUsers($("#companyId").val(), result[0].id);
                    }

                    deptIdObj.find('option[value="' + '${loanInfo.deptId}' + '"]').attr("selected", true);

                    getUsers('${loanInfo.companyId}', '${loanInfo.deptId}');
                });
            }
        };

        /*动态加载公司部门名下所有员工*/
        deptIdObj.live("change", function () {
            getUsers($("#companyId").val(), this.value);
        });

        var getUsers = function (companyId, deptId) {
            var responsibleCmIdObj = $("#responsibleCmId");
            $.get("${basePath}/admin/user/queryComIdDeptId.html?companyId=" + companyId + "&deptId=" + deptId,
                    function (result) {
                        var html = '<option value="0">请选择</option>';
                        $(result).each(function (i) {
                            html += '<option value="' + result[i].uuid + '">' + result[i].realname +
                                    '</option>';
                        });
                        responsibleCmIdObj.html(html);

                        /* 选中部门负责人 */
                        responsibleCmIdObj.find('option[value="'+'${loanInfo.responsibleCmId}'+'"]').attr("selected", true);
                    });
        };

        $("#gpsWay").live("change", function () {
            $.get("${basePath}/admin/getSysParameter.html?sysKey=" + $("#gpsWay").val(),
                    function (result) {
                        $("#gpsLabel").text(result);
                    });
        });

        $("#pledgeType").live("change", function () {
            var pledgeType = $("#pledgeType").val();
            if (pledgeType === 'vehiclePledge') {
                $("#gps").addClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").addClass("hidden");
            } else {
                $("#gps").removeClass("hidden");
                $("#drunkdrive_fee").removeClass("hidden");
            }
        });

        //设置初始状态
        //管理费
        $("#manage_fee").removeClass("hidden");
        //保证金
        $("#cashdeposit_fee").removeClass("hidden");
        //醉毒驾
        $("#drunkdrive_fee").removeClass("hidden");
        //折旧费
        $("#depreciation_fee").addClass("hidden");
        //认证费
        $("#certificate_fee").addClass("hidden");
        //根据还款方式确定各个费用的表示方式
        $("#repayWay").live("change", function () {
            var repayWay = $("#repayWay").val();
            if ((repayWay === 'AverageCapitalPlusInterest')||
                (repayWay === 'InterestRatesBefore')) {
                //管理费
                $("#manage_fee").removeClass("hidden");
                //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").addClass("hidden");
                //认证费
                $("#certificate_fee").addClass("hidden");
                //年利率
                $("#yearinstrest").removeClass("hidden");
                //月利率
                $("#monthinstrest").removeClass("hidden");
                //设置月利率
                $("#monthly_rate").attr("value","");
                //设置月利率为不可调整
                $("#monthly_rate").removeAttr("disabled");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide();

            } else if (repayWay === 'flexiblerepaymentv2'){
                //灵活还款
                $("#manage_fee").addClass("hidden");
                //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").removeClass("hidden");
                //认证费
                $("#certificate_fee").addClass("hidden");
                //年利率
                $("#yearinstrest").addClass("hidden");
                //月利率
                $("#monthinstrest").addClass("hidden");
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").attr("disabled","disabled");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide();
                $("#percentage").show();

            } else if (repayWay === 'averagePrincipalreduceinterest'){
                //等本减息
                //管理费
                $("#manage_fee").addClass("hidden");
                //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").addClass("hidden");
                //认证费
                $("#certificate_fee").addClass("hidden");
                //年利率
                $("#yearinstrest").addClass("hidden");
                //设置月利率
                $("#monthly_rate").attr("value","2.33");
                //设置月利率为不可调整
                $("#monthly_rate").attr("disabled","disabled");
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").attr("disabled","disabled");
                //提前还款
                $("#table1 tr td::nth-child(14)").show();
                $("#percentage").show();
            } else if (repayWay === 'averagePrincipalzerointerestrent'){
                //等本零息(押证)
                $("#manage_fee").addClass("hidden");
                 //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").removeClass("hidden");  
                //认证费
                $("#certificate_fee").addClass("hidden");  
                //年利率
                $("#yearinstrest").addClass("hidden");
                //月利率
                $("#monthinstrest").addClass("hidden"); 
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").attr("disabled","disabled");    
                //提前还款
                $("#table1 tr td::nth-child(14)").hide();      
                $("#percentage").show();
            }else if (repayWay === 'intrestbeforePrincipalrent') {
                //先息后本(押证)
                $("#manage_fee").addClass("hidden");
                 //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").removeClass("hidden");
                //折旧费
                $("#depreciation_fee").removeClass("hidden"); 
                //认证费
                $("#certificate_fee").addClass("hidden"); 
                //设置押车模式
                $("#pledgeType").attr("value","drivePledge");
                //设置为只读模式
                $("#pledgeType").attr("disabled","disabled");
                 //年利率
                $("#yearinstrest").removeClass("hidden");
                //月利率
                $("#monthinstrest").removeClass("hidden");
                 //设置月利率为不可调整
                $("#monthly_rate").removeAttr("disabled");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide(); 
                $("#percentage").hide();
            }else if (repayWay === 'intrestbeforePrincipaltransfer') {
                //先息后本(押车)
                 $("#manage_fee").addClass("hidden");
                 //保证金
                $("#cashdeposit_fee").removeClass("hidden");
                //醉毒驾
                $("#drunkdrive_fee").addClass("hidden");
                //折旧费
                $("#depreciation_fee").addClass("hidden"); 
                //认证费
                $("#certificate_fee").removeClass("hidden"); 
                //设置押车模式
                $("#pledgeType").attr("value","vehiclePledge");
                //设置为只读模式
                $("#pledgeType").attr("disabled","disabled");
                 //年利率
                $("#yearinstrest").removeClass("hidden");
                //月利率
                $("#monthinstrest").removeClass("hidden");
                //提前还款
                $("#table1 tr td::nth-child(14)").hide(); 
                $("#percentage").show();
            }
        });
        /** 生成还款计划 */
        var getGenerateLoanReplayPlan = function () {
            var applyMoney = $("#applyMoney").val();// 借款金额
            var loanLimitTimeUnit = $("#loanLimitTime").val();// 期限
            var loanRate = $("#year_rate").val();// 借款年利率
            var repaymentPattern = $('#repayWay').val();// 还款方式
            var uuid = $("#uuid").val();
            var gpsWay = $("#gpsWay").val();

            var pledgeType = $("#pledgeType").val();// 抵押方式：押证/押车
            if (pledgeType === 'vehiclePledge') {//押车
                gpsWay = "";
            }
            var depreciationFee = $("#depreciationFee").val();//折旧费
            var drunkDrive = $("#drunkDrive").find("option:selected").text();//毒酒驾
            var cashdepositFee = $("#cashdepositFee").val(); //保证金
            var certificatefee = $("#certificatefee").val(); //认证费

            //如果是等额本金和先息后本
            if ((repaymentPattern === 'AverageCapitalPlusInterest')||
                (repaymentPattern === 'InterestRatesBefore')) {
                //对条件进行判断
            if (applyMoney == "" || loanLimitTimeUnit == "" || loanRate == "" || repaymentPattern
                    == "") {
                layer.msg("请先填写借款金额、年利率、借款期限等信息!");
                return false;
                }       
            }else if (repaymentPattern === 'flexiblerepaymentv2') {
                //灵活还款
                 if (applyMoney == "" || loanLimitTimeUnit == "" || depreciationFee == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
                loanRate = depreciationFee;
            }else if (repaymentPattern === 'averagePrincipalreduceinterest') {
                //等本减息
                 if (applyMoney == "" || loanLimitTimeUnit == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、借款期限等信息!");
                    return false;
                } 
            }else if (repaymentPattern === 'AveragePrincipalzerointerestrent') {
                //等本零息
                 if (applyMoney == "" || loanLimitTimeUnit == "" || depreciationFee == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
                loanRate = depreciationFee;
            }else if (repaymentPattern === 'intrestbeforePrincipalrent') {
                //等本零息(押证)
                 if (applyMoney == "" || loanLimitTimeUnit == "" || depreciationFee == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
               //loanRate = depreciation_fee;
            }else if (repaymentPattern === 'intrestbeforePrincipaltransfer') {
                //等本零息(押车)
                 if (applyMoney == "" || loanLimitTimeUnit == "" || loanRate == "" || repaymentPattern == "") {
                    layer.msg("请先填写借款金额、折旧费、借款期限等信息!");
                    return false;
                } 
            }


            if (depreciationFee == null) {
                depreciationFee = 0;
            }
            
            if(drunkDrive == null){
                drunkDrive = 0;
            }
            
            if(cashdepositFee == null){
                cashdepositFee = 0;
            }
            
            if(certificatefee == null){
                certificatefee = 0;
            }

            $.ajax({
                type: 'GET',
                url: '${basePath}/admin/loan/getGenerateLoanReplayPlan.html',
                data: {
                    "uuid": uuid,
                    "applyMoney": applyMoney,
                    "loanLimitTimeUnit": loanLimitTimeUnit,
                    "loanRate": loanRate,
                    "repaymentPattern": repaymentPattern,
                    "manageFee": $("#managerFee").val(),
                    "gpsWay" : gpsWay,
                    "pledgeType": pledgeType,
                    "depreciationFee":depreciationFee,     //折旧费
                    "drunkDrive":drunkDrive,             //毒酒驾
                    "cashdepositFee":cashdepositFee,     //保证金
                    "certificatefee":certificatefee      //认证费
                },
                dataType: "json",
                success: function (data) {
                    var html = "'";
                    if (data == "9999") {
                        layer.msg("操作失败!");
                        return false;
                    } else {
                        for (var i = 0; i < data.planList.length; i++) {

                            var date = new Date(data.planList[i].repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
                            html += "<tr>";
                            html += "<td align='center'>" + data.planList[i].repayPeriod + "</td>";
                            html += "<td align='center'>" + data.planList[i].repayCapital + "</td>";
                            html += "<td align='center'>" + data.planList[i].repayInterest + "</td>";
                            html += "<td align='center'>" + data.planList[i].repayTotal + "</td>";
                            html += "<td align='center'>" + data.planList[i].surplusCapital + "</td>";
                            html += "<td align='center'>" + data.planList[i].manageFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].gpsCost + "</td>";
                            html += "<td align='center'>" + data.planList[i].checkCost + "</td>";
                            html += "<td align='center'>" + data.planList[i].parkCost + "</td>";
                            html += "<td align='center'>" + data.planList[i].depreciationFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].drunkDrive + "</td>";
                            html += "<td align='center'>" + data.planList[i].cashdepositFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].certificateFee + "</td>";
                            html += "<td align='center'>" + data.planList[i].advancerepay + "</td>";
                            html += "<td align='center'>" + date + "</td>";
                            html += "</tr>";
                        }
                        html += "<tr>";
                        html += "<td align='center'>合计：</td>";
                        html += "<td align='center'>" + data.sumCaptial + "</td>";
                        html += "<td align='center'>" + data.sumInvest + "</td>";
                        html += "<td align='center'>" + accAdd(data.sumInvest, data.sumCaptial) + "</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "<td align='center'>----</td>";
                        html += "</tr>";
                        $("#repayPlayDetail").html(html);
                    }
                }, error: function (e) {
                    layer.msg("操作失败!可能原因：" + e);
                    return false;
                }
            });
        };

        $(".plan-show").click(function () {
            getGenerateLoanReplayPlan();
        });
    });

    init = function () {
        $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}",function(){
            checkAttachmentUploaded();
        });
    };


    /** 判断附件是否已经上传 */
    var checkAttachmentUploaded = function () {
        /**调整借款合同，改变已上传附件的样式*/
        var idCardFileupload1 = $("#idCardType").val();//身份证
        if (idCardFileupload1 !== undefined && idCardFileupload1 != null && idCardFileupload1 != "") {
            var idCardFileuploadSpanObj = $("#idCardFileuploadSpan");
            idCardFileuploadSpanObj.removeClass("cblue");
            idCardFileuploadSpanObj.addClass("cgreen");
            idCardFileuploadSpanObj.text("已上传");
        }
        var vehicleLicenseFileupload1 = $("#vehicleLicense").val();//车辆行驶证
        if (vehicleLicenseFileupload1 !== undefined && vehicleLicenseFileupload1 != null && vehicleLicenseFileupload1 != "") {
            var vehicleLicenseFileuploadSpanObj = $("#vehicleLicenseFileuploadSpan");
            vehicleLicenseFileuploadSpanObj.removeClass("cblue");
            vehicleLicenseFileuploadSpanObj.addClass("cgreen");
            vehicleLicenseFileuploadSpanObj.text("已上传");
        }
        var registrationCertificateFileupload1 = $("#registrationCertificate").val();//机动车登记证书
        if (registrationCertificateFileupload1 !== undefined && registrationCertificateFileupload1 != null && registrationCertificateFileupload1 != "") {
            var registrationCertificateFileuploadSpanObj = $("#registrationCertificateFileuploadSpan");
            registrationCertificateFileuploadSpanObj.removeClass("cblue");
            registrationCertificateFileuploadSpanObj.addClass("cgreen");
            registrationCertificateFileuploadSpanObj.text("已上传");
        }
        var businessInsurancePolicyFileupload1 = $("#businessInsurancePolicy").val();//机动车商业保险单
        if (businessInsurancePolicyFileupload1 !== undefined && businessInsurancePolicyFileupload1 != null && businessInsurancePolicyFileupload1 != "") {
            var businessInsurancePolicyFileuploadSpanObj = $("#businessInsurancePolicyFileuploadSpan");
            businessInsurancePolicyFileuploadSpanObj.removeClass("cblue");
            businessInsurancePolicyFileuploadSpanObj.addClass("cgreen");
            businessInsurancePolicyFileuploadSpanObj.text("已上传");
        }
        var otherFileupload1 = $("#other").val();//其他附件
        if (otherFileupload1 !== undefined && otherFileupload1 != null && otherFileupload1 != "") {
            var otherFileuploadSpanObj = $("#otherFileuploadSpan");
            otherFileuploadSpanObj.removeClass("cblue");
            otherFileuploadSpanObj.addClass("cgreen");
            otherFileuploadSpanObj.text("已上传");
        }

    };


    /** 删除附件 */
    function deleteLoanAttachment() {
        var loanAttIds = [];//定义一个数组
        $('input[name="attachmentId"]:checked').each(function () {
            loanAttIds.push($(this).val());
        });

        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/deleteLoanAttachment.html',
            data: {
                "loanAttIds": loanAttIds
            },
            dataType: "text",
            success: function (data) {
                if (data == "0000") {
                    layer.msg("删除成功!");
                    init();
                    return true;
                } else {
                    layer.msg("操作失败!");
                    return false;
                }
            }, error: function (e) {
                layer.msg("操作失败!可能原因：" + e);
                return false;
            }
        });
    }

</script>
</html>
