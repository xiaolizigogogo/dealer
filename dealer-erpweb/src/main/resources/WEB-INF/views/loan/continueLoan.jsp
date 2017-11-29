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
    <title>e车贷管理系统--借款展期续借</title>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">

    <script type="text/javascript" src="${basePath}/js/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>

    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
</head>

<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li>借款展期续借</li>
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
                    </div>
                    <div class="plan-con">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                               class="table table-bordered table-striped table-hover tb-01">
                            <tr>
                                <th>期数</th>
                                <th>应还本金</th>
                                <th>应还利息</th>
                                <th>本息和</th>
                                <th>剩余本金</th>
                                <th>管理费</th>
                                <th>GPS费用</th>
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
                                    <td align='center'>${plan.surplusCapital}</td>
                                    <td align='center'>${plan.manageFee}</td>
                                    <td align='center'>${plan.gpsCost}</td>
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
                                </tr>
                            </c:if>
                        </table>
                    </div>
                </div>
            </div>

            <div class="title clearfix"><h2>借款展期续借</h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-4">
                        <label>续借金额：</label>
                        <input type="text" value="${continueMoney}" name="continueAmount" id="continueAmount"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>续借期限：</label>
                        <select class="form-control" name="continueLimit" id="continueLimit">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label><strong class="cred">*</strong>续借开始时间：</label>

                        <div class="form-group">
                            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="continueDate"
                                 data-link-format="yyyy-mm-dd">
                                <input class="form-control" type="text"
                                       readonly="readonly">
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span></span>
                            </div>
                            <input type="text" hidden="hidden" id="continueDate"
                                   name="continueDate" />
                        </div>
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
                                完成续借</label>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <div class="radio">
                            <label>
                                <input type="radio" value="return"
                                       name="reviewStatus">
                                续借审核有误，需调整续借手续</label>
                        </div>
                    </div>
                </div>
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
        $("#submit").on("click", submit);
    });

    function submit() {

        var reviewStatus = $("input[name='reviewStatus']:checked").val();

        var continueAmount = $("#continueAmount").val();
        var continueLimit = $("#continueLimit").val();
        var continueDate = $("#continueDate").val();
        var dialogMsg = "续借审核有误，退回调整续借手续?";
        if (reviewStatus === "passed") {
            dialogMsg = "续借" + continueAmount + "元， 续借" + continueLimit + "期，确定提交吗？";
        }
        layer.confirm(dialogMsg, {icon: 3, title: '提示'}, function () {
	        var load;
            $.ajax({
                type: 'POST',
                url: '${basePath}/admin/loan/continueLoanReview.html',
	            beforeSend: function () {
		            load = layer.load();
	            },
                data: {
                    "loanId": $("#loanId").val(),
                    "taskId": '${taskId}',
                    "reviewStatus": reviewStatus,
                    "continueAmount": continueAmount,
                    "continueLimit": continueLimit,
                    "continueDate": continueDate
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
</script>
</body>
</html>
