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
    <title>e车贷管理系统--借款详情</title>

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
        <li><a class="link-01" href="#">借款管理</a></li>
        <li>借款资料补传详情</li>
    </ul>
</div>
<div class="main-con">

    <div class="normal-area">
        <ul class="nav nav-tabs tabs-01" role="tablist">
            <li class="active"><a href="#tabcon-01" role="tab" data-toggle="tab">借款详情</a></li>
            <li><a href="#tabcon-03" role="tab" data-toggle="tab">借款附件</a><span
                    class="badge">${loanInfoAttachmentSize}</span></li>
            <li>
        </ul>
        <div class="tab-content pad-t-10">
            <!--[if !IE]>tabcon-01 start<![endif]-->
            <div class="tab-pane active" id="tabcon-01">
                <form class="form-inline clearfix">
                    <div class="title clearfix"><h2>基本信息</h2>&nbsp;&nbsp;&nbsp;&nbsp;</div>
                    <div class="con clearfix">
                        <input type="hidden" name="loanId" id="loanId" value="${loanInfo.uuid}">
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
                                <label>申请金额：</label><a href="###" class="link-01"><fmt:formatNumber
                                    value="${loanInfo.applyMoney}" type="currency" /></a>
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款状态：</label><strong class="corange">
                                <c:if test="${loanInfo.loanStatus eq 'vehicleAssess'}">待车辆评估</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'departLeadAduit'}">待初审</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'departLeadAduit_rejected'}">初审不通过</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'trialPhase'}">待总部面审</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'trialPhase_rejected'}">总部面审不通过</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'callBack'}">待总部电话回访</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'visiteCheck'}">待线下上门核实</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'judgment'}">待总部终审</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'judgment_rejected'}">总部终审不通过</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'signContract'}">待线下签订相关合同</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'signContract_rejected'}">签订合同终止</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'dataReview'}">资料复核</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'reuploadInformatin'}">资料或相关合同重新上传</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'lended'}">待出账</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'repayment'}">还款中</c:if>
                                <c:if test="${loanInfo.loanStatus eq 'end'}">已完结</c:if>
                            </strong>
                            </div>
                            <div class="form-group col-md-4">
                                <label>借款人：</label><a
                                    href="${basePath}/admin//customer/queryCustomerDetail.html?uuid=${loanInfo.customerId}"
                                    class="link-01" title="查看借款人详细信息"
                                    >${loanInfo.customerRegisterInfo.customerName}</a>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>申请时间：</label><fmt:formatDate value="${loanInfo.applyedAt}"
                                                                    pattern="yyyy-MM-dd HH:mm:ss" />
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
                                                                    pattern="yyyy-MM-dd HH:mm:ss" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>还款来源介绍：</label>${loanInfo.repaySource}
                            </div>
                        </div>
                    </div>
                    <div class="title clearfix">
                        <h2>账号信息</h2>
                    </div>
                    <div class="con clearfix">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>开户名：</label>
                                ${accountInfo.accountName}
                            </div>
                            <div class="form-group col-md-4">
                                <label>开户行：</label>
                                ${accountInfo.bankName}
                            </div>
                            <div class="form-group col-md-4">
                                <label>银行账号：</label>
                                ${accountInfo.accountNum}
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
                    </div>

                    <div class="title clearfix">
                        <h2>其他</h2>
                    </div>
                    <div class="con clearfix">
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>主办意见：</label>
                                ${loanInfo.hostOpinion}
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>备注：</label>
                                ${loanInfo.remark}
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <!--[if !IE]>tabcon-01 end<![endif]-->

            <!--[if !IE]>tabcon-03 start<![endif]-->
            <div class="tab-pane" id="tabcon-03">
                <div class="checkbox pull-right">
                    <a href="javascript:init();" class="btn btn-link">刷新附件</a>|<a
                        href="javascript:deleteLoanAttachment();"
                        class="btn btn-link">删除选中附件</a>
                </div>
                <div class="con clearfix" id="loan_attachment_div">
                    <!-- load loanAttachment页面 -->
                </div>

            </div>
            <!--[if !IE]>tabcon-03 end<![endif]-->

            <div class="con clearfix">
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">上传面审视频截图：<span
                                id="trialPhaseReviewFileuploadSpan" class="small_span">
                            (上传的附件在借款附件栏目查看)</span></label>
                        <input id="trialPhaseReviewFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/trialPhaseReview.html" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="label-s">上传回访相片：<span
                                id="visiteCheckReviewFileuploadSpan"
                                class="cgray">(上传的附件在借款附件栏目查看)</span></label>
                        <input id="visiteCheckReviewFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/visiteCheckReview.html" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">机动车交通强制保险单：<span
                                id="insurancePolicyFileuploadSpan"
                                class="cred">(必传可后补)</span></label>
                        <input id="insurancePolicyFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/insurancePolicy.html" />
                    </div>

                    <div class="form-group col-md-6">
                        <label class="label-s">车辆备用钥匙：<span
                                id="falseKeyFileuploadSpan"
                                class="cred">(必传可后补)</span></label>
                        <input id="falseKeyFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/falseKey.html" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">车辆购置税完税证明：<span
                                id="fahrzeugbeschaffungFileuploadSpan"
                                class="cblue">(选传)</span></label>
                        <input id="fahrzeugbeschaffungFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/fahrzeugbeschaffung.html" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="label-s">非本地户口另需居住证：<span
                                id="registerUploadSpan"
                                class="cblue">(选传)</span></label>
                        <input id="registerUpload" type="file" class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload/${loanInfo.uuid}/verification.html" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">相关合同附件：<span
                                id="signContractFileuploadSpan"
                                class="cred">(必传)</span></label>
                        <input id="signContractFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload
                               /${loanInfo.uuid}/signContractReview.html" />
                    </div>
                    <div class="form-group col-md-6">
                        <label class="label-s">人车合照：<span
                                id="oneCarPhotoFileuploadSpan"
                                class="cred">(必传)</span></label>
                        <input id="oneCarPhotoFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload
                               /${loanInfo.uuid}/oneCarPhoto.html" />
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-6">
                        <label class="label-s">身份证照：<span
                                id="personPhotoFileuploadSpan"
                                class="cred">(必传)</span></label>
                        <input id="personPhotoFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload
                                   /${loanInfo.uuid}/personPhoto.html" />
                    </div>

                    <div class="form-group col-md-6">
                        <label class="label-s">上传出账凭证：<span
                                id="lendedReviewFileuploadSpan"
                                class="cblue">(上传的附件在借款附件栏目查看)</span></label>
                        <input id="lendedReviewFileupload" type="file"
                               class="form-control"
                               name="files[]"
                               data-url="${basePath}/admin/file/upload
                               /${loanInfo.uuid}/lendedReview.html" />
                    </div>
                </div>
            <!-- 评审 end -->
            </div>
        </div>
    </div>
    </div>
<script>
    $(function () {
        /** 加载附件 */
        $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}", function(){
            checkAttachmentUploaded();
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

        /** 人车合照 */
        $("#oneCarPhotoFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#oneCarPhotoFileuploadSpan'));
            }
        });

        /** 身份证照 */
        $("#personPhotoFileupload").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data, $('#personPhotoFileuploadSpan'));
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
        $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}", function(){
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
</body>
</html>
