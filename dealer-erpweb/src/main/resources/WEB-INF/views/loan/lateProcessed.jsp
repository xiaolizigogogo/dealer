<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="<%= request.getContextPath() %>"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统--风控二次处理</title>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/css.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/js/layer/skin/layer.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css"/>
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css"/>
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
        function back() {
            window.history.back();
        }
    </script>
</head>

<body>
<div class="loca-area clearfix">
    <ul class="breadcrumb">
        <li><a class="link-01" href="${basePath}/admin/layout/main.html">主页</a></li>
        <li><a class="link-01" href="#">还款催收</a></li>
        <li>还款详情</li>
    </ul>
</div>
<div class="main-con">

    <div class="normal-area">
        <ul class="nav nav-tabs tabs-01" role="tablist">
            <li class="active"><a href="#tabcon-01" role="tab" data-toggle="tab">借款详情</a></li>
            <li><a href="#tabcon-02" role="tab" data-toggle="tab">还款计划</a><span
                    class="badge">${repayPlan.planList.size()}</span></li>

            <!--
              <li><a href="#tabcon-03" role="tab" data-toggle="tab">还款附件</a><span
                    class="badge">${loanInfoAttachmentSize}</span></li>
              <li><a href="#tabcon-03" role="tab" data-toggle="tab">借款附件</a><span
                    class="badge">${loanInfoAttachmentSize}</span></li>
            -->
            <li><a href="#tabcon-05" role="tab" data-toggle="tab">历史借款</a><span
                    class="badge">${historyLoanlist.size()}</span></li>
            <li><a href="#tabcon-04" role="tab" data-toggle="tab">还款备注</a><span
                    class="badge">${loanReviewRecordSize}</span></li>

            <%--<li>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返回上一步" onclick="back()" class="btn btn-01" /></li>--%>
        </ul>
        <div class="tab-content pad-t-10">
            <!--[if !IE]>tabcon-01 start<![endif]-->
            <div class="tab-pane active" id="tabcon-01">
                <form class="form-inline clearfix">
                    <div class="title clearfix"><h2>基本信息</h2>&nbsp;&nbsp;&nbsp;&nbsp;
                        <c:if test="${loanInfo.loanStatus eq 'signContract' or
                                        loanInfo.loanStatus eq 'signContract_rejected' or
                                        loanInfo.loanStatus eq 'dataReview' or
                                        loanInfo.loanStatus eq 'reuploadInformatin' or
                                        loanInfo.loanStatus eq 'lended'}">
                            <a href="${basePath}/admin/loan/getLoanContractDetail.html?loanId=${loanInfo.uuid}"
                               target="_blank"><span class="small_span">(查看借款合同)</span>
                            </a>
                            <a href="${basePath}/admin/loan/getLoanReceipt.html?loanId=${loanInfo.uuid}"
                               target="_blank"><span class="small_span">(查看借款收据)</span>
                            </a>
                            <a href="${basePath}/admin/loan/getLoanPledgeGuaranteeContract.html?loanId=${loanInfo.uuid}"
                               target="_blank"><span class="small_span">(查看机动车质押合同)</span>
                            </a>
                            <a href="${basePath}/admin/loan/getLoanPledgeContract.html?loanId=${loanInfo.uuid}"
                               target="_blank"><span class="small_span">(查看抵押合同)</span>
                            </a>
                        </c:if>
                    </div>
                    <div class="con clearfix">
                        <input type="hidden" name="loanId" id="loanId" value="${loanInfo.uuid}">

                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>审批金额：</label>
                                <c:if test="${loanInfo.loanMoney == '0.00'}">
                                </c:if>
                                <c:if test="${loanInfo.loanMoney != '0.00'}">
                                    <a href="#" class="link-01"><fmt:formatNumber
                                            value="${loanInfo.loanMoney}" type="currency"/></a>
                                </c:if>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>申请金额：</label><a href="###" class="link-01"><fmt:formatNumber
                                    value="${loanInfo.applyMoney}" type="currency"/></a>
                            </div>
                            <div class="form-group col-md-4">
                                <label>还款状态：</label><strong class="corange">
                                <c:if test="${repayment.status == 0}">开始催收还款</c:if>
                                <c:if test="${repayment.status == 1}">逾期处理</c:if>
                                <c:if test="${repayment.status == 2}">已催收还款(短信电话通知)</c:if>
                                <c:if test="${repayment.status == 3}">还款处理</c:if>
                                <c:if test="${repayment.status == 4}">申请续借</c:if>
                                <c:if test="${repayment.status == 5}">正常还款</c:if>
                                <c:if test="${repayment.status == 6}">续借还款</c:if>
                                <c:if test="${repayment.status == 7}">提前还款</c:if>
                            </strong>
                            </div>

                            <div class="form-group col-md-4">
                                <label>借款人：</label><a
                                    href="${basePath}/admin//customer/queryCustomerDetail.html?uuid=${loanInfo.customerId}"
                                    class="link-01" title="查看借款人详细信息">${loanInfo.customerRegisterInfo.customerName}</a>
                            </div>

                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>申请时间：</label><fmt:formatDate value="${loanInfo.applyedAt}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款用途：</label>${loanInfo.loanPurpose}
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款编号：</label>${fn:substring(loanInfo.uuid, 0, 10)}
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>所属分公司：</label>${loanInfo.company.name}
                            </div>
                            <div class="form-group col-md-4">
                                <label>所属部门：</label>${loanInfo.dept.name}
                            </div>
                            <div class="form-group col-md-4">
                                <label>所属客户经理：</label>${loanInfo.responsibleBy.realname}
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>录入人：</label>${loanInfo.createBy.realname}
                            </div>
                            <div class="form-group col-md-4">
                                <label>录入时间：</label><fmt:formatDate value="${loanInfo.createdAt}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>还款来源介绍：</label>${loanInfo.repaySource}
                            </div>
                        </div>
                    </div>

                    <div class="title clearfix">
                        <h2>利率、期限</h2>
                    </div>
                    <div class="con clearfix">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>年利率：</label><fmt:formatNumber value="${loanInfo.loanRate}"
                                                                     pattern="0.00"/>%
                            </div>
                            <div class="form-group col-md-4">
                                <label>月利率：</label><fmt:formatNumber value="${loanInfo.loanRate/12}"
                                                                     pattern="0.00"/>%
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款期限：</label>${loanInfo.loanLimitTime}
                                <c:if test="${loanInfo.loanLimitTimeUnit eq 'month'}"> 个月</c:if>
                            </div>
                        </div>
                    </div>



                    <div class="title clearfix">
                        <h2>联系人信息</h2>
                    </div>
                    <div class="con clearfix">


                        <div class="row">
                            <input type="hidden" id="name_id"/>
                            <div class="form-group col-md-3">
                                <label>借款人姓名：</label>
                                <input type="text" class="form-control" readonly="readonly"
                                       id="name_name" size="5" value="${customerRegisterInfo.customerName}">
                            </div>
                            <div class="form-group col-md-3">
                                <label>单位电话：</label>
                                <input type="text" class="form-control" id="name_tel"
                                       readonly="readonly" size="10" value="${customerAdditionalInfo.enterpriseTel}">
                            </div>
                            <div class="form-group col-md-3">
                                <label>手机号码：</label>
                                <input type="text" class="form-control" id="name_mobile"
                                       readonly="readonly" size="14" value="${customerRegisterInfo.mobile}">
                            </div>
                            <div class="form-group col-md-3">
                                <label>知晓本次借款：</label>
                                <input type="checkbox" id="name_ck" checked="checked">
                            </div>
                        </div>

                        <div class="row">
                            <input type="hidden" id="spouse_id"/>

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
                            <input type="hidden" id="immediate_id1"/>

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
                            <input type="hidden" id="immediate_id2"/>

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
                            <input type="hidden" id="other_id1"/>

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
                                <input type="checkbox" id="other_ck2"
                                       onclick="isKnowLoan('#other_id1', '#other_ck2')">
                            </div>
                        </div>
                        <div class="row">
                            <input type="hidden" id="other_id2"/>

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
                                <input type="checkbox" id="other_ck"
                                       onclick="isKnowLoan('#other_id2','#other_ck')">
                            </div>
                        </div>
                        <div class="tips-box"></div>
                    </div>
                    <br/>


                    <div class="title clearfix">
                        <h2>还款信息</h2>
                    </div>


                    <div class="main-con">
                        <div class="table-area" id="con_one_1">
                            <table border="0" cellspacing="0" cellpadding="0"
                                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
                                <tr>
                                    <th>项目名称</th>
                                    <th>还款期数</th>
                                    <th>还款本金</th>
                                    <th>还款利息</th>
                                    <th>gps费用</th>
                                    <th>停车费</th>
                                    <th>管理费用</th>
                                    <th>折旧费</th>
                                    <th>毒酒驾</th>
                                    <th>保证金</th>
                                    <th>认证费</th>
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
                                <c:forEach items="${repaymentList}" var="l">
                                    <tr>
                                        <td align="center">${l.prodectName }</td>
                                        <td align="center">${l.repayPeriod }</td>
                                        <td align="center">${l.repayCap}</td>
                                        <td align="center">${l.repayIns}</td>
                                        <td align="center">${l.gpsCost}</td>
                                        <td align='center'>${l.parkCost}</td>
                                        <td align="center">${l.manageFee}</td>
                                        <td align='center'>${plan.depreciationFee}</td>
                                        <td align='center'>${plan.drunkDrive}</td>
                                        <td align='center'>${plan.cashdepositFee}</td>
                                        <td align='center'>${plan.certificateFee}</td>
                                        <td align="center"><fmt:formatDate value="${l.repayDate}"
                                                                           pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td align="center"><fmt:formatDate value="${l.acutRepaymentTime}"
                                                                           pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td align="center">${l.repayTotal}</td>
                                        <td align="center">${l.actuRpaymentSum}</td>
                                        <td align="center">${l.overdueDay}</td>
                                        <td align="center">${l.overdueFee}</td>
                                        <c:if test="${l.isRepay == 1}">
                                            <td align="center">已还款</td>
                                        </c:if>
                                        <c:if test="${l.isRepay == 0}">
                                            <td align="center">待还清</td>
                                        </c:if>

                                        <c:if test="${l.repaymentType == 'commonRepayment'}">
                                            <td align="center">正常还款</td>
                                        </c:if>
                                        <c:if test="${l.repaymentType == 'continueRepayment'}">
                                            <td align="center">续借还款</td>
                                        </c:if>
                                        <c:if test="${l.repaymentType == 'advancedRepayment'}">
                                            <td align="center">提前还款</td>
                                        </c:if>

                                        <c:if test="${empty  l.repaymentType}">
                                            <td align="center">尚未还款</td>
                                        </c:if>

                                        <c:if test="${l.repayType == 'AverageCapitalPlusInterest'}">
                                            <td align="center">等额本息</td>
                                        </c:if>
                                        <c:if test="${l.repayType == 'InterestRatesBefore'}">
                                            <td align="center">先息后本</td>
                                        </c:if>
                                        <c:if test="${l.repayType == 'flexiblerepaymentv2'}">
                                            <td align="center">灵活还款</td>
                                        </c:if>
                                        <c:if test="${l.repayType == 'averagePrincipalreduceinterest'}">
                                            <td align="center">等本减息</td>
                                        </c:if>
                                        <c:if test="${l.repayType == 'averagePrincipalzerointerestrent'}">
                                            <td align="center">等本零息(押证)</td>
                                        </c:if>
                                        <c:if test="${l.repayType == 'intrestbeforePrincipaltransfer'}">
                                            <td align="center">先息后本(押车)</td>
                                        </c:if>
                                        <c:if test="${l.repayType == 'intrestbeforePrincipalrent'}">
                                            <td align="center">先息后本(押证)</td>
                                        </c:if>
                                    </tr>

                                </c:forEach>
                            </table>
                        </div>
                    </div>




                    <div class="title clearfix">
                        <h2>附件信息</h2>
                    </div>
                    <div class="main-con">
                        <div class="table-area" id="con_one_5">
                            <table border="0" cellspacing="0" cellpadding="0"
                                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
                                <tr>
                                    <th>附件编号</th>
                                    <th>附件标题</th>
                                    <th>是否有效</th>
                                    <th>查看</th>
                                </tr>
                                <c:forEach items="${attachmentLoanList}" var="l">
                                    <tr>
                                        <td align="center">${l.id }</td>
                                        <td align="center">${l.attachmentTitle }</td>
                                        <c:if test="${l.isValid == true}">
                                            <td align="center">是</td>
                                        </c:if>
                                        <c:if test="${l.isValid == false}">
                                            <td align="center">无效</td>
                                        </c:if>
                                        <td align="center"><a href="${l.attachmentPath}" target="_blank" class="link-01">查看</a></td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                    <div class="title clearfix">
                        <h2>当期还款</h2>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-md-4">
                            <label>还款信息：</label>${repayment.name}
                        </div>
                        <div class="form-group col-md-4">
                            <label>应还款时间：</label>
                            <fmt:formatDate value="${repayment.repayPlanDetail.repayDate}" pattern="yyyy年MM月dd日"/>
                        </div>
                        <div class="form-group col-md-4">
                            <label>逾期天数：</label><strong class="corange">${repayment.repayPlanDetail.overdueDay}</strong>
                        </div>
                        <div class="form-group col-md-4">
                            <label>还款本金：</label>${repayment.repayPlanDetail.repayCapital}元
                        </div>
                        <div class="form-group col-md-4">
                            <label>还款利息：</label>${repayment.repayPlanDetail.repayInterest}元
                        </div>
                        <div class="form-group col-md-4">
                            <label>罚息金额：</label><strong class="corange">${repayment.repayPlanDetail.overdueFee}</strong>
                        </div>
                        <div class="form-group col-md-4">
                            <label>还款方式：</label>${repayment.repaymentType}
                        </div>
                        <div class="form-group col-md-4">
                            <label>管理费：</label>${repayment.repayPlanDetail.manageFee}
                        </div>
                        <div class="form-group col-md-4">
                            <label>GPS费用：</label>${repayment.repayPlanDetail.gpsCost}
                        </div>
                        <div class="form-group col-md-4">
                            <label>最低还款金额：</label>${repayment.minPay}
                        </div>
                        <div class="form-group col-md-4">
                            <label>总还款金额：</label>
                            <c:if test="${empty repayment.countSum}">0.00元</c:if>
                            <c:if test="${!empty repayment.countSum}"> ${repayment.countSum}元</c:if>
                        </div>
                        <input type="hidden" id="customerId" value=${loanInfo.customerId}>
                    </div>



                    <div class="title clearfix">
                        <h2>拖车信息</h2>
                    </div>
                    <div class="main-con">
                        <div class="table-area" id="con_one_2">
                            <table border="0" cellspacing="0" cellpadding="0"
                                   class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">

                                <tr>
                                    <th>车辆品牌</th>
                                    <th>车辆型号</th>
                                    <th>车牌号</th>
                                    <th>发动机号</th>
                                    <th>颜色</th>
                                    <th>排量</th>
                                    <th>车架号</th>
                                    <th>购置日期</th>
                                    <th>拖车状态</th>
                                </tr>

                                <tr>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.vehicleBrand}</td>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.vehicleModels}</td>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.vehicleNo}</td>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.engineNo}</td>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.color}</td>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.displacement}</td>
                                        <td align="center">${loanInfo.guaranteeEvaluateInfo.vehicleIdentification}</td>
                                        <td align="center"><fmt:formatDate value="${loanInfo.guaranteeEvaluateInfo.purchaseDate}" pattern="yyyy年MM月dd日"/></td>

                                        <c:if test="${loanInfo.guaranteeEvaluateInfo.towStatus == 'alreadyTowTruck'}">
                                            <td align="center">已拖车</td>
                                        </c:if>
                                        <c:if test="${loanInfo.guaranteeEvaluateInfo.towStatus == 'noTowTruck'}">
                                            <td align="center">未能拖到车</td>
                                        </c:if>
                                    </tr>
                            </table>
                        </div>
                    </div>



                    <div class="title clearfix">
                        <h2>风控处理意见</h2>
                    </div>
                    <br/>

                    <div class="row">
                        <div class="form-group col-md-12"><strong class="cred">*</strong>
                            <label>处理意见备注</label>
                            <textarea cols="150" rows="2" class="form-control" id="callRemark"
                                      name="callRemark"></textarea>
                        </div>
                    </div>
                    <br/>

                    <div class="title clearfix">
                        <h2>拖车处理</h2>
                    </div>
                    <br/>

                    <div class="row">
                        <div>
                            &nbsp; &nbsp; &nbsp;
                            <button type="button" class="btn btn-01" name="submit1" id="submit1"
                                    onclick="javascript:lateProcessed('countinueAdjust')">继续拖车
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button type="button" class="btn btn-01" name="submit3" id="submit4"
                                    onclick="javascript:lateProcessed('interestHandle')">申请调整罚息
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button type="button" class="btn btn-01" name="submit3" id="submit5"
                                    onclick="javascript:lateProcessed('tracked')">已拖车处理
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button type="button" class="btn btn-01" name="submit3" id="submit6"
                                    onclick="javascript:lateProcessed('loanApplyEnd')">申请坏账
                            </button>
                            &nbsp; &nbsp; &nbsp;
                            <button type="button" class="btn btn-01" name="submit3" id="submit7"
                                    onclick="javascript:lateProcessed('countinueUrgeRepayment')">继续催收
                            </button>

                        </div>
                    </div>

                </form>
            </div>
            <!--[if !IE]>tabcon-01 end<![endif]-->

            <!--[if !IE]>tabcon-02 start<![endif]-->
            <div class="tab-pane" id="tabcon-02">
                <div class="plan-area-02">
                    <div class="row">
                        <div class="col-md-4">
                            <label>借款金额：</label><fmt:formatNumber value="${loanInfo.applyMoney}"
                                                                  type="currency"/>
                        </div>
                        <div class="col-md-4">
                            <label>年利率：</label><fmt:formatNumber value="${loanInfo.loanRate}"
                                                                 pattern="0.00"/>%
                        </div>
                        <div class="form-group col-md-4">
                            <label>月利率：</label><fmt:formatNumber value="${loanInfo.loanRate/12}"
                                                                 pattern="0.00"/>%
                        </div>
                        <div class="form-group col-md-4">
                            <label>借款期限：</label>${loanInfo.loanLimitTime}
                            <c:if test="${loanInfo.loanLimitTimeUnit eq 'month'}"> 个月</c:if>
                        </div>
                    </div>
                    <div class="plan-title">还款列表</div>
                    <div class="plan-con">
                        <table width="100%" border="0" cellspacing="0" cellpadding="0"
                               class="table table-condensed table-hover tb-01">

                            <tr>
                                <th>期数</th>
                                <th>应还本金</th>
                                <th>应还利息</th>
                                <th>本息和</th>
                                <th>剩余本金</th>
                                <th>管理费</th>
                                <th>GPS费用</th>
                                <th>还款日期</th>
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
                                    <td align='center'><fmt:formatDate value="${plan.repayDate}"
                                                                       pattern="yyyy-MM-dd"/></td>
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
                                </tr>

                            </c:if>
                        </table>
                    </div>
                </div>
            </div>
            <!--[if !IE]>tabcon-02 end<![endif]-->


            <!--[if !IE]>tabcon-03 start<![endif]-->
            <div class="tab-pane" id="tabcon-03">
                <c:if test="${processDefinitionId eq 'signContract'}">
                    <div class="checkbox pull-right">
                        <a href="javascript:init();" class="btn btn-link">刷新附件</a>|<a
                            href="javascript:deleteLoanAttachment();"
                            class="btn btn-link">删除选中附件</a>
                    </div>
                </c:if>
                <div class="con clearfix" id="loan_attachment_div">
                    <!-- load loanAttachment页面 -->
                </div>
                <!--[if !IE]>tabcon-03 end<![endif]-->
            </div>


            <!--[if !IE]>tabcon-04 start<![endif]-->
            <div class="tab-pane" id="tabcon-04">
                <div class="con clearfix" id="loan_review_div">
                    <!-- load loanReviewRecord 页面 -->
                </div>
            </div>
            <!--[if !IE]>tabcon-04 end<![endif]-->




            <!--[if !IE]>tabcon-05 start<![endif]-->
            <div class="tab-pane" id="tabcon-05">
                <div class="con clearfix" id="loan_history_div">
                    <div class="table-area" id="con_one_4">
                        <table border="0" cellspacing="0" cellpadding="0"
                               class="table table-bordered table-condensed table-striped table-hover tb-01 tb-font-s">
                            <tr>
                                <th>姓名</th>
                                <th>身份证号码</th>
                                <th>申请金额</th>
                                <th>审批金额</th>
                                <th>申请时间</th>
                                <th>借款状态</th>
                                <th>借款所属公司</th>
                                <th>借款所属部门</th>
                                <th>客户经理</th>
                            </tr>
                            <c:if test="${historyLoanlist != null}">
                                <c:forEach items="${historyLoanlist}" var="historyLoanlist">
                                    <tr>
                                        <td align='center' title="查看借款详情"
                                                ><a
                                                href="${basePath}/admin/loan/loanDetail/${historyLoanlist.uuid}/detail.html">
                                                ${historyLoanlist.customerRegisterInfo.customerName}</a></td>
                                        <td align='center'>${historyLoanlist.idCard}</td>
                                        <td align='center'>${historyLoanlist.applyMoney}</td>
                                        <td align='center'>${historyLoanlist.loanMoney}</td>
                                        <td align='center'><fmt:formatDate
                                                value="${historyLoanlist.applyedAt}"
                                                pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        <td align="center">
                                            <c:if test="${historyLoanlist.loanStatus eq 'vehicleAssess'}">待车辆评估</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'departLeadAduit'}">待初审</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'departLeadAduit_rejected'}">初审不通过</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'trialPhase'}">待总部面审</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'trialPhase_rejected'}">总部面审不通过</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'callBack'}">待总部电话回访</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'visiteCheck'}">待线下上门核实</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'judgment'}">待总部终审</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'judgment_rejected'}">总部终审不通过</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'signContract'}">待线下签订相关合同</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'signContract_rejected'}">签订合同终止</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'dataReview'}">资料复核</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'reuploadInformatin'}">资料或相关合同重新上传</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'lended'}">待出账</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'repayment'}">还款中</c:if>
                                            <c:if test="${historyLoanlist.loanStatus eq 'end'}">已完结</c:if>
                                        </td>
                                        <td align='center'>${historyLoanlist.company.name}</td>
                                        <td align='center'>${historyLoanlist.dept.name}</td>
                                        <td align='center'>${historyLoanlist.responsibleBy.realname}</td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test="${empty historyLoanlist}">
                                <tr>
                                    <td align='center' colspan="8">暂无数据</td>
                                </tr>
                            </c:if>
                        </table>
                    </div>

                </div>
            </div>
            <!--[if !IE]>tabcon-05 end<![endif]-->




            <!-- 评审 start -->
            <!-- 评审 end -->
        </div>
    </div>
</div>
<script>


    /**
     * 逾期处理
     */
    function lateProcessed(flag) {

        var repaymentContent = $("#callRemark").val();
        var taskId = "${taskId}";

        var reviewStatusStr = "";

        if (flag == "countinueAdjust") {
            reviewStatusStr = "继续拖车"
        } else if (flag == "interestHandle") {
            reviewStatusStr = "申请调整罚息"
        } else if(flag == "tracked"){
            reviewStatusStr = "已拖车辆处理"
        } else if(flag == "loanApplyEnd"){
            reviewStatusStr = "申请坏账"
        } else if(flag == "countinueUrgeRepayment"){
            reviewStatusStr = "继续催收"
        }

        if(repaymentContent == "" || repaymentContent == null){
            layer.msg("备注信息不能为空！")
            return;
        }

        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";

        layer.confirm(dialogMsg, {icon: 3, title: '提示'}, function () {

            $.ajax({
                type: 'POST',
                url: '${basePath}/admin/loan/completeLateProcessed',
                data: {
                    "remarkContent": repaymentContent,
                    "taskId": taskId,
                    "repaymentFlag": flag
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            document.location.href = '${basePath}/admin/todo?method=showTodolist';
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
        })

    }
    ;


    $(function () {
        /** 加载附件 */
        $("#loan_attachment_div").load("${basePath}/admin/loan/getRepaymentUploadLoanAttachment.html?loanId=${loanInfo.uuid}", function () {
            checkAttachmentUploaded();
        })

        /** 还款评审页面 */
        $("#loan_review_div").load("${basePath}/admin/loan/review/record/repayment/${loanInfo.uuid}.html");

        /** 借款人联系人信息 */
        $.get("${basePath}/admin/customer/queryContactsCusId.html?uuid=${loanInfo.customerId}",
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
                });


        /** 面审视频截图 */
        $("#trialPhaseReviewFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#trialPhaseReviewFileuploadSpan'));
            }
        });

        /** 回访相片 */
        $("#visiteCheckReviewFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#visiteCheckReviewFileuploadSpan'));
            }
        });

        /** 出账凭证 */
        $("#lendedReviewFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#lendedReviewFileuploadSpan'));
            }
        });


        /** 还款凭证 */
        $("#repaymentUploadProofUpload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#repaymentUploadProofUploadSpan'));
            }
        });


        /** 非本地户口另需居住证 */
        $("#registerUpload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#registerUploadSpan'));
            }
        });

        /** 机动车交通强制保险单 */
        $("#insurancePolicyFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#insurancePolicyFileuploadSpan'));
            }
        });

        /** 车辆备用钥匙 */
        $("#falseKeyFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#falseKeyFileuploadSpan'));
            }
        });

        /** 车辆购置税完税证明 */
        $("#fahrzeugbeschaffungFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#fahrzeugbeschaffungFileuploadSpan'));
            }
        });

        /** 相关合同附件 */
        $("#signContractFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#signContractFileuploadSpan'));
            }
        });
    });

    var doneProcess = function (data, obj) {
        $.each(data.result, function (index, file) {
            if (file.code == "0000") {
                obj.removeClass("cblue");
                obj.addClass("cgreen");
                obj.text("已上传");
                layer.msg("上传成功！");
                init();
            } else {
                layer.msg(file.message);
            }
        });
    };


    init = function () {
        $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${repayment.uuid}", function () {
            checkAttachmentUploaded();
        });
    };

    /** 判断附件是否已经上传 */
    var checkAttachmentUploaded = function () {
        /**调整借款合同，改变已上传附件的样式*/
        var trialPhaseReview1 = $("#trialPhaseReview").val();//面审视频截图
        if (trialPhaseReview1 !== undefined && trialPhaseReview1 != null && trialPhaseReview1 != "") {
            var trialPhaseReviewFileuploadSpanObj = $("#trialPhaseReviewFileuploadSpan");
            trialPhaseReviewFileuploadSpanObj.removeClass("cblue");
            trialPhaseReviewFileuploadSpanObj.addClass("cgreen");
            trialPhaseReviewFileuploadSpanObj.text("已上传");
        }


        var visiteCheckReview1 = $("#visiteCheckReview").val();//上传回访相片
        if (visiteCheckReview1 !== undefined && visiteCheckReview1 != null && visiteCheckReview1 != "") {
            var visiteCheckReviewFileuploadSpanObj = $("#visiteCheckReviewFileuploadSpan");
            visiteCheckReviewFileuploadSpanObj.removeClass("cblue");
            visiteCheckReviewFileuploadSpanObj.addClass("cgreen");
            visiteCheckReviewFileuploadSpanObj.text("已上传");
        }
        var verification1 = $("#verification").val();//非本地户口另需居住证
        if (verification1 !== undefined && verification1 != null && verification1 != "") {
            var registerUploadSpanObj = $("#registerUploadSpan");
            registerUploadSpanObj.removeClass("cblue");
            registerUploadSpanObj.addClass("cgreen");
            registerUploadSpanObj.text("已上传");
        }
        var lendedReview1 = $("#lendedReview").val();//出账凭证
        if (lendedReview1 !== undefined && lendedReview1 != null && lendedReview1 != "") {
            var lendedReviewFileuploadSpanObj = $("#lendedReviewFileuploadSpan");
            lendedReviewFileuploadSpanObj.removeClass("cblue");
            lendedReviewFileuploadSpanObj.addClass("cgreen");
            lendedReviewFileuploadSpanObj.text("已上传");
        }

        var insurancePolicy1 = $("#insurancePolicy").val();//机动车交通强制保险单
        if (insurancePolicy1 !== undefined && insurancePolicy1 != null && insurancePolicy1 != "") {
            var insurancePolicyFileuploadSpanObj = $("#insurancePolicyFileuploadSpan");
            insurancePolicyFileuploadSpanObj.removeClass("cblue");
            insurancePolicyFileuploadSpanObj.addClass("cgreen");
            insurancePolicyFileuploadSpanObj.text("已上传");
        }
        var falseKey1 = $("#falseKey").val();//车辆备用钥匙
        if (falseKey1 !== undefined && falseKey1 != null && falseKey1 != "") {
            var falseKeyFileuploadSpanObj = $("#falseKeyFileuploadSpan");
            falseKeyFileuploadSpanObj.removeClass("cblue");
            falseKeyFileuploadSpanObj.addClass("cgreen");
            falseKeyFileuploadSpanObj.text("已上传");
        }
        var fahrzeugbeschaffung1 = $("#fahrzeugbeschaffung").val();//车辆购置税完税证明
        if (fahrzeugbeschaffung1 !== undefined && fahrzeugbeschaffung1 != null && fahrzeugbeschaffung1 != "") {
            var fahrzeugbeschaffungFileuploadSpanObj = $("#fahrzeugbeschaffungFileuploadSpan");
            fahrzeugbeschaffungFileuploadSpanObj.removeClass("cblue");
            fahrzeugbeschaffungFileuploadSpanObj.addClass("cgreen");
            fahrzeugbeschaffungFileuploadSpanObj.text("已上传");
        }
        var signContractReview1 = $("#signContractReview").val();//相关合同附件
        if (signContractReview1 !== undefined && signContractReview1 != null && signContractReview1 != "") {
            var signContractFileuploadSpanObj = $("#signContractFileuploadSpan");
            signContractFileuploadSpanObj.removeClass("cblue");
            signContractFileuploadSpanObj.addClass("cgreen");
            signContractFileuploadSpanObj.text("已上传");
        }
    };

</script>
</body>
</html>
