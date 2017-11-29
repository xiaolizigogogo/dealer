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
    <title>e车贷管理系统--
        <c:if test="${type eq 'repaymented'}">
            正常还款审核
        </c:if>
        <c:if test="${type eq 'continueRepayment'}">
            续借还款审核
        </c:if>
        <c:if test="${type eq 'advancedRepaymented'}">
            提前还款审核
        </c:if>
    </title>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />

    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>

    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
</head>

<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li>
            <c:if test="${type eq 'repaymented'}">
                正常还款审核
            </c:if>
            <c:if test="${type eq 'continueRepayment'}">
                续借还款审核
            </c:if>
            <c:if test="${type eq 'advancedRepaymented'}">
                提前还款审核
            </c:if>
        </li>
    </ul>
</div>
<div class="main-con">
    <form class="form-inline clearfix" action="javascript:;" method="POST">
        <div class="normal-area">
            <div class="tab-content pad-t-10">
                <div class="tab-pane active">
                    <div class="title clearfix"><h2>基本信息</h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div class="con clearfix">
                        <input type="hidden" name="loanId" id="loanId" value="${loanInfo.uuid}">
                        <input type="hidden" name="taskId" id="taskId" value="${taskId}">

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>审批金额：</label>
                                <c:if test="${loanInfo.loanMoney == '0.00'}">
                                    ----
                                </c:if>
                                <c:if test="${loanInfo.loanMoney != '0.00'}">
                                    <a href="#" class="link-01"><fmt:formatNumber
                                            value="${loanInfo.loanMoney}" type="currency" /></a>
                                </c:if>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>申请金额：</label><a href="#" class="link-01"><fmt:formatNumber
                                    value="${loanInfo.applyMoney}" type="currency" /></a>
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款人：</label><a
                                    href="${basePath}/admin//customer/queryCustomerDetail.html?uuid=${loanInfo.customerId}"
                                    class="link-01" title="查看借款人详细信息"
                                    >${loanInfo.customerRegisterInfo.customerName}</a>
                            </div>
                            <div class="form-group col-md-4">
                                <label>申请时间：</label><fmt:formatDate value="${loanInfo.applyedAt}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>借款用途：</label>${loanInfo.loanPurpose}
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款编号：</label>${fn:substring(loanInfo.uuid, 0, 10)}
                            </div>
                            <div class="form-group col-md-4">
                                <label>所属分公司：</label>${loanInfo.company.name}
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>所属部门：</label>${loanInfo.dept.name}
                            </div>
                            <div class="form-group col-md-4">
                                <label>所属客户经理：</label>${loanInfo.responsibleBy.realname}
                            </div>
                            <div class="form-group col-md-4">
                                <label>录入人：</label>${loanInfo.createBy.realname}
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>录入时间：</label><fmt:formatDate value="${loanInfo.createdAt}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>还款来源介绍：</label>${loanInfo.repaySource}
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="title clearfix"><h2>还款计划信息</h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="tab-pane">
                <div class="plan-area-02">
                    <div class="row">
                        <div class="col-md-4">
                            <label>借款金额：</label><c:if test="${loanInfo.loanMoney != '0.00'}">
                            <fmt:formatNumber value="${loanInfo.loanMoney}" type="currency" />
                        </c:if>
                        </div>
                        <div class="col-md-4">
                            <label>年利率：</label><fmt:formatNumber value="${loanInfo.loanRate}"
                                                                 pattern="0.00" />%
                        </div>
                        <div class="form-group col-md-4">
                            <label>月利率：</label><fmt:formatNumber value="${loanInfo.loanRate/12}"
                                                                 pattern="0.00" />%
                        </div>
                        <div class="form-group col-md-4">
                            <label>借款期限：</label>${loanInfo.loanLimitTime}
                            <c:if test="${loanInfo.loanLimitTimeUnit eq 'month'}"> 个月</c:if>
                        </div>
                        <div class="form-group col-md-4">
                            <label>押车/押证：</label>
                            <c:if test="${loanInfo.pledgeType eq 'vehiclePledge'}">押车</c:if>
                            <c:if test="${loanInfo.pledgeType eq 'drivePledge'}">押证</c:if>
                        </div>
                    </div>
                    <div class="plan-con">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                               class="table table-bordered table-striped table-hover tb-01">
                            <tr>
                                <th>期数</th>
                                <th>应还本金</th>
                                <th>应还利息</th>
                                <th>本息和</th>
                                <th>管理费</th>
                                <th>GPS费用</th>
                                <th>查档费</th>
                                <th>停车费</th>
                                <th>剩余本金</th>
                                <th>折旧费</th>
                                <th>毒酒驾</th>
                                <th>保证金</th>
                                <th>认证费</th>
                                <th>还款日期</th>
	                            <th>是否还款</th>
                            </tr>
                            <c:forEach items="${repayPlan.planList}" var="plan">
                                <tr>
                                    <td align='center'>${plan.repayPeriod}</td>
                                    <td align='center'>${plan.repayCapital}</td>
                                    <td align='center'>${plan.repayInterest}</td>
                                    <td align='center'>${plan.repayTotal}</td>
                                    <td align='center'>${plan.manageFee}</td>
                                    <td align='center'>${plan.gpsCost}</td>
                                    <td align='center'>${plan.checkCost}</td>
                                    <td align='center'>${plan.parkCost}</td>
                                    <td align='center'>${plan.surplusCapital}</td>
                                    <td align='center'>${plan.depreciationFee}</td>
                                    <td align='center'>${plan.drunkDrive}</td>
                                    <td align='center'>${plan.cashdepositFee}</td>
                                    <td align='center'>${plan.certificateFee}</td>
                                    <td align='center'><fmt:formatDate value="${plan.repayDate}"
                                                                       pattern="yyyy-MM-dd" /></td>
	                                <td align="center">
		                                <c:if test="${plan.isRepay eq 1}">已还款</c:if>
		                                <c:if test="${plan.isRepay eq 0}"><font color="red">未还
		                                </font></c:if>
	                                </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${repayPlan != null}">
                                <tr>
                                    <td align='center'>合计</td>
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
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>

            <div class="title clearfix"><h2>实际还款信息</h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="tab-pane">
                <div class="plan-area-02">
                    <div class="plan-con">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                               class="table  table-bordered table-striped table-hover tb-01">
                            <tr>
                                <th>期数</th>
                                <th>实收本金</th>
                                <th>实收利息</th>
                                <th>实收本息和</th>
                                <%--<th>实收管理费</th>--%>
                                <%--<th>实收GPS费用</th>--%>
                                <%--<th>还款日期</th>--%>
	                            <th>状态</th>
	                            <th>还款凭证</th>
                            </tr>
                            <c:forEach items="${repayments}" var="rep">
                                <tr>
                                    <td align='center'>${rep.repayPlanDetail.repayPeriod}</td>
                                    <c:if test="${rep.repaymentTransactions.size() > 0}">
                                        <td align='center'>${rep.repaymentTransactions.get(0).actualRepaymentCaptialSum}</td>
                                        <td align='center'>${rep.repaymentTransactions.get(0).actualRepaymentInterestSum}</td>
                                        <td align='center'>${rep.repaymentTransactions.get(0).actualRepaymentSum}</td>
                                    </c:if>
                                    <c:if test="${rep.repaymentTransactions.size() == 0}">
                                        <td align='center'>----</td>
                                        <td align='center'>----</td>
                                        <td align='center'>----</td>
                                    </c:if>
                                    <%--<td align='center'>${rep.repayPlanDetail.manageFee}</td>--%>
                                    <%--<td align='center'>${rep.repayPlanDetail.gpsCost}</td>--%>
                                    <%--<td align='center'><fmt:formatDate--%>
		                                    <%--value="${rep.repaymentTransaction.createDay}"--%>
                                                                       <%--pattern="yyyy-MM-dd" /></td>--%>
	                                <td align='center'>
	                                    <c:if test="${rep.status eq '5'}"><font color="red">
	                                                                            正常还款审核</font></c:if>
		                                <c:if test="${rep.status eq '6'}"><font color="red">
			                                续借还款审核</font></c:if>
		                                <c:if test="${rep.status eq '7'}"><font color="red">
			                                提前还款审核</font></c:if>
		                                <c:if test="${rep.status eq '8'}">正常还款成功</c:if>
		                                <c:if test="${rep.status eq '9'}">续借还款成功</c:if>
		                                <c:if test="${rep.status eq '10'}">提前还款成功</c:if>
		                                <c:if test="${rep.status eq '11'}">放弃还款</c:if>
	                                </td>
	                                <td align='center'><a title="${rep.loanInfoAttachment.attachmentTitle}"
			                                href="${rep.loanInfoAttachment.attachmentPath}"
			                                              target="_blank" class="link-01">查看凭证
	                                </a> </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>

            <div class="title clearfix"><h2>还款备注信息</h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="tab-pane">
                <div class="plan-area-02">
                    <div class="plan-con">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                               class="table  table-bordered table-striped table-hover tb-01">
                            <tr>
                                <th>操作人</th>
                                <th>节点</th>
                                <th>备注</th>
                                <th>时间</th>
                            </tr>
                            <c:forEach items="${loanRepayReviewInfo}" var="lrr">
                                <tr>
                                    <td>${lrr.user.realname}</td>
                                    <td>
                                        <c:if test="${lrr.reviewLevel eq 'urgeRepayment'}">还款催收</c:if>
                                        <c:if test="${lrr.reviewLevel eq 'repaymenting'}">还款</c:if>
                                        <c:if test="${lrr.reviewLevel eq 'repaymented'}">正常还款审核</c:if>
                                        <c:if test="${lrr.reviewLevel eq 'continueRepayment'}">续借还款审核</c:if>
                                        <c:if test="${lrr.reviewLevel eq 'advancedRepaymented'}">提前还款审核</c:if>
                                        <c:if test="${lrr.reviewLevel eq 'lateProcessing'}">逾期处理</c:if>
                                        <c:if test="${lrr.reviewLevel eq 'continueRenew'}">续借处理</c:if>
                                    </td>
                                    <td>${lrr.reviewConclusion}</td>
                                    <td><fmt:formatDate value="${lrr.createdAt}"
                                                        pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>

            <div class="title clearfix"><h2>
	            <c:if test="${type eq 'repaymented'}">
	                正常还款审核备注信息
                </c:if>
	            <c:if test="${type eq 'continueRepayment'}">
		            续借还款审核备注信息
	            </c:if>
	            <c:if test="${type eq 'advancedRepaymented'}">
		            提前还款审核备注信息
	            </c:if></h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-12"><strong class="cred">*</strong>
                        <label>备注：</label>
                            <textarea cols="150" rows="2" class="form-control" id="remark"
                                      name="remark"></textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-4">
                        评审结论：
                    </div>
                    <div class="form-group col-md-4">
                        <div class="radio">
                            <label>
                                <input type="radio" value="passed" name="reviewStatus"
                                       checked>
                                确认无误进行还款</label>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <div class="radio">
                            <label>
                                <input type="radio" value="rejected"
                                       name="reviewStatus">
                                凭证有误，驳回</label>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-md-12">
                        <label>还款金额:</label>
                        <input type="text" class="form-control" autofocus id="repaymentAmount"
                               onkeyup="displayUpper()"
                               onpaste="return false">
                        <span id="upper" class="cred"></span>
                    </div>
                </div>
                <div class="tips-box"></div>

                <div class="btn-area">
                    <input type="submit" class="btn btn-01" id="submit"
                           value="提&nbsp;&nbsp;&nbsp;&nbsp;交">
                </div>
            </div>
        </div>
    </form>
</div>
<script type="application/javascript">

    $(function () {
        $("#submit").on("click", repaymentReview);
    });

    function repaymentReview() {

        var reviewStatus = $("input[name='reviewStatus']:checked").val();
        var repaymentAmount = "";
        var remark = $("#remark").val();

        var dialogMsg = "凭证有误，驳回";
        if ("passed" === reviewStatus) {
            repaymentAmount = $("#repaymentAmount").val();
            if (repaymentAmount == null || repaymentAmount == '') {
                layer.msg("还款金额不能为空!");
                return;
            }
            dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
        }

        if (remark === "") {
            layer.msg("审查备注不能为空!");
            return;
        }

        layer.confirm(dialogMsg, {icon: 3, title: '提示'}, function () {
	        var load;
            $.ajax({
                type: 'POST',
                url: '${basePath}/admin/loan/completeRepaymentReview.html',
	            beforeSend: function () {
		            load = layer.load();
	            },
                data: {
                    "loanId": $("#loanId").val(),
                    "repaymentAmount": repaymentAmount,
                    "type": '${type}',
                    "taskId": '${taskId}',
                    "reviewStatus" : reviewStatus,
                    "remark": remark,
                    "repaymentUuid": '${repaymentUuid}'
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
	                    layer.close(load);
	                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            document.location.href = '${basePath}/admin/todo?method=showTodolist';
                            return true;
                        });
                    } else {
	                    layer.close(load);
	                    layer.alert("操作失败!可能原因：" + data, {icon: 2});
                        return false;
                    }
                }, error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                    return false;
                }
            })
        });
    }

    function displayUpper() {
        var repaymentAmount = $("#repaymentAmount").val();
	    if (!$.isNumeric(repaymentAmount)) {
		    $("#repaymentAmount").val('');
	    }
        if (repaymentAmount != null && repaymentAmount != '') {
            $("#upper").text(atoc(repaymentAmount));
        }
    }




</script>
</body>
</html>
