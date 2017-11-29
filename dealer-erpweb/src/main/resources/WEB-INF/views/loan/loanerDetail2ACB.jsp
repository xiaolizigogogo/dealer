<%@ page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
    <link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>

    <script src="${basePath}/js/lightbox.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
    <script type="text/javascript" src="${basePath}/js/other.js"></script>
    <script type="text/javascript" src="${basePath}/js/my.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>

    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">

    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/loan/loanHelper.js"></script>
    <script src="${basePath}/js/loan/imageUpLoadTile.js"></script>

</head>
<body>

<div class="modal-header">
    <a type="button" href="javascript:void(0)" onClick="closePage(0);"
       class="close"><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">
        查看订单<small style="padding-left: 20px; font-size: 14px;"
                   class="text-danger" id="orderid">订单号：</small>
    </h4>
</div>
<input type="text" hidden="hidden" name="uuid"  id="uuid">
<div class="modal-body">
    <ol class="ui-step ui-step-red ui-step-11" id="ol_vehiclesLoans" style="display:none;">
        <li class="step-start step-done">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="applyloan">1</span> <span
                    class="ui-step-cont-text">申请<br/>贷款</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_vehicleAssess">2</span> <span
                    class="ui-step-cont-text">评估</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_departLeadAduit">3</span> <span
                    class="ui-step-cont-text">初审</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_trialPhase">4</span> <span
                    class="ui-step-cont-text">面审</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_callBack">5</span> <span
                    class="ui-step-cont-text">电话<br/>核实</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_visiteCheck">6</span> <span
                    class="ui-step-cont-text">家访</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_judgment">7</span> <span
                    class="ui-step-cont-text">终审</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_signContract">8</span> <span
                    class="ui-step-cont-text">签订<br/>合同</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_mortgage">9</span> <span
                    class="ui-step-cont-text" id="mortgage_stock">抵押<br/>办理</span>
            </div>
        </li>


        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_dataReview">10</span> <span
                    class="ui-step-cont-text">复核</span>
            </div>
        </li>
        <li class="step-end">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="li_lended">11</span> <span
                    class="ui-step-cont-text">出账</span>
            </div>
        </li>
    </ol>
    <ol class="ui-step ui-step-red ui-step-15" id="ol_vehiclesLoans_group" style="display:none;">
        <li class="step-start step-done">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="applyloan_group">1</span> <span
                    class="ui-step-cont-text">申请<br/>贷款</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_vehicleAssess">2</span> <span
                    class="ui-step-cont-text">评估</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_departLeadAduit">3</span> <span
                    class="ui-step-cont-text">初审</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_trialPhase">4</span> <span
                    class="ui-step-cont-text">面审</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_callBack">5</span> <span
                    class="ui-step-cont-text">电话<br/>核实</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_visiteCheck">6</span> <span
                    class="ui-step-cont-text">家访</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_judgment">7</span> <span
                    class="ui-step-cont-text">终审</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_signContract">8</span> <span
                    class="ui-step-cont-text">签订<br/>合同</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_mortgage">9</span> <span
                    class="ui-step-cont-text" id="group_mortgage_stock">抵押<br/>办理</span>
            </div>
        </li>


        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_dataReview">10</span> <span
                    class="ui-step-cont-text">复核</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_lended">11</span> <span
                    class="ui-step-cont-text">分公司<br/>放款</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_reloanReview">12</span> <span
                    class="ui-step-cont-text" id="loanReview_span">再贷<br/>资料复核</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_reloanApprove">13</span> <span
                    class="ui-step-cont-text" id="laonApprove_span">再贷<br/>审批</span>
            </div>
        </li>
        <li class="">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_reloanE_Contract">14</span> <span
                    class="ui-step-cont-text" id="contract_span">再贷电子<br/>合同签订</span>
            </div>
        </li>
        <li class="step-end">
            <div class="ui-step-line"></div>
            <div class="ui-step-cont">
                <span class="ui-step-cont-number" id="ligroup_reloan_lended">15</span> <span
                    class="ui-step-cont-text" id="loan_lended_span">再贷<br/>放款</span>
            </div>
        </li>
    </ol>
    <div class="tab_box">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#tab1"
                                                      aria-controls="tab1" role="tab" data-toggle="tab">个人资料</a></li>
            <li role="presentation"><a href="#tab2" aria-controls="tab2"
                                       role="tab" data-toggle="tab">车辆信息</a></li>
            <li role="presentation"><a href="#tab3" aria-controls="tab3"
                                       role="tab" data-toggle="tab">借款需求</a></li>
            <li role="presentation" id="file_tab"><a href="#tab_attachment" aria-controls="tab_attachment"
                                                     role="tab" data-toggle="tab">附件资料</a></li>
            <li role="presentation"><a href="#tab5" aria-controls="tab5"
                                       role="tab" data-toggle="tab">审批历史</a></li>
            <li role="presentation"><a href="#tab6" aria-controls="tab6"
                                       role="tab" data-toggle="tab">历史借款</a></li>
            <li role="presentation"><a href="#tab4" aria-controls="tab4"
                                       role="tab" data-toggle="tab">还款计划</a></li>
            <li role="presentation" id="tab_b2b" style="display:none"><a href="#tab0" aria-controls="tab0"
                                                                         role="tab" data-toggle="tab">总公司还款计划</a></li>
        </ul>

        <input type="hidden" id="processid">
        <!-- Tab panes -->
        <div class="tab-content clearfix">
            <div role="tabpanel" class="tab-pane" id="tab0">
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">总公司还款计划</h3> <span class=" text-muted" style=" padding-left:10px;"> (开始日期:<span id="startDateB2B"></span>)</span>
                        <input type="hidden" id="periodB2B"/>
                        <input type="hidden" id="loanMoneyB2B"/>
                        <input type="hidden" id="loanRateB2B"/>
                        <input type="hidden" id="repayWayB2B"/>
                    </div>
                    <div >
                        <table class="table table_company">
                            <thead>
                            <tr>
                                <th style="width:10%;">期数</th>
                                <th  style="width:10%;">还款本金 <span class="text-muted">(元)</span></th>
                                <th  style="width:10%;">还款利息 <span class="text-muted">(元)</span></th>
                                <th  style="width:15%;">服务费 <span class="text-muted">(元)</span></th>
                                <th  style="width:15%;">其他费用 <span class="text-muted">(元)</span></th>
                                <th  style="width:15%;">本期还款总额 <span class="text-muted">(元)</span></th>
                                <th style="width:20%;">日期</th>
                                <th  style="width:20%;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="repayb2b1">
                            <tr>
                                <td>1</td>
                                <td><span>1500</span></td>
                                <td><span>500</span></td>
                                <td><span>300</span></td>
                                <td>2300</td>
                                <td>2300</td>
                                <td><span class="other_txt">2016-10-10</span>
                                    <div class="input-group date form_date pull-left red-group" data-date=""
                                         data-date-format="yyyy-mm"
                                         data-link-field="purchaseDate"
                                         data-link-format="yyyy-mm-dd" style="width:160px; display:none;">
                                        <input class="control-sml" type="text"
                                               value="" readonly style="width:100%;">
                                        <i class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></i> </div></td>
                                <td><a href="#" class="collection_Edit">修改</a><span class="btn-do" style="display:none;"><a href="#" class="collection_cancel">取消</a> <a href="#" class="collection_update text-success">保存</a></span> </td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td><span>1500</span></td>
                                <td><span>500</span></td>
                                <td><span>300</span>
                                </td>
                                <td>2300</td>
                                <td><span class="other_txt">2016-10-10</span>
                                    <div class="input-group date form_date pull-left red-group" data-date=""
                                         data-date-format="yyyy-mm"
                                         data-link-field="purchaseDate"
                                         data-link-format="yyyy-mm-dd" style="width:160px; display:none;">
                                        <input class="control-sml" type="text"
                                               value="<fmt:formatDate value="${loanInfo.guaranteeEvaluateInfo.purchaseDate}"  pattern="yyyy-MM-dd" />" readonly style="width:100%;">
                                        <i class="input-group-addon"><i
                                                class="glyphicon glyphicon-calendar"></i></i> </div></td>
                                <td><a href="#" class="collection_Edit">修改</a><span class="btn-do" style="display:none;"><a href="#" class="collection_cancel">取消</a> <a href="#" class="collection_update text-success">保存</a></span> </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane active" id="tab1">
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">基本信息</h3>
                    </div>
                    <div id="loan_review_div"></div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>借款人</dt>
                                <dd id="customerName1"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>身份证号码</dt>
                                <dd id="idCard"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>手机号码</dt>
                                <dd id="mobile"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>客户来源</dt>
                                <dd id="customerFrom"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>性别</dt>
                                <dd id="sex"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>年龄</dt>
                                <dd id="age"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>学历</dt>
                                <dd id="education"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>住宅电话</dt>
                                <dd id="homeTel"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>户口所在地</dt>
                                <dd id="kosekiAddress"></dd>
                            </dl>
                        </div>
                        <!--
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>住房性质</dt>
                <dd id="house"></dd>
              </dl>
            </div>-->
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>婚姻状况</dt>
                                <dd id="maritalStatus"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>本地居住年限</dt>
                                <dd id="residence_period"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>子女个数</dt>
                                <dd id="number_of_children"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>居住人数</dt>
                                <dd id="liveNumber1"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>子女情况</dt>
                                <dd id="status_of_children"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>居住情况</dt>
                                <dd id="cohabitant"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>现住址居住年限</dt>
                                <dd id="residence_period_current"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>现居地址</dt>
                                <dd id="liveAddress"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>现住宅类型</dt>
                                <dd id="house"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">工作信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>单位全称</dt>
                                <dd id="enterpriseName"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>工作类型</dt>
                                <dd id="enterpriseIndustry"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>单位电话</dt>
                                <dd id="enterpriseTel"></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>单位性质</dt>
                                <dd id="enterpriseType"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>部门</dt>
                                <dd id="deptName"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>职位</dt>
                                <dd id="position"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>月收入水平</dt>
                                <dd id="income"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>有无社保</dt>
                                <dd id="has_social_security_cards"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>入职时间</dt>
                                <dd id="dateJoined"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>单位地址</dt>
                                <dd id="enterpriseAddress"></dd>
                            </dl>
                        </div>
                    </div>
                    <hr style="margin:10px 0px;" />
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>生产制造型企业</dt>
                                <dd id="ismanufacturing"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>组织形式</dt>
                                <dd id="companyType"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>注册时间</dt>
                                <dd id="companyRegisterAt"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>营业执照</dt>
                                <dd id="has_businesslicence"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>生产规模</dt>
                                <dd id="employees_number"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>营业时间</dt>
                                <dd id="business_hours"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>主营业务</dt>
                                <dd id="business"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>收入说明</dt>
                                <dd id="incomeStatement"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">资产信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>房产</dt>
                                <dd id="hasHouse1"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>房产数量</dt>
                                <dd id="house_number"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购买时间</dt>
                                <dd id="house_buy_date"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购买方式</dt>
                                <dd id="house_buy_way"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购买价格</dt>
                                <dd id="house_buy_price"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>房产归属人</dt>
                                <dd id="house_ownership"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>房产地址</dt>
                                <dd id="house_addr"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">车辆信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车牌号码</dt>
                                <dd id="car_license_plate"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>品牌类型</dt>
                                <dd id="car_brand"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购买时间</dt>
                                <dd id="car_buy_date"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>裸车价</dt>
                                <dd id="bare_car_price"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>家庭共有车数</dt>
                                <dd id="family_car_number"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购买方式</dt>
                                <dd id="car_buy_way"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>保险单</dt>
                                <dd id="insurance_type"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">其他信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>所属分公司</dt>
                                <dd id="company-name"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>所属部门</dt>
                                <dd id="dept-name"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>所属客户经理</dt>
                                <dd id="user-realname"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>信用卡张数</dt>
                                <dd id="creditCardNum"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>信用卡额度</dt>
                                <dd id="creditCardQuota"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>银行信用卡号</dt>
                                <dd id="creditCard"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>信用卡银行名称</dt>
                                <dd id="creditCardBankName"></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="row"> </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <dl class="dl-horizontal">
                                <dt>备注</dt>
                                <dd id="remark"> </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">联系人信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>配偶姓名</dt>
                                <dd id="spouse_name"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>单位电话</dt>
                                <dd id="spouse_tel"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>手机号码</dt>
                                <dd id="spouse_mobile"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>知晓本次借款</dt>
                                <dd>
                                    <input type="checkbox"  id="spouse_ck" disabled>
                                </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>直系亲属姓名</dt>
                                <dd id="immediate_name1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>关系</dt>
                                <dd id="immediate_relation1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>手机号码</dt>
                                <dd id="immediate_Mobile1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>知晓本次借款</dt>
                                <dd>
                                    <input type="checkbox"  id="immediate_ck1" disabled>
                                </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>直系亲属姓名</dt>
                                <dd id="immediate_name1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>关系</dt>
                                <dd id="immediate_relation1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>手机号码</dt>
                                <dd id="immediate_Mobile1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>知晓本次借款</dt>
                                <dd>
                                    <input type="checkbox"  id="immediate_ck2" disabled>
                                </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>其他联系人姓名</dt>
                                <dd id="other_name1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>关系</dt>
                                <dd id="other_relation1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>手机号码</dt>
                                <dd id="other_mobile1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>知晓本次借款</dt>
                                <dd>
                                    <input type="checkbox"  id="other_ck1" disabled>
                                </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>其他联系人姓名</dt>
                                <dd id="other_name1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>关系</dt>
                                <dd id="other_relation1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>手机号码</dt>
                                <dd id="other_mobile1"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>知晓本次借款</dt>
                                <dd>
                                    <input type="checkbox"  id="other_ck2" disabled>
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab2">
             <!--    <div class="from_box carinfo_from">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">基本信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车身是否在有效期内</dt>
                                <dd id="isExamined"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车辆商业全险是否购买</dt>
                                <dd id="isInsure"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>节假日是否驾驶车辆离省</dt>
                                <dd id="isProvince"></dd>
                            </dl>
                        </div>
                    </div>
                </div> -->
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">车辆信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-12" id="d1"> </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车辆品牌</dt>
                                <dd id="vehicleBrand"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车辆型号</dt>
                                <dd id="vehicleModels"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车牌号码</dt>
                                <dd id="vehicleNo"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>已行驶里程</dt>
                                <dd id="mileaged"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车身结构</dt>
                                <dd id="structure"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购置日期</dt>
                                <dd id="purchaseDate"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>车架号</dt>
                                <dd id="vehicleIdentification"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>发动机号</dt>
                                <dd id="engineNo"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>变速箱</dt>
                                <dd id="transmissionCase"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>排量</dt>
                                <dd id="displacement"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>室内装置</dt>
                                <dd id="indoor"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt> 驱动轮</dt>
                                <dd id="configuration"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>颜色</dt>
                                <dd id="color"></dd>
                            </dl>
                        </div>
                        <!--
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>配 置</dt>
                <dd id="configuration"></dd>
              </dl>
            </div>-->

                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>暗 锁</dt>
                                <dd id="darkLocks"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>随车工具</dt>
                                <dd id="carTool"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">车辆评估信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>发动机</dt>
                                <dd id="engine"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>发票价</dt>
                                <dd id="price"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购车方式</dt>
                                <dd id="buyTheWay"></dd>
                            </dl>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>评估价格</dt>
                                <dd id="evaluatePrice"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>评估师</dt>
                                <dd id="evaluateby"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-6">
                            <dl class="dl-horizontal">
                                <dt>评估结论</dt>
                                <dd> <span class="text-danger" id="evaluateConclusion"></span> </dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab3">
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">基本信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>申请金额</dt>
                                <dd id="applyMoney"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>审批金额</dt>
                                <dd id="approveMoney"> <b class="text-danger"></b> 万元 </dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>借款状态</dt>
                                <dd id="loanstatus"> </dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>借款人</dt>
                                <dd id="loanername"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>申请时间</dt>
                                <dd  id="applytime"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>借款用途</dt>
                                <dd id="loanPurpose"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>所属分公司</dt>
                                <dd id="loancompany"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>所属部门</dt>
                                <dd id="loandept"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>客户经理</dt>
                                <dd id="customermanager"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>还款来源</dt>
                                <dd id="repaymentsrc"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>主办意见</dt>
                                <dd id="hostOpinion"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>借款备注</dt>
                                <dd id="loan_remark"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>录入人</dt>
                                <dd id="loanrecorder"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-4">
                            <dl class="dl-horizontal">
                                <dt>录入时间</dt>
                                <dd id="createtime"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">选择产品</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>贷款产品</dt>
                                <dd id="loan_product"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>还款方式</dt>
                                <dd id="repayWay"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>购车方式</dt>
                                <dd id="buy_car_method"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>选择方案 </dt>
                                <dd id="plantype"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3 class="pull-left">利率、期限</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>年利率</dt>
                                <dd id="yearrate"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>月利率</dt>
                                <dd id="monthrate"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>借款期限</dt>
                                <dd id="period"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3>其他费用</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>综合服务费</dt>
                                <dd id="depreciationFee"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>抵押方式</dt>
                                <dd id="mortgageType"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>停车费</dt>
                                <dd id="parkCost"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <div class="from_box">
                    <div class="from_tit clearfix">
                        <h3>账号信息</h3>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>开户名</dt>
                                <dd id="accountname"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>开户行</dt>
                                <dd id="accountbank"></dd>
                            </dl>
                        </div>
                        <div class="col-sm-3">
                            <dl class="dl-horizontal">
                                <dt>银行账号</dt>
                                <dd id="accountnumber"></dd>
                            </dl>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="<%=ParamterControl.PAGE_ATTACHMENT %>"></jsp:include>
            <div role="tabpanel" class="tab-pane" id="tab5">
                <div class="list_box">
                    <table class="table table-bordered table-striped" id="examineinfo">
                        <thead>
                        <tr>
                            <th>评审人</th>
                            <th>评审环节</th>
                            <th>评审结果</th>
                            <th>评审金额</th>
                            <th>评审结论</th>
                            <th>评审时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab6">
                <div class="list_box">
                    <table class="table table-bordered table-striped" id="historytable">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>身份证号码</th>
                            <th>审批金额</th>
                            <th>申请金额</th>
                            <th>申请时间</th>
                            <th>借款状态</th>
                            <th>借款所属公司</th>
                            <th>借款所属部门</th>
                            <th>客户经理</th>
                        </tr>
                        </thead>
                        <tbody id="record">
                        </tbody>
                    </table>
                </div>
            </div>
            <div role="tabpanel" class="tab-pane" id="tab4">
                <div class="list_box">
                    <table class="table table-bordered table-striped" id="repayPlanVo">
                        <thead>
                        <tr>
                            <th>期数</th>
                            <th>还款本金</th>
                            <th>还款利息</th>
                            <th>综合服务费</th>
                            <th>GPS费/办理费</th>
                            <th>停车费</th>
                            <th>风险保证金</th>
                            <th>本期还款总额</th>
                            <th>还款日期</th>
                        </tr>
                        </thead>
                        <tbody id="repayPlayDetail">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <iframe src="" id="downloadIframe" style="display:none;">
    </iframe>
    <div class="op_box" id="op_box_departLeadAduit" style="display:none;">
        <h4>初审</h4>
        <div class="op_box_con clearfix">
            <form class="form-horizontal">
                <!--        <div class="form-group">-->
                <!--           <label for="inputEmail3" class="col-sm-2 control-label"><i class="text-danger">*</i> 处理意见</label> -->
                <!--           <div class="col-sm-8"> -->
                <!--             <select class="form-control" id="companyId" name="companyId"> -->
                <!--               <option value="0">请选择</option> -->
                <!--             </select> -->
                <!--           </div> -->
                <div class="form-group">
                    <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" name="reviewStatus_departLeadAduit" id="departLeadAduitinlineRadio1" value="passed" checked="checked">
                            通过 </label>
                        <label class="radio-inline">
                            <input type="radio" name="reviewStatus_departLeadAduit" id="departLeadAduitinlineRadio2" value="rejected">
                            不通过 </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="conclusion" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                    <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_departLeadAduit" maxlength="50"
                      name="conclusion"></textarea>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <%--   </c:if> --%>
    <!-- 总部面审：trialPhase -->
    <div class="op_box" id="op_box_trialPhase" style="display:none;">
        <h4>面审</h4>
        <div class="op_box_con clearfix">
            <form class="form-horizontal" id="">
                <div class=" col-sm-8">
                    <div class="form-group">
                        <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                        <div class="col-sm-8">
                            <label class="radio-inline">
                                <input type="radio" name="reviewStatus_trialPhase" id="departLeadAduitinlineRadio1" value="passed" checked="checked">
                                通过 </label>
                            <label class="radio-inline">
                                <input type="radio" name="reviewStatus_trialPhase" id="departLeadAduitinlineRadio2" value="rejected">
                                不通过 </label>
                            <%--<label class="radio-inline">--%>
                            <%--<input type="radio" name="reviewStatus_trialPhase" id="departLeadAduitinlineRadio3" value="return">--%>
                            <%--退回 </label>--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 审批金额</label>
                        <div class="col-sm-8">
                            <div class="input-group input-append bootstrap-timepicker " style="width:120px">
                                <input type="text" class="form-control" name="reviewMoney" id="reviewMoney" onKeyUp="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                                       maxlength="5"   value="${loanInfo.applyMoney}" >
                                <span class="add-on input-group-addon">万元</span> </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                        <div class="col-sm-10">
              <textarea cols="168" rows="2" class="form-control" id="conclusion_trialPhase" maxlength="50"
                        name="conclusion"></textarea>
                        </div>
                    </div>
                </div>

        </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_callBack" style="display:none;">
    <h4>电话核实</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div></div>
            <div class="form-group">
                <label for="conclusion_callBack" class="col-sm-2 control-label"><i class="text-danger">*</i> 电话核实记录</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_callBack"  maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 是否家访</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_callBack" id="homecheck_finish" value="passed" checked="checked">
                        无需家访 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_callBack" id="homecheck_notfinish" value="rejected">
                        需家访 </label>
                </div>
            </div>
        </form>
    </div>
</div>
<!-- 线下签订相关合同 -->
<div class="op_box" id="op_box_signContract" style="display:none;">

    <h4>签订合同</h4>
    <form class="form-horizontal">
        <div class="op_box_con clearfix">
        </div>
        <div class="form-group">
            <label for="conclusion_signContract" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
            <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_signContract" maxlength="50"
                      name="conclusion"></textarea>
            </div>
        </div>
</div>
</form>
</div>
<!-- 线下签订相关合同 -->
<div class="op_box" id="op_box_reuploadInformatin" style="display:none;">
    <h4>附件和资料重新上传</h4>
    <form class="form-horizontal">
        <div class="op_box_con clearfix">
            <div class="form-group">
                <label for="conclusion_reuploadInformatin" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_reuploadInformatin" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="op_box" id="op_box_reloanE_Contract" style="display:none;">
    <h4>签订电子合同</h4>
    <form class="form-horizontal">
        <div class="op_box_con clearfix">
            <div class="form-group">
                <label  class="col-sm-2 control-label"> 电子合同附件上传</label>
                <div class="col-sm-10" style="padding-top:10px;">
                    <ul class="fj_list">

                        <li>
                            <p><i class="text-danger">*</i> 电子合同</p>
                            <div> <a href="javascript:;" class="file">选择文件
                                <input id="up_img_WU_FILE_20" type="file"  name="files[]"
                                       data-url="loanContractEle" />
                            </a>
                                <p class="file_img"><img id="imgShow_WU_FILE_20" ></p>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="form-group">
                <label for="conclusion_signContract" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_reloanE_Contract" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="op_box" id="op_box_helploanE_Contract" style="display:none;">
    <h4>签订电子合同</h4>
    <form class="form-horizontal">
        <div class="op_box_con clearfix">
            <div class="form-group">
                <label  class="col-sm-2 control-label"> 电子合同附件上传</label>
                <div class="col-sm-10" style="padding-top:10px;">
                    <ul class="fj_list">

                        <li>
                            <p><i class="text-danger">*</i> 电子合同</p>
                            <div> <a href="javascript:;" class="file">选择文件
                                <input id="up_img_WU_FILE_22" type="file"  name="files[]"
                                       data-url="loanContractEle_Help" />
                            </a>
                                <p class="file_img"><img id="imgShow_WU_FILE_22" ></p>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="form-group">
                <label for="conclusion_signContract" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_helploanE_Contract" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </div>
    </form>
</div>
<div class="op_box" id="op_box_visiteCheck" style="display:none;">
    <h4>家访</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div></div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 备注</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_visiteCheck"  maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box" id="op_box_mortgage" style="display:none;">
    <h4>车辆抵押办理</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div></div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 抵押结果</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_mortgage" id="mortgage_ok" value="passed" checked="checked">
                        抵押成功 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_mortgage" id="mortgage_ng" value="rejected">
                        抵押失败 </label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 备注</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_mortgage"  maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_judgment" style="display: none;">
    <h4>终审</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_judgment" id="judgmentinlineRadio1" value="passed" checked="checked">
                        通过 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_judgment" id="judgmentinlineRadio2" value="rejected">
                        不通过 </label>
                    <%--<label class="radio-inline">--%>
                    <%--<input type="radio" name="reviewStatus_judgment" id="judgmentinlineRadio3" value="concludeAgain">--%>
                    <%--合同调整 </label>--%>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 审批金额</label>
                <div class="col-sm-8">
                    <div class="input-group input-append bootstrap-timepicker" style="width:120px">
                        <input type="text" class="form-control" id="judgmentMoney"  onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               maxlength="5"     name="judgmentMoney"  value="${loanInfo.applyMoney}" >
                        <span class="add-on input-group-addon">万元</span> </div>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_judgment" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_dataReview" style="display: none;">
    <h4>复核</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div>
                <div class="form-group">
                    <div class="col-sm-8  col-sm-offset-2"> <a href="#tab_attachment" aria-controls="tab7" role="tab" data-toggle="tab"  id="file_more">查看全部附件</a> </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_dataReview" id="dataReviewinlineRadio1" value="passed" checked="checked">
                        通过 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_dataReview" id="dataReviewinlineRadio2" value="rejected">
                        不通过 </label>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_dataReview" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_reloanReview" style="display: none;">
    <h4>再贷资料复核</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_reloanReview" id="reloanReviewinlineRadio1" value="passed" checked="checked">
                        通过 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_reloanReview" id="reloanReviewinlineRadio2" value="rejected">
                        放弃 </label>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_reloanReview" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_helploanReview" style="display: none;">
    <h4>助贷资料复核</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                <div class="col-sm-8">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_helploanReview" id="helploanReviewinlineRadio1" value="passed" checked="checked">
                        通过 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_helploanReview" id="helploanReviewinlineRadio2" value="rejected">
                        放弃 </label>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_helploanReview" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_lended" style="display: none;">
    <h4>总公司出账</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">

            <div class="form-group">
                <div class="col-sm-5"> <label class="col-sm-4 control-label"><i class="text-danger">*</i> 出账方式选择</label>
                    <div class="col-sm-8">
                        <label class="radio-inline">
                            <input type="radio" name="loanMethodSelect" id="loandirect" value="loandirect" checked="checked">
                            直贷 </label>
                        <c:if test="${reloanandhelploan_display eq 'y'}">
                            <label class="radio-inline">
                                <input type="radio" name="loanMethodSelect" id="helploan" value="helploan">
                                助贷 </label>
                            <label class="radio-inline">
                                <input type="radio" name="loanMethodSelect" id="reloan" value="reloan">
                                再贷 </label>

                        </c:if>
                    </div>
                </div>

                <div class="col-sm-5" id="lenddate_div">
                    <label class="col-sm-4 control-label"><i class="text-danger">*</i> 出账时间</label>
                    <div class="col-sm-8">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="lendDate"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                            <input class="form-control" type="text" value="" readonly style="width:100%;" >
                                    <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-calendar"></span></span> </div>
                        <input type="text" hidden="hidden" id="lendDate"
                               name="lendDate" />
                    </div>

                </div>
            </div>


            <div class="form-group">
                <div class="col-sm-5">
                    <label  class="col-sm-4 control-label"><i class="text-danger">*</i> 总公司放款年化利率</label>
                    <div class="col-sm-8">
                        <div class="input_group" style="max-width:120px">
                            <input type="text" id="loanRate" maxlength="8" style="width:100%;" name="reloan" class="form-control"
                                   onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                                   onpaste="return false" />
                            <span class="danwei">%</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label class="col-sm-4 control-label"><i
                            class="text-danger">*</i> 借款期限</label>
                    <div class="col-sm-8">
                        <div class="input_group" style="max-width: 120px">
                            <input type="text" name="loanLimitTime" maxlength="5"
                                   style="width: 120px;" id="period_reloan" value=""
                                   class="form-control valid"> <span class="danwei">月</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-5">
                    <label class="col-sm-4 control-label"><i
                            class="text-danger">*</i> 还款方式</label>
                    <div class="col-sm-8">
                        <select class="form-control pull-left valid" id="repayWay_reloan" name="repayWay">
                            <!--<option value="AverageCapitalPlusInterest"> 等本等息 </option>-->
                            <option value="InterestRatesBefore"> 先息后本</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-5" id="reloan_starttime_div">
                    <label class="col-sm-4 control-label"><i
                            class="text-danger">*</i> 服务费</label>
                    <div class="col-sm-8">
                        <div class="input_group" style="max-width: 120px">
                            <input type="text" class="form-control" name="serviceMoney"
                                   id="serviceFee_reloan"
                                   onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                                   onpaste="return false" maxlength="5" value=""
                                   style="width: 100%;"> <span class="danwei">元</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group" >
                <div class="col-sm-5">
                    <label class="col-sm-4 control-label"><i
                            class="text-danger">*</i> 其他费用</label>
                    <div class="col-sm-8">
                        <div class="input_group" style="max-width: 120px">
                            <input type="text" class="form-control" name="otherMoney"
                                   id="otherFee_reloan"
                                   onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                                   onpaste="return false" maxlength="5" value=""
                                   style="width: 100%;"> <span class="danwei">元</span>
                        </div>
                    </div></div>

            </div>
            <div class="form-group" id="reloan_starttime_div">
                <div class="col-sm-5">
                    <label class="col-sm-4 control-label"><i class="text-danger">*</i> 开始时间</label>
                    <div class="col-sm-8">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="startDate_reloan"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                            <input class="form-control" type="text" value="" readonly style="width:100%;">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                        <input type="text" hidden="hidden" id="startDate_reloan"
                               name="startDate_reloan"/>
                    </div>
                </div>
                <!--<div class="col-sm-5">
                            <label class="col-sm-4 control-label"><i class="text-danger">*</i> 结束时间</label>
                            <div class="col-sm-8">
                                <div class="input-group date form_date" data-date=""
                                     data-date-format="yyyy-mm-dd"
                                     data-link-field="endDate_reloan"
                                     data-link-format="yyyy-mm-dd" style="width:200px;">
                                    <input class="form-control" type="text" value="" readonly style="width:100%;">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                                </div>
                                <input type="text" hidden="hidden" id="endDate_reloan"
                                       name="endDate_reloan"/>
                            </div>
                        </div>-->

            </div>

            <div class="form-group">
                <div class="col-sm-5">
                    <label class="col-sm-4 control-label">还款信息</label>
                    <div class="col-sm-8">
                        <a id="generateRepayPlanBtn" href="#plan-list" class="btn btn-success btn-search plan-show"
                           onclick="generateRepayPlanB2B('loandirect')">生成还款计划</a>
                    </div></div>
            </div>

            <div class="list_box">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th style="width:10%;">期数</th>
                        <th  style="width:10%;">还款本金 <span class="text-muted">(元)</span></th>
                        <th  style="width:10%;">还款利息 <span class="text-muted">(元)</span></th>
                        <th  style="width:15%;">服务费 <span class="text-muted">(元)</span></th>
                        <th  style="width:15%;">其他费用 <span class="text-muted">(元)</span></th>
                        <th  style="width:15%;">本期还款总额 <span class="text-muted">(元)</span></th>
                        <th style="width:20%;">日期</th>
                        <th  style="width:20%;">操作</th>
                    </tr>
                    </thead>
                    <tbody id="repayb2b"></tbody>
                </table>

            </div>
            <div class="form-group">
                <div class="col-sm-5">
                    <label  class="col-sm-4 control-label"><i class="text-danger">*</i> 意见</label>
                    <div class="col-sm-8">
              <textarea cols="168" rows="4" class="form-control" id="conclusion_lended" maxlength="50"
                        name="conclusion"></textarea>
                    </div>
                </div>
            </div>


        </form>
    </div>
</div>
<div class="op_box"  id="op_box_reloan_lended" style="display: none;">
    <h4>再贷公司出账</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class=" col-sm-8">
                <div class="form-group" >
                    <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出账时间</label>
                    <div class="col-sm-8">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="lendDate_reloan"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                            <input class="form-control" type="text" value="" readonly style="width:100%;" >
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-calendar"></span></span> </div>
                        <input type="text" hidden="hidden" id="lendDate_reloan"
                               name="lendDate_reloan" />
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 上传出账凭证</label>
                    <div class="col-sm-10">
                        <table name="warp">
                            <tr>
                                <td>
                                    <a href="javascript:;" class="file">选择文件
                                        <input id="up_img_WU_FILE_21"  name="files[]" type="file"
                                               data-url="reloan_lended" />
                                    </a>
                                    <p class="file_img"><img id="imgShow_WU_FILE_21"  /></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                    <div class="col-sm-10">
              <textarea cols="168" rows="2" class="form-control" id="conclusion_reloan_lended" maxlength="50"
                        name="conclusion"></textarea>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box"  id="op_box_helploan_lended" style="display: none;">
    <h4>助贷公司出账</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class=" col-sm-8">
                <div class="form-group" >
                    <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出账时间</label>
                    <div class="col-sm-8">
                        <div class="input-group date form_date" data-date=""
                             data-date-format="yyyy-mm-dd"
                             data-link-field="lendDate_helploan"
                             data-link-format="yyyy-mm-dd" style="width:200px;">
                            <input class="form-control" type="text" value="" readonly style="width:100%;" >
                <span class="input-group-addon"><span
                        class="glyphicon glyphicon-calendar"></span></span> </div>
                        <input type="text" hidden="hidden" id="lendDate_helploan"
                               name="lendDate_helploan" />
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 上传出账凭证</label>
                    <div class="col-sm-10">
                        <table name="warp">
                            <tr>
                                <td>
                                    <a href="javascript:;" class="file">选择文件
                                        <input id="up_img_WU_FILE_23"  name="files[]" type="file"
                                               data-url="helploan_lended" />
                                    </a>
                                    <p class="file_img"><img id="imgShow_WU_FILE_23"  /></p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="form-group">
                    <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                    <div class="col-sm-10">
              <textarea cols="168" rows="2" class="form-control" id="conclusion_helploan_lended" maxlength="50"
                        name="conclusion"></textarea>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<div class="op_box" id="op_box_reloanApprove" style="display: none;">
    <h4>再贷审批</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                <div class="col-sm-3">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_reloanApprove" id="reloanApproveinlineRadio1"
                               value="passed" checked="checked">
                        通过 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_reloanApprove" id="reloanApproveinlineRadio2"
                               value="rejected">
                        放弃 </label>
                </div>
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 再贷年化利率</label>
                <div class="col-sm-3">
                    <%--由于爱钱帮与再贷公司实现是业务相似，因此公用函数，因此画面上存在了相同ID的部品，爱钱帮没有再贷公司需求
                    因此此处可以注释掉--%>
                    <%--<div class="input_group" style="max-width:120px">--%>
                        <%--<input type="text" id="reloan_rate" maxlength="8" style="width:100%;" name="reloan" class="form-control"--%>
                               <%--onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"--%>
                               <%--onpaste="return false" />--%>
                        <span class="danwei">%</span>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 借款期限</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width: 120px">
                        <input type="text" name="loanLimitTime" maxlength="5"
                               style="width: 120px;" id="period_reloan" value=""
                               class="form-control valid"> <span class="danwei">月</span>
                    </div>
                </div>
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 还款方式</label>
                <div class="col-sm-3">
                    <select class="form-control pull-left valid" id="repayWay_reloan" name="repayWay">
                        <option value="AverageCapitalPlusInterest"> 等本等息 </option>
                        <option value="InterestRatesBefore"> 先息后本</option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="reloan_starttime_div">
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 服务费</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width: 120px">
                        <input type="text" class="form-control" name="serviceMoney"
                               id="serviceFee_reloan"
                               onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               onpaste="return false" maxlength="5" value=""
                               style="width: 100%;"> <span class="danwei">元</span>
                    </div>
                </div>
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 其他费用</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width: 120px">
                        <input type="text" class="form-control" name="otherMoney"
                               id="otherFee_reloan"
                               onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               onpaste="return false" maxlength="5" value=""
                               style="width: 100%;"> <span class="danwei">元</span>
                    </div>
                </div>
            </div>
            <div class="form-group" id="reloan_starttime_div">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 再贷开始时间</label>
                <div class="col-sm-3">
                    <div class="input-group date form_date" data-date=""
                         data-date-format="yyyy-mm-dd"
                         data-link-field="startDate_reloan"
                         data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input class="form-control" type="text" value="" readonly style="width:100%;">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="text" hidden="hidden" id="startDate_reloan"
                           name="startDate_reloan"/>
                </div>
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 预定结束时间</label>
                <div class="col-sm-3">
                    <div class="input-group date form_date" data-date=""
                         data-date-format="yyyy-mm-dd"
                         data-link-field="endDate_reloan"
                         data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input class="form-control" type="text" value="" readonly style="width:100%;">
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="text" hidden="hidden" id="endDate_reloan"
                           name="endDate_reloan"/>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-6">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_reloanApprove" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">还款信息</label>
                <div class="col-sm-4">
                    <a href="#plan-list" class="btn btn-success btn-search plan-show"
                       onclick="generateRepayPlanB2B('reloan')">生成还款计划</a>
                </div>
            </div>
            <div class="list_box col-md-offset-2">
                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th>期数</th>
                        <th>还款本金</th>
                        <th>还款利息</th>
                        <th>服务费</th>
                        <th>其他费用</th>
                        <th>本期还款总额</th>
                        <th>还款日期</th>
                    </tr>
                    </thead>
                    <tbody id="repayplan_reloan"></tbody>
                </table>
            </div>
        </form>
    </div>
</div>

<div class="op_box"  id="op_box_helploanApprove" style="display: none;">
    <h4>助贷审批</h4>
    <div class="op_box_con clearfix">
        <form class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-2 control-label"><i class="text-danger">*</i> 审评结论</label>
                <div class="col-sm-3">
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_helploanApprove" id="helploanApproveinlineRadio1" value="passed" checked="checked" />
                        通过 </label>
                    <label class="radio-inline">
                        <input type="radio" name="reviewStatus_helploanApprove" id="helploanApproveinlineRadio2" value="rejected" />
                        放弃 </label>
                </div>
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 助贷年化利率</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width:120px">
                        <%--爱车帮不存在再贷和助贷功能，爱车帮与再贷助贷功能冲突，因而此处进行屏蔽--%>
                        <%--<input type="text" id="helploan_rate" maxlength="8" style="width:100%;" name="reloan" class="form-control"--%>
                               <%--onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"--%>
                               <%--onpaste="return false" />--%>
                        <span class="danwei">%</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 借款期限</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width: 120px">
                        <input type="text" name="period_helploan" maxlength="5"
                               style="width: 120px;" id="period_helploan" value=""
                               class="form-control valid"> <span class="danwei">月</span>
                    </div>
                </div>
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 还款方式</label>
                <div class="col-sm-3">
                    <select class="form-control pull-left valid" id="repayWay_helploan" name="repayWay">
                        <!-- <option value="AverageCapitalPlusInterest"> 等本等息 </option>-->
                        <option value="InterestRatesBefore"> 先息后本 </option>
                    </select>
                </div>
            </div>
            <div class="form-group" id="reloan_starttime_div">
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 服务费</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width: 120px">
                        <input type="text" class="form-control" name="serviceMoney"
                               id="serviceFee_helploan"
                               onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               onpaste="return false" maxlength="5" value=""
                               style="width: 100%;"> <span class="danwei">元</span>
                    </div>
                </div>
                <label class="col-sm-2 control-label"><i
                        class="text-danger">*</i> 其他费用</label>
                <div class="col-sm-3">
                    <div class="input_group" style="max-width: 120px">
                        <input type="text" class="form-control" name="otherMoney"
                               id="otherFee_helploan"
                               onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
                               onpaste="return false" maxlength="5" value=""
                               style="width: 100%;"> <span class="danwei">元</span>
                    </div>
                </div>
            </div>
            <div class="form-group" id="helploan_starttime_div">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 助贷开始时间</label>
                <div class="col-sm-3">
                    <div class="input-group date form_date" data-date=""
                         data-date-format="yyyy-mm-dd"
                         data-link-field="startDate_helploan"
                         data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input class="form-control" type="text" value="" readonly style="width:100%;" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="text" hidden="hidden" id="startDate_helploan"
                           name="startDate_helploan" />
                </div>
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 预定结束时间</label>
                <div class="col-sm-3">
                    <div class="input-group date form_date" data-date=""
                         data-date-format="yyyy-mm-dd"
                         data-link-field="endDate_helploan"
                         data-link-format="yyyy-mm-dd" style="width:200px;">
                        <input class="form-control" type="text" value="" readonly style="width:100%;" >
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                    <input type="text" hidden="hidden" id="endDate_helploan"
                           name="endDate_helploan" />
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
                <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_helploanApprove" maxlength="50"
                      name="conclusion"></textarea>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">还款信息</label>
                <div class="col-sm-4">
                    <a href="#plan-list" class="btn btn-success btn-search plan-show" onclick="generateRepayPlanB2B('helploan')">生成还款计划</a>
                </div>
            </div>
            <div class="list_box col-md-offset-2">
                <table class="table table-bordered table-striped" >
                    <thead>
                    <tr>
                        <th>期数</th>
                        <th>还款本金</th>
                        <th>还款利息</th>
                        <th>服务费</th>
                        <th>其他费用</th>
                        <th>本期还款总额</th>
                        <th>还款日期</th>
                    </tr>
                    </thead>
                    <tbody id="repayplan_helploan"></tbody>
                </table>
            </div>
        </form>
    </div>
</div>

<div class="modal-footer ">
    <p class="col-sm-2 ">
        <a href="javascript:void(0)" onClick="closePage(0);"
           class="btn btn-default btn-block">关闭</a>
    </p>
    <p class="col-sm-2">
        <a  id="submitA" href = "javascript:void(0)" onClick="submitReview();" class="btn btn-danger btn-block">提交处理</a>
    </p>
</div>
<input type="hidden" id="processDefinitionId" />
<div id="loan_attachment_div" style="display:none;">
</div>
</body>
<script type="text/javascript">
    $("#recordings").hide();
    $("#recordingsIcon").hide();
    $("#entrustVid").hide();
    $("#entrustVidLabel").hide();

    // 文件上传Flag
    var upload_file = true;

    function loanController(taskId,processDefinitionId){
        $("#op_box_" + processDefinitionId).css("display","block");
    }

    function doReview(conclusion,loanId,reviewStatus,processDefinitionId,taskId,reviewMoney,lendDate){
        var op_box=$("#op_box_"+$("#processDefinitionId").val()).attr("id");
        $
                .ajax({
                    type:'POST',
                    url : '/admin/loan/imageUpLoad',
                    data : $("#"+op_box+" form").serialize(),
                });

        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/review.html',
            data: {
                "conclusion": conclusion,
                "loanId": loanId,
                "reviewStatus": reviewStatus,
                "processDefinitionId": processDefinitionId,
                "taskId": taskId,
                "reviewMoney": reviewMoney,
                "lendDate": lendDate
            },
            dataType: "text",
            success: function (data) {
                if (data == '0000' && upload_file == true) {
                    if(((processDefinitionId == "lended")&&(reviewStatus == 'loandirect'))||
                            (processDefinitionId == "reloan_lended")||
                            (processDefinitionId == "helploan_lended")||
                            ((processDefinitionId == "helploanReview")&&(reviewStatus == "rejected"))||
                            ((processDefinitionId == "helploanApprove")&&(reviewStatus == "rejected"))){
                        $.ajax({
                            type: 'POST',
                            url: '${basePath}/admin/loan/savereloaninfo.html',
                            data: {
                                "reloan_rate": $("#loanRate").val(),    //爱车帮集团版本修改
                                "startDate_reloan": $("#startDate_reloan").val(),
                                "endDate_reloan": $("#endDate_reloan").val(),
                                "loanId": loanId,
                                "loankind":"reloan",
                                "period_reloan":$("#period_reloan").val(),
                                "repayWay_reloan":$("#repayWay_reloan").val(),
                                "otherFee_reloan":$("#otherFee_reloan").val(),
                                "serviceFee_reloan":$("#serviceFee_reloan").val()
                            },
                            dataType: "text",
                            success: function (data) {
                                $.ajax({
                                    type: "POST",
                                    url: "/admin/loan/runRepaymentBpm",
                                    dataType: "text",
                                    data: {
                                        loanId: loanId
                                    },
                                    success:function(data){
                                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                            $("#fade2").css("display","none");
                                            //parent.document.getElementById('fade1').style.display='none';
	                                        $("#fade1").hide();
                                            if(window.location.href.indexOf("category=0")>0){
                                                document.location.href = '/admin/loan/agency.html?category=0';
                                            }else if(window.location.href.indexOf("category=1")>0){
                                                document.location.href = '/admin/loan/agency.html?category=1';
                                            }else if(window.location.href.indexOf("lendedLoanInfoList")>0){
                                                document.location.href = '/admin/loan/lendedLoanInfoList.html';
                                            }else{
                                                document.location.href = '/admin/loan/loanInfoList.html';
                                            }
                                            return true;
                                        });
                                    }
                                });

                            }, error: function () {
                                layer.msg("系统错误!");
                                return false;
                            }
                        });

                    }else{
                        //如果是再贷审批或者是助贷审批的情况下，在review的数据post成功后，需要需要进行贷款
                        // 信息的保存。
                        if(processDefinitionId == 'reloanApprove'){
                            $.ajax({
                                type: 'POST',
                                url: '${basePath}/admin/loan/savereloaninfo.html',
                                data: {
                                    "reloan_rate": $("#reloan_rate").val(),
                                    "startDate_reloan": $("#startDate_reloan").val(),
                                    "endDate_reloan": $("#endDate_reloan").val(),
                                    "loanId": loanId,
                                    "loankind":"reloan",
                                    "period_reloan":$("#period_reloan").val(),
                                    "repayWay_reloan":$("#repayWay_reloan").val(),
                                    "otherFee_reloan":$("#otherFee_reloan").val(),
                                    "serviceFee_reloan":$("#serviceFee_reloan").val()
                                },
                                dataType: "text",
                                success: function (data) {
                                    if (data == '0000') {
                                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                            $("#fade2").css("display","none");
                                            //parent.document.getElementById('fade1').style.display='none';
	                                        $("#fade1").hide();
                                            if(window.location.href.indexOf("category=0")>0){
                                                document.location.href = '/admin/loan/agency.html?category=0';
                                            }else if(window.location.href.indexOf("category=1")>0){
                                                document.location.href = '/admin/loan/agency.html?category=1';
                                            }else{
                                                document.location.href = '/admin/loan/loanInfoList.html';
                                            }
                                            return true;
                                        });
                                    }else{
                                        layer.msg("操作失败，请跟系统管理员联系!", {icon: 1, time: 1000}, function () {
                                            $("#fade2").css("display","none");
                                            //parent.document.getElementById('fade1').style.display='none';
	                                        $("#fade1").hide();
                                            if(window.location.href.indexOf("category=0")>0){
                                                document.location.href = '/admin/loan/agency.html?category=0';
                                            }else if(window.location.href.indexOf("category=1")>0){
                                                document.location.href = '/admin/loan/agency.html?category=1';
                                            }else{
                                                document.location.href = '/admin/loan/loanInfoList.html';
                                            }
                                            return true;
                                        });
                                    }
                                }, error: function () {
                                    layer.msg("系统错误!");
                                    return false;
                                }
                            });
                        }else if(processDefinitionId == 'helploanApprove'){
                            $.ajax({
                                type: 'POST',
                                url: '${basePath}/admin/loan/savereloaninfo.html',
                                data: {
                                    "reloan_rate": $("#helploan_rate").val(),
                                    "startDate_reloan": $("#startDate_helploan").val(),
                                    "endDate_reloan": $("#endDate_helploan").val(),
                                    "loanId": loanId,
                                    "loankind":"helploan",
                                    "period_reloan":$("#period_helploan").val(),
                                    "repayWay_reloan":$("#repayWay_helploan").val(),
                                    "otherFee_reloan":$("#otherFee_helploan").val(),
                                    "serviceFee_reloan":$("#serviceFee_helploan").val()
                                },
                                dataType: "text",
                                success: function (data) {
                                    if (data == '0000') {
                                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                            $("#fade2").css("display","none");
                                            //parent.document.getElementById('fade1').style.display='none';
	                                        $("#fade1").hide();
                                            if(window.location.href.indexOf("category=0")>0){
                                                document.location.href = '/admin/loan/agency.html?category=0';
                                            }else if(window.location.href.indexOf("category=1")>0){
                                                document.location.href = '/admin/loan/agency.html?category=1';
                                            }else{
                                                document.location.href = '/admin/loan/loanInfoList.html';
                                            }
                                            return true;
                                        });
                                    }else{
                                        layer.msg("操作失败，请跟系统管理员联系!", {icon: 1, time: 1000}, function () {
                                            $("#fade2").css("display","none");
                                            //parent.document.getElementById('fade1').style.display='none';
	                                        $("#fade1").hide();
                                            if(window.location.href.indexOf("category=0")>0){
                                                document.location.href = '/admin/loan/agency.html?category=0';
                                            }else if(window.location.href.indexOf("category=1")>0){
                                                document.location.href = '/admin/loan/agency.html?category=1';
                                            }else{
                                                document.location.href = '/admin/loan/loanInfoList.html';
                                            }
                                            return true;
                                        });
                                    }
                                }, error: function () {
                                    layer.msg("系统错误!");
                                    return false;
                                }
                            });
                        }{
                            layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                                $("#fade2").css("display","none");
                                //parent.document.getElementById('fade1').style.display='none';
	                            $("#fade1").hide();
                                if(window.location.href.indexOf("category=0")>0){
                                    document.location.href = '/admin/loan/agency.html?category=0';
                                }else if(window.location.href.indexOf("category=1")>0){
                                    document.location.href = '/admin/loan/agency.html?category=1';
                                }else{
                                    document.location.href = '/admin/loan/loanInfoList.html';
                                }
                                return true;
                            });
                        }

                    }

                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("系统错误!");
                return false;
            }
        });
    }
//下载合同共通函数
    function getLoanContractWord(loanId, type) {
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/'+type+'.html',
            data: {
                "loanId": loanId
            },
            dataType: "text",
            success: function (data) {
                var url = "${basePath}/loanAttachments/" + data;
//				window.open(url, '_blank');
                location.href=url;
            }, error: function () {
                layer.msg("系统错误!");
                return false;
            }
        })
    } 

    /** 提交评审 */
    function submitReview() {
        var flag=attachmentValidate();
        if(flag!=''){
            layer.msg(flag);
            return false;
        }
        var processDefinitionId = $("#processDefinitionId").val();
        var reviewStatus = $('input[name="reviewStatus_' + processDefinitionId+'"]:checked').val();
        var loanId = $("#customer_id_hidden").val().split(":")[0];
        var processDefinitionId = $("#customer_id_hidden").val().split(":")[3];
        var taskId = $("#customer_id_hidden").val().split(":")[2];
        var conclusionObj = $("#conclusion_" + processDefinitionId);
        var conclusion = conclusionObj.val();
        //由于再贷的还款日期控件与直贷(助贷)不同，因而需要进行分别判断
        var lendDate;
        if(processDefinitionId == 'reloan_lended'){
            lendDate = $("#lendDate_reloan").val();
        }else if(processDefinitionId == 'helploan_lended'){
            lendDate = $("#lendDate_helploan").val();
        }else{
            lendDate = $("#lendDate").val();
        }

        if(upload_file == false){
            layer.msg("文件上传中,请稍等");
            return false;
        }

        var reviewStatusStr = "通过";
        if (reviewStatus == "rejected") {
            reviewStatusStr = "拒绝";
        } else if (reviewStatus == "concludeAgain") {
            reviewStatusStr = "合同调整";
        }else{
            reviewStatus = "passed";
        }
        if (processDefinitionId === 'signContract') {
            /** 判断附件是否上传完毕 */
            var signContractReview = $("input[id='signContractReview']").val();//相关合同附件
            var oneCarPhoto = $("input[id='oneCarPhoto']").val();//人车合照
            var insurancePolicy = $("input[id='insurancePolicy']").val();//机动车交通强制保险单
            var falseKey = $("input[id='falseKey']").val();//车辆备用钥匙

            /** if (signContractReview == null || signContractReview == "") {
                 layer.msg("相关合同附件必须上传！");
                 return false;
            }
             if (oneCarPhoto == null || oneCarPhoto == "") {
                 layer.msg("人车合照必须上传！");
                 return false;
            }
             if (insurancePolicy == null || insurancePolicy == "") {
                 layer.msg("机动车交通强制保险单必须上传！");
                 return false;
            }
             if (falseKey == null || falseKey == "") {
                 layer.msg("车辆备用钥匙必须上传！");
                 return false;
            }*/
            reviewStatusStr ='上传合同附件';

        }else if(processDefinitionId == 'reloanE_Contract'){
            reviewStatus = 'passed';
            reviewStatusStr = '已签订';
        } else if(processDefinitionId === 'lended') {
            //取得出款的方式
            var lendedMethod =$("input[name='loanMethodSelect'][checked]").val();
            //助贷和直贷的情况下，必须进行出账和上传出账凭证
            if((lendedMethod == 'loandirect')||(lendedMethod == 'helploan')){
                if (lendDate == null || lendDate == "") {
                    layer.msg("出账时间不能为空！");
                    return false;
                }
                if($("#repayb2b").html().length==0)
                {
                    layer.msg("请先生成总公司还款计划");
                    return false;
                }
            }else{
                //再贷的情况下，只需要进行评论的填写即可，其他不用做。
            }
            //设置review的状态
            reviewStatus = lendedMethod;
            //设置ONS表示的内容
            if(reviewStatus == 'loandirect'){
                reviewStatusStr = '直贷';
            }else if(reviewStatus == 'helploan'){
                reviewStatusStr = '助贷';
            }else if(reviewStatus == 'reloan'){
                reviewStatusStr = '再贷';
            }

        } else if(processDefinitionId === 'visiteCheck'){

        }else if(processDefinitionId === 'callBack'){
            if (reviewStatus == "rejected") {
                reviewStatusStr = "需家访";
            } else {
                reviewStatusStr = "无需家访";
            }
        }else if(processDefinitionId === 'mortgage'){
            if (reviewStatus == "rejected") {
                reviewStatusStr = "抵押失败";
            } else {
                reviewStatusStr = "抵押成功";
            }
        }else if(processDefinitionId === 'instock'){

            reviewStatusStr = "押品入库";
        }else if(processDefinitionId === 'dataReview'){
            if (reviewStatus == "rejected") {
                reviewStatusStr = "资料驳回";
            } else {
                reviewStatusStr = "资料上传无误";
            }
        }else if(processDefinitionId === 'lended'){
            if (reviewStatus == "loandirect") {
                reviewStatusStr = "直贷";
            }else if(reviewStatus == "reloan"){
                reviewStatusStr = "再贷";
            } else {
                reviewStatusStr = "助贷";
            }
        }else if((processDefinitionId === 'reloanReview')||
                (processDefinitionId === 'helploanReview')){
            if (reviewStatus == "rejected") {
                reviewStatusStr = "放弃";
            }else{
                reviewStatusStr = "通过";
            }
        }else if((processDefinitionId === 'reloanApprove')||
                (processDefinitionId === 'helploanApprove')){
            //设置提示语
            if (reviewStatus == "rejected") {
                reviewStatusStr = "放弃";
            }else{
                reviewStatusStr = "通过";
            }
            //对比填项目进行check
            if(reviewStatus != "rejected"){
                debugger;
                if (processDefinitionId === 'reloanApprove'){
                    if($("#reloan_rate").val() == ''){
                        layer.msg("再贷利率不能为空，请确认!");
                        return false;
                    }
                    if($("#startDate_reloan").val() == ''){
                        layer.msg("再贷开始日期不能为空，请确认！");
                        return false;
                    }
                    if($("#endDate_reloan").val() == ''){
                        layer.msg("再贷预定结束日期不能为空，请确认！");
                        return false;
                    }
                    if($("#repayplan_reloan").html().length==0)
                    {
                        layer.msg("请先生成总公司还款计划");
                        return false;
                    }
                }else{
                    if($("#helploan_rate").val() == ''){
                        layer.msg("助贷利率不能为空，请确认!");
                        return false;
                    }
                    if($("#startDate_helploan").val() == ''){
                        layer.msg("助贷开始日期不能为空，请确认！");
                        return false;
                    }
                    if($("#endDate_helploan").val() == ''){
                        layer.msg("助贷预定结束日期不能为空，请确认！");
                        return false;
                    }
                    if($("#repayplan_helploan").html().length==0)
                    {
                        layer.msg("请先生成总公司还款计划");
                        return false;
                    }
                }
            }
        }else if(processDefinitionId === 'reloanE_Contract'){

            reviewStatusStr = "上传再贷合同";
        }else if(processDefinitionId === 'reloan_lended'){

            reviewStatusStr = "再贷放款";
        }else if(processDefinitionId === 'helploanE_Contract'){

            reviewStatusStr = "上传助贷合同";
        }else if(processDefinitionId === 'helploan_lended'){

            reviewStatusStr = "助贷放款";
        }
        if (conclusion == null || conclusion == "") {
            layer.msg("评审意见不能为空！");
            conclusionObj.focus();
            return false;
        }
//      var taskId = $("#taskId").val();
        var reviewMoney = $("#reviewMoney").val() * 10000;
        if(processDefinitionId == "judgment"){
            reviewMoney = $("#judgmentMoney").val() * 10000;
        }
        if(isNaN(reviewMoney) || reviewMoney <= 0){
            layer.msg("审批金额不能为空！");
            return false;
        }
        var dialogMsg = "你确定<font color='red'>" + reviewStatusStr + "</font>吗？";

        alertMessage(dialogMsg,'doReview("'+conclusion+'","'+loanId+'","'+reviewStatus+'","'+processDefinitionId+'","'+taskId+'","'+reviewMoney+'","'+lendDate+'")','qs_box1');
    }
    $(function() {
        //getDataForRepayB2B();

        $("input[name='loanMethodSelect']").change(function(){
            debugger;
            if($("input[name='loanMethodSelect'][checked]").val()=='loandirect'){
                $("#generateRepayPlanBtn").attr("onclick", "generateRepayPlanB2B('loandirect')");
            }else if($("input[name='loanMethodSelect'][checked]").val()=='helploan'){
                $("#generateRepayPlanBtn").attr("onclick", "generateRepayPlanB2B('helploan')");
            }else{
                $("#generateRepayPlanBtn").attr("onclick", "generateRepayPlanB2B('reloan')");
            }
        });

        $(".collection_Edit").click(function(){
            $(this).parents("tr").find($(".other_txt")).hide();
            $(this).parents("tr").find($(".control-sml")).show();
            $(this).parents("tr").find($(".red-group")).show();
            $(this).parents("tr").find($(".btn-do")).show();
            $(this).hide();
            $(this).parents("tr").find($(".collection_cancel")).click(function(){
                $(this).parents("tr").find($(".btn-do")).hide();
                $(this).parents("tr").find($(".control-sml")).hide();
                $(this).parents("tr").find($(".red-group")).hide();
                $(this).parents("tr").find($(".other_txt")).show();
                $(this).parents("tr").find($(".collection_Edit")).show();
            });
            $(this).parents("tr").find($(".collection_cancel")).click(function(){


            });
        });


        $('input[type="radio"]').click(function(){
            $("input[type='radio']").removeAttr("checked");
            $(this).attr("checked","checked");
        });
        var aaa = $("#customer_id_hidden").val();
        var loanId = $("#customer_id_hidden").val().split(":")[0];
        var taskid = $("#customer_id_hidden").val().split(":")[2];
        var state = $("#customer_id_hidden").val().split(":")[5];
        var div= ""

        //alert(aaa);
        //alert(taskid);
        //alert(state);
        //在页面详情中，删除现在去评估按钮，原因是保留的话，还需要进行是否
        //签收的判断，因而考虑可以进行删除。
//		if(state == "vehicleAssess"){
//		  //alert(0);
//		  $("#processid").val(taskid);
//		   div= " <div class='alert alert-danger' role='alert'> "
//					+" <i class='fa fa-exclamation-triangle' "
//					+" style='margin-right: 10px;'></i> 此订单还未进行车辆评估，<a href='#' onclick='caozuo();' "
//					+" class='btn btn-sm btn-danger'>现在去评估</a> "
//					+" </div> ";
//		}
        $("#d1").html(div);
        //初始化上传图片地址
        var inputs = $("input[type='file']");
        $.each(inputs,function(value){
            $(this).attr("data-url","/admin/file/upload/"+loanId+"/"+$(this).attr('data-url')+".html");
        });


        /**面审视频截图 */
        $('#up_img_WU_FILE_0').fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_0'));
            }
        });

        /** 车辆行驶证 */
        $("#up_img_WU_FILE_1").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_1'));
            }
        });

        /** 机动车登记证书 */
        $("#up_img_WU_FILE_2").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_2'));
            }
        });

        /** 机动车商业保险单 */
        $("#up_img_WU_FILE_3").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_3'));
            }
        });

        /** 其他附件 */
        $("#up_img_WU_FILE_4").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_4'));
            }
        });

        $("#up_img_WU_FILE_5").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_5'));
            }
        });

        $("#up_img_WU_FILE_6").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_6'));
            }
        });

        $("#up_img_WU_FILE_7").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_7'));
            }
        });
        $("#up_img_WU_FILE_8").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_8'));
            }
        });
        $("#up_img_WU_FILE_9").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_9'));
            }
        });
        $("#up_img_WU_FILE_10").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_10'));
            }
        });
        $("#up_img_WU_FILE_11").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_11'));
            }
        });
        $("#up_img_WU_FILE_12").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_12'));
            }
        });
        $("#up_img_WU_FILE_13").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_13'));
            }
        });
        $("#up_img_WU_FILE_14").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_14'));
            }
        });
        $("#up_img_WU_FILE_15").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_15'));
            }
        });
        $("#up_img_WU_FILE_16").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_16'));
            }
        });
        $("#up_img_WU_FILE_17").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_17'));
            }
        });
        $("#up_img_WU_FILE_18").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_18'));
            }
        });
        $("#up_img_WU_FILE_19").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_19'));
            }
        });
        $("#up_img_WU_FILE_20").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_20'));
            }
        });
        $("#up_img_WU_FILE_21").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_21'));
            }
        });
        $("#up_img_WU_FILE_22").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_22'));
            }
        });
        $("#up_img_WU_FILE_23").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#imgShow_WU_FILE_23'));
            }
        });
        $("#up_vid_WU_FILE_1").change(function(){
            upload_file = false;
        });
        $("#up_vid_WU_FILE_1").fileupload({
            dataType: 'json',
            done: function (e, data) {
                doneProcess(data,$('#vidShow_WU_FILE_1'));
            }
        });
        var doneProcess = function (data,obj) {
            $.each(data.result, function (index, file) {
                if (file.code == "0000") {
                    upload_file = true;
                    layer.msg("上传成功！");
                    if(file.fileName.indexOf(".mp3")>0||file.fileName.indexOf(".aac")>0||file.fileName.indexOf(".ape")>0
                            ||file.fileName.indexOf(".wma")>0||file.fileName.indexOf(".ac3")>0||file.fileName.indexOf(".amr")>0
                            ||file.fileName.indexOf(".flac")>0||file.fileName.indexOf(".m4r")>0||file.fileName.indexOf(".mmf")>0
                            ||file.fileName.indexOf(".mp2")>0||file.fileName.indexOf(".wav")>0||file.fileName.indexOf(".wv")>0
                            ||file.fileName.indexOf(".ogg")>0||file.fileName.indexOf(".avi")>0||file.fileName.indexOf(".mpeg")>0
                            ||file.fileName.indexOf(".mpg")>0||file.fileName.indexOf(".rmvb")>0||file.fileName.indexOf(".mov")>0
                            ||file.fileName.indexOf(".asf")>0||file.fileName.indexOf(".wmv")>0||file.fileName.indexOf(".mkv")>0
                            ||file.fileName.indexOf(".mp4")>0||file.fileName.indexOf(".m4v")>0||file.fileName.indexOf(".3gp")>0
                            ||file.fileName.indexOf(".flv")>0||file.fileName.indexOf(".f4v")>0){
                        if("#vidShow_WU_FILE_1"==obj.selector){
                            $("#entrustVid").show();
                            $("#entrustVidLabel").show();
                            $("#entrustVidLabel").html(file.fileName);
                        }else{
                            $("#recordings").show();
                            $("#recordingsIcon").show();
                            $("#recordings").html(file.fileName);
                        }
                    }
                    $(obj).attr("src",file.showFilePath);
                    $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId="+loanId);
                } else {
                    upload_file = true;
                    if(file.code == "9999"){
                        layer.msg("不支持此类型的文件！");
                    }
                }
            });
        };
        var	n = $(".fj_list>li").length+20;
        $("#add_img").click(function(){
            var loan_uuid = $("#customer_id_hidden").val().split(":")[0];
            $("#li_add").before(' <li><p>其他</p><div> <a href="javascript:;" class="file">选择文件<input type="file" name="files[]" id="up_img_WU_FILE_'+n+'" data-url="${basePath}/admin/file/upload/'+loan_uuid+'/other.html" ></a><p class="file_img"><img id="imgShow_WU_FILE_'+n+'" ></p></div></li>');
            $("#up_img_WU_FILE_"+n).fileupload({
                dataType: 'json',
                done: function (e, data) {
                    doneProcess(data, $("#imgShow_WU_FILE_"+n));
                }
            });
            new uploadPreview({ UpBtn: "up_img_WU_FILE_"+n, ImgShow: "imgShow_WU_FILE_"+n});
            n = n+1;

        });

        var uuid;
        var customer_id_hiddenstr = $("#customer_id_hidden").val();
        var strarray = new Array();
        strarray = customer_id_hiddenstr.split(":");
        var customer_id_hidden = strarray[0];
        var orderid = strarray[1];
        var taskId = strarray[2];
        var processDefinitionId = strarray[3];
        var assignee = strarray[4];
        var channel = strarray[6];
        $("#processDefinitionId").val(processDefinitionId);

        //如果是车辆评估节点，则不显示提交处理按钮
        if(processDefinitionId == "vehicleAssess"){
            $("#submitA").hide();
        }else{
            //流程画面控制
            if("null" != assignee && "" != assignee){
                if("yes"==channel){
                    $("#submitA").hide();
                }else{
                    loanController(taskId,processDefinitionId);
                    $("#submitA").show();
                }
            }else{
                $("#submitA").hide();
            }
        }

        /*BUG277*/


        //设置订单号
        $("#orderid").html("订单号:"+orderid);
        //取得贷款历史数据
        $.ajax({
            url : "/admin/loan/historyloanlist?uuid="+customer_id_hidden,
            type : "get",
            dataType : "json",
            success : function(data) {
                var length = data.historyLoanlist.length;
                var dspstr = "";
                for(var i=0; i< length; i++){
                    var record = data.historyLoanlist[i];
                    var loanstatus = "";
                    //对贷款状态进行转换
                    if(record.loanStatus == "vehicleAssess"){
                        loanstatus = "待车辆评估";
                    }else if(record.loanStatus == "departLeadAduit"){
                        loanstatus = "待初审";
                    }else if(record.loanStatus == "departLeadAduit_rejected"){
                        loanstatus = "初审不通过";
                    }else if(record.loanStatus == "trialPhase"){
                        loanstatus = "待总部面审";
                    }else if(record.loanStatus == "trialPhase_rejected"){
                        loanstatus = "总部面审不通过";
                    }else if(record.loanStatus == "callBack"){
                        loanstatus = "待电话核实";
                    }else if(record.loanStatus == "visiteCheck"){
                        loanstatus = "待线下上门核实";
                    }else if(record.loanStatus == "judgment"){
                        loanstatus = "待总部终审";
                    }else if(record.loanStatus == "judgment_rejected"){
                        loanstatus = "总部终审不通过";
                    }else if(record.loanStatus == "signContract"){
                        loanstatus = "待线下签订相关合同";
                    }else if(record.loanStatus == "signContract_rejected"){
                        loanstatus = "签订合同终止";
                    }else if(record.loanStatus == "dataReview"){
                        loanstatus = "资料复核";
                    }else if(record.loanStatus == "reuploadInformatin"){
                        loanstatus = "资料或相关合同重新上传";
                    }else if(record.loanStatus == "lended"){
                        loanstatus = "待出账";
                    }else if(record.loanStatus == "repayment"){
                        loanstatus = "还款中";
                    }else if(record.loanStatus == "end"){
                        loanstatus = "已完结";
                    }else if (record.loanStatus == "mortgage") {
                        loanstatus = "待办理抵押";
                    }else if (record.loanStatus == "instock") {
                        loanstatus = "待办理入库";
                    }else if (record.loanStatus == "reloanReview"){
                        loanstatus = "待再贷资料复核";
                    }else if (record.loanStatus == "reloanApprove"){
                        loanstatus = "待再贷审批";
                    }else if (record.loanStatus == "reloanE_Contract"){
                        loanstatus = "待再贷电子合同签订";
                    }else if (record.loanStatus == "reloan_lended"){
                        loanstatus = "待再贷放款";
                    }else if (record.loanStatus == "helploanReview"){
                        loanstatus = "待助贷资料复核";
                    }else if (record.loanStatus == "helploanApprove"){
                        loanstatus = "待助贷审批";
                    }else if (record.loanStatus == "helploanE_Contract"){
                        loanstatus = "待助贷电子合同签订";
                    }else if (record.loanStatus == "helploan_lended"){
                        loanstatus = "待助贷放款";
                    }
                    var str = "<tr>"
                            + "<td>"+record.customerRegisterInfo.customerName+"</td>"
                            +"<td>"+ record.idCard + "</td>"
                            +"<td>"+ record.applyMoney + "</td>"
                            +"<td>"+ record.loanMoney + "</td>"
                            +"<td>"+ record.applyedAt + "</td>"
                            +"<td>"+ loanstatus + "</td>"
                            +"<td>"+ record.company.name + "</td>"
                            +"<td>"+ record.dept.name + "</td>"
                            +"<td>"+ record.responsibleBy.realname + "</td>"
                            +"</tr>";
                    dspstr = dspstr + str;
                }
                $("#historytable tr:last").after(dspstr);
            }
        });
        //取得借款数据
        $.ajax({
            url : "/admin/loan/loanreqinfo?uuid="+customer_id_hidden,
            type : "get",
            dataType : "json",
            success : function(data) {
                //申请金额处理
                var applymoney = data.loanInfo.applyMoney / 10000;
                if(data.loanInfo.loanMoney == '0.00'){
                    $("#reviewMoney").val(applymoney);
                    $("#judgmentMoney").val(applymoney);
                }else if(data.loanInfo.loanMoney != '0.00'){
                    $("#reviewMoney").val(data.loanInfo.loanMoney / 10000);
                    $("#judgmentMoney").val(data.loanInfo.loanMoney / 10000);
                }
                var applaymoneyround = getRoundDigital(applymoney,2);
                var dispstr = "<b class=\"text-danger\">";
                dispstr = dispstr + applaymoneyround;
                dispstr = dispstr + "</b> 万元";
                $("#applyMoney").html(dispstr);
                //审批金额
                var approvemoney = data.loanInfo.loanMoney/10000;
                var approvemoneyround = getRoundDigital(approvemoney,2);
                dispstr = "<b class=\"text-danger\">";
                dispstr = dispstr + approvemoneyround;
                dispstr = dispstr + "</b> 万元";
                $("#approveMoney").html(dispstr);
                //借款状态
                var record = data.loanInfo;
                if(record.loanStatus == "vehicleAssess"){
                    loanstatus = "待车辆评估";
                }else if(record.loanStatus == "departLeadAduit"){
                    loanstatus = "待初审";
                }else if(record.loanStatus == "departLeadAduit_rejected"){
                    loanstatus = "初审不通过";
                }else if(record.loanStatus == "trialPhase"){
                    loanstatus = "待总部面审";
                }else if(record.loanStatus == "trialPhase_rejected"){
                    loanstatus = "总部面审不通过";
                }else if(record.loanStatus == "callBack"){
                    loanstatus = "待电话核实";
                }else if(record.loanStatus == "visiteCheck"){
                    loanstatus = "待线下上门核实";
                }else if(record.loanStatus == "judgment"){
                    loanstatus = "待总部终审";
                }else if(record.loanStatus == "judgment_rejected"){
                    loanstatus = "总部终审不通过";
                }else if(record.loanStatus == "signContract"){
                    loanstatus = "待线下签订相关合同";
                }else if(record.loanStatus == "signContract_rejected"){
                    loanstatus = "签订合同终止";
                }else if(record.loanStatus == "dataReview"){
                    loanstatus = "资料复核";
                }else if(record.loanStatus == "reuploadInformatin"){
                    loanstatus = "资料或相关合同重新上传";
                }else if(record.loanStatus == "lended"){
                    loanstatus = "待出账";
                }else if(record.loanStatus == "repayment"){
                    loanstatus = "还款中";
                }else if(record.loanStatus == "end"){
                    loanstatus = "已完结";
                }else if (record.loanStatus == "mortgage") {
                    loanstatus = "待办理抵押";
                }else if (record.loanStatus == "instock") {
                    loanstatus = "待办理入库";
                }else if (record.loanStatus == "reloanReview"){
                    loanstatus = "待再贷资料复核";
                }else if (record.loanStatus == "reloanApprove"){
                    loanstatus = "待再贷审批";
                }else if (record.loanStatus == "reloanE_Contract"){
                    loanstatus = "待再贷电子合同签订";
                }else if (record.loanStatus == "reloan_lended"){
                    loanstatus = "待再贷放款";
                }else if (record.loanStatus == "helploanReview"){
                    loanstatus = "待助贷资料复核";
                }else if (record.loanStatus == "helploanApprove"){
                    loanstatus = "待助贷审批";
                }else if (record.loanStatus == "helploanE_Contract"){
                    loanstatus = "待助贷电子合同签订";
                }else if (record.loanStatus == "helploan_lended"){
                    loanstatus = "待助贷放款";
                }
                $("#loanstatus").html(loanstatus);
                //订单号
                $("#loanorderid").html(orderid);
                //借款人
                $("#loanername").html(data.loanInfo.customerRegisterInfo.customerName);

                var pledgeType = data.loanInfo.pledgeType;
                var pledgeTypeStr = "";
                if(pledgeType == "drivePledge"){
                    pledgeTypeStr = "押证";
                }else if(pledgeType == "vehiclePledge"){
                    pledgeTypeStr = "押车";
                }
                $("#mortgageType").html(pledgeTypeStr);
                //申请时间
                $("#applytime").html(data.loanInfo.applyedAt);
                //还款来源
                $("#repaymentsrc").html(data.loanInfo.repaySource);
                //所属分公司
                $("#loancompany").html(data.loanInfo.company.name);
                //所属部门
                $("#loandept").html(data.loanInfo.dept.name);
                //客户经理
                $("#customermanager").html(data.loanInfo.responsibleBy.realname);
                //录入人
                $("#loanrecorder").html(data.loanInfo.createBy.realname);
                //录入时间
                $("#createtime").html(data.loanInfo.createdAt);
                //年利率
                var yearrate = data.loanInfo.loanRate;
                var yearratestr = getRoundDigital(yearrate,2);
                yearratestr += "%";
                $("#yearrate").html(yearratestr);
                //月利率
                var monthrate = yearrate/12;
                var monthratestr = getRoundDigital(monthrate,2);
                monthratestr += "%";
                $("#monthrate").html(monthratestr);
                //贷款期限
                var periodstr = data.loanInfo.loanLimitTime;
                periodstr += "个月";
                $("#period").html(periodstr);
                //开户名
                var accountname = data.accountInfo.accountName;
                $("#accountname").html(accountname);
                //开户行
                var accountbank = data.accountInfo.bankName;
                $("#accountbank").html(accountbank);
                //银行账号
                var accountnumber = data.accountInfo.accountNum;
                $("#accountnumber").html(accountnumber);
                //还款方式追加
                var repayway = record.repayWay;
                //记录还款方式用于进行贷款续借的时候进行使用。
                var repaywaystr = "";
                if(repayway == "AverageCapitalPlusInterest"){
                    repaywaystr = "等本等息";
                }else if(repayway == "InterestRatesBefore"){
                    repaywaystr = "先息后本";
                }else if(repayway == "flexiblerepaymentv2"){
                    repaywaystr = "灵活还款";
                }else if(repayway == "averagePrincipalreduceinterest"){
                    repaywaystr = "等本减息";
                }else if(repayway == "averagePrincipalzerointerestrent"){
                    repaywaystr = "等本零息(押证)";
                }else if(repayway == "intrestbeforePrincipalrent"){
                    repaywaystr = "先息后本(押证)";
                }else if(repayway == "intrestbeforePrincipaltransfer"){
                    repaywaystr = "先息后本(押车)";
                }
                $("#repayWay").html(repaywaystr);


                //数据显示更新 by why 20160918
                $("#loanPurpose").html(data.loanInfo.loanPurpose);
                $("#hostOpinion").html(data.loanInfo.hostOpinion);
                $("#loan_remark").html(data.loanInfo.remark);
                var loan_product="";
                switch(data.loanInfo.loan_product)
                {
                    case "0":
                        loan_product="车抵贷";
                        break;
                    case "1":
                        loan_product="押车贷";
                        break;
                    case "2":
                        loan_product="车主贷";
                        break;
                    case "3":
                        loan_product="车商贷";
                        break;
                    case "4":
                        loan_product="首付贷";
                        break;
                    case "5":
                        loan_product="二手车分期";
                        break;
                    case "6":
                        loan_product="以租代购";
                        break;
                }
                $("#loan_product").html(loan_product);

                $("#buy_car_method").html(data.loanInfo.buy_car_method=="0"?"全款":"按揭");

                $("#plantype").html(data.loanInfo.plantype==0?"服务管理费按月收取":"服务管理费一次性收取");

                $("#drunkDrive").html(data.loanInfo.drunkDrive+"%");

                $("#depreciationFee").html(data.loanInfo.depreciationFee+"%");

                $("#parkCost").html((data.loanInfo.parkCost==""?"0":data.loanInfo.parkCost)+"元");
                //设置状态进度条
                var processDefinitionId = $("#processDefinitionId").val();
                //如果当前节点是重新长传附件节点，表示为复核节点
                if(processDefinitionId == 'reuploadInformatin'){
                    processDefinitionId = 'dataReview';
                }

                if(processDefinitionId=='reloanApprove'
                        ||processDefinitionId=='reloanE_Contract'
                        ||processDefinitionId=='reloanReview'
                        ||processDefinitionId=='reloan_lended'
                        ||processDefinitionId=='helploanReview'
                        ||processDefinitionId=='helploanApprove'
                        ||processDefinitionId=='helploanE_Contract'
                        ||processDefinitionId=='helploan_lended') {

                    $("#tab_b2b").css('display','block');

                    if(processDefinitionId=='helploanApprove')
                    {
                        $("#period_helploan").val(data.loanInfo.loanLimitTime);
                    }

                    if(processDefinitionId=='reloanApprove')
                    {
                        $("#period_reloan").val(data.loanInfo.loanLimitTime);
                    }
                    if(processDefinitionId=='reloan_lended'||processDefinitionId=='helploan_lended') {
                        $(".nav-tabs").find("li").removeClass('active');
                        $("#tab_b2b").addClass('active');
                        $("#tab_b2b a").attr("aria-expanded", "true");
                        $(".tab-pane").removeClass('active');
                        $("#tab0").addClass('active');
                    }
                }

                setStatusBar(processDefinitionId,pledgeType);
            }
        });
        function getRoundDigital(digit, length) {
            length = length ? parseInt(length) : 0;
            if (length <= 0) return Math.round(digit);
            digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
            return digit;
        }
        $.ajax({
            url : "/admin/customer/loanerDetailInfo?uuid=" + customer_id_hidden,
            type : "get",
            dataType : "json",
            success : function(data) {
                var education = data.customerRegisterInfo.education;
                var education1;
                var house = data.customerRegisterInfo.house;
                var house1;
                var maritalStatus = data.customerRegisterInfo.maritalStatus;
                var maritalStatus1;
                var enterpriseType = data.customerAdditionalInfo.enterpriseType;
                var enterpriseType1;
                var position = data.customerAdditionalInfo.position;
                var position1;
                var hasHouse = data.customerAdditionalInfo.hasHouse;
                var hasHouse1;
                var enterpriseIndustry=data.customerAdditionalInfo.enterpriseIndustry;
                var enterpriseIndustry1;

                uuid=data.customerRegisterInfo.uuid;

                if (education == "undergraduate") {
                    education1 = "本科"
                } else if (education == "college") {
                    education1 = "大专"
                } else if (education == "doctor") {
                    education1 = "博士及以上"
                } else if (education == "master") {
                    education1 = "硕士"
                } else if (education == "senior") {
                    education1 = "高中及中专"
                } else {
                    education1 = "初中及以下"
                }
                if (house == "commodity") {
                    house1 = "商品房无按揭"
                } else if (house == "commodity_mortgage") {
                    house1 = "商品房无按揭"
                } else if (house == "commodity_mortgage") {
                    house1 = "商品房有按揭"
                } else if (house == "bought_public") {
                    house1 = "已购公房"
                } else if (house == "self_build") {
                    house1 = "自建房"
                } else if (house == "rent") {
                    house1 = "租用"
                } else {
                    house1 = "亲属住房"
                }
                if (maritalStatus == "WH") {
                    maritalStatus1 = "未婚"
                } else if (maritalStatus == "YH") {
                    maritalStatus1 = "已婚"
                } else if (maritalStatus == "LY") {
                    maritalStatus1 = "离异"
                } else if (maritalStatus == "SR") {
                    maritalStatus1 = "丧偶"
                } else {
                    maritalStatus1 = "再婚"
                }
                if (enterpriseType == "institutions") {
                    enterpriseType1 = "机关事业单位"
                } else if (enterpriseType == "government") {
                    enterpriseType1 = "国有企业"
                } else if (enterpriseType == "three_funded") {
                    enterpriseType1 = "三资企业"
                } else if (enterpriseType == "private") {
                    enterpriseType1 = "私营"
                } else if (enterpriseType == "professional") {
                    enterpriseType1 = "自由职业者"
                } else if (enterpriseType == "social_organization") {
                    enterpriseType1 = "社会团体"
                } else {
                    enterpriseType1 = "其他"
                }
                if (position == "chairman") {
                    position1 = "董事长"
                } else if (position == "director") {
                    position1 = "董事"
                } else if (position == "manager") {
                    position1 = "总经理"
                } else if (position == "executives") {
                    position1 = "单位高管"
                } else if (position == "department_manage") {
                    position1 = "部门主管"
                } else {
                    position1 = "普通职员"
                }
                if (hasHouse) {
                    hasHouse1 = "有"
                } else {
                    hasHouse1 = "无"
                }
                if(enterpriseIndustry=="1"){
                    enterpriseIndustry1="计算机/互联网/通信/电子";
                }else if(enterpriseIndustry=="2"){
                    enterpriseIndustry1="会计/金融/银行/保险";
                }else if(enterpriseIndustry=="3"){
                    enterpriseIndustry1="贸易/消费/制造/营运";
                }else if(enterpriseIndustry=="4"){
                    enterpriseIndustry1="制药/医疗";
                }else if(enterpriseIndustry=="5"){
                    enterpriseIndustry1="广告/媒体";
                }else if(enterpriseIndustry=="6"){
                    enterpriseIndustry1="房地产/建筑";
                }else if(enterpriseIndustry=="7"){
                    enterpriseIndustry1="专业服务/教育/培训";
                }else if(enterpriseIndustry=="8"){
                    enterpriseIndustry1="服务业";
                }else if(enterpriseIndustry=="9"){
                    enterpriseIndustry1="物流/运输";
                }else if(enterpriseIndustry=="a"){
                    enterpriseIndustry1="能源/原材料";
                }else if(enterpriseIndustry=="b"){
                    enterpriseIndustry1="私营企业主";
                }else if(enterpriseIndustry=="c"){
                    enterpriseIndustry1="政府/非赢利机构/其他";
                }

                $("#uuid").html(uuid);
                $("#customerName1").html(
                        data.customerRegisterInfo.customerName);
                $("#idCard").html(data.customerRegisterInfo.idCard);
                $("#mobile").html(data.customerRegisterInfo.mobile);
                $("#education").html(education1);
                $("#house").html(house1);
                $("#maritalStatus").html(maritalStatus1);
                $("#liveNumber1").html(
                        data.customerRegisterInfo.liveNumber);

                $("#liveAddress").html(
                        data.customerRegisterInfo.liveAddress);
                $("#enterpriseName").html(
                        data.customerAdditionalInfo.enterpriseName);
                $("#enterpriseIndustry").html(
                        enterpriseIndustry1);
                $("#enterpriseTel").html(
                        data.customerAdditionalInfo.enterpriseTel);
                $("#enterpriseType").html(enterpriseType1);
                $("#position").html(position1);

                $("#enterpriseAddress").html(
                        data.customerAdditionalInfo.enterpriseAddress);

                $("#hasHouse1").html(hasHouse1);
                $("#income").html(data.customerAdditionalInfo.income);
                $("#company-name").html(
                        data.customerRegisterInfo.company.name);
                $("#dept-name").html(
                        data.customerRegisterInfo.dept.name);
                $("#user-realname").html(
                        data.customerRegisterInfo.user.realname);
                $("#creditCardNum").html(
                        data.customerRegisterInfo.creditCardNum);
                $("#creditCardQuota").html(
                        data.customerRegisterInfo.creditCardQuota);
                $("#creditCardBankName").html(
                        data.customerRegisterInfo.creditCardBankName);
                $("#creditCard").html(
                        data.customerRegisterInfo.creditCard);
                $("#remark").html(data.customerRegisterInfo.remark);

// 						alert(data.customerRegisterInfo.remark)
                //数据显示更新 by why 20160918
                $("#sex").html(data.customerRegisterInfo.sex=='M'?'男':'女');
                $("#age").html(data.customerRegisterInfo.age);
                var customer_from;
                switch(data.customerAdditionalInfo.customer_from)
                {
                    case 0:
                        customer_from="中  介";
                        break;
                    case 1:
                        customer_from="客户推荐";
                        break;
                    case 2:
                        customer_from="宣传单/卡";
                        break;
                    case 3:
                        customer_from="小区推广";
                        break;
                    case 4:
                        customer_from="短  信";
                        break;
                    case 5:
                        customer_from="网络营销";
                        break;
                    case 6:
                        customer_from="电  销";
                        break;
                    case 7:
                        customer_from="其  他";
                        break;
                }
                $("#customerFrom").html(customer_from);
                $("#homeTel").html(data.customerRegisterInfo.home_tel);
                $("#kosekiAddress").html(data.customerRegisterInfo.kosekiAddress);

                $("#residence_period").html(data.customerRegisterInfo.residence_period+"年");

                $("#number_of_children").html(data.customerRegisterInfo.number_of_children);

                var cohabitant="";
                switch(data.customerRegisterInfo.cohabitant)
                {
                    case 0:
                        cohabitant="父母";
                        break;
                    case 1:
                        cohabitant="子女";
                        break;
                    case 2:
                        cohabitant="配偶";
                        break;
                    case 3:
                        cohabitant="其他";
                        break;
                }
                $("#cohabitant").html("与"+cohabitant+"共住");

                var house = "";
                switch(data.customerRegisterInfo.house)
                {
                    case "commodity":
                        house="自建";
                        break;
                    case "commodity_mortgage":
                        house="自购";
                        break;
                    case "kinsfolk":
                        house="亲属住房";
                        break;
                    case "dormitory":
                        house="单位住房";
                        break;
                    case "rent":
                        house="租用"+"（月租金"+data.customerRegisterInfo.room_charge +"元）";
                        break;
                }

                $("#house").html(house);

                $("#status_of_children").html(data.customerRegisterInfo.status_of_children);

                $("#residence_period_current").html(data.customerRegisterInfo.residence_period_current+"年");


                var enterpriseIndustry="";
                switch(data.customerAdditionalInfo.enterpriseIndustry)
                {
                    case "1":
                        enterpriseIndustry="个体";
                        break;
                    case "2":
                        enterpriseIndustry="个人独资/合伙企业";
                        break;
                    case "3":
                        enterpriseIndustry="有限责任公司";
                        break;
                    case "4":
                        enterpriseIndustry="国企、事业单位";
                        break;
                    case "5":
                        enterpriseIndustry="法人";
                        break;
                }
                if(data.customerAdditionalInfo.shareholding_ratio!="")
                {
                    enterpriseIndustry+="(持股"+data.customerAdditionalInfo.shareholding_ratio+"%)";
                }

                $("#enterpriseIndustry").html(enterpriseIndustry);

                $("#deptName").html(data.customerAdditionalInfo.deptName);

                $("#has_social_security_cards").html(data.customerAdditionalInfo.has_social_security_cards==1?"有":"无");

                $("#dateJoined").html(data.customerAdditionalInfo.dateJoined.substring(0,10));

                $("#ismanufacturing").html(data.customerAdditionalInfo.ismanufacturing==1?"是":"否");

                var companyType="";
                switch(data.customerAdditionalInfo.companyType)
                {
                    case "no":
                        companyType="无";
                        break;
                    case "individual_businesses":
                        companyType="个体商户";
                        break;
                    case "ltd":
                        companyType="有限公司";
                        break;
                }

                $("#companyType").html(companyType);

                $("#companyRegisterAt").html(data.customerAdditionalInfo.companyRegisterAt.substring(0,10));

                $("#has_businesslicence").html(data.customerAdditionalInfo.has_businesslicence==1?"有":"无");

                $("#employees_number").html(data.customerAdditionalInfo.employees_number);

                $("#business_hours").html(data.customerAdditionalInfo.business_hours.substring(0,10));

                $("#business").html(data.customerAdditionalInfo.business);

                $("#incomeStatement").html(data.customerAdditionalInfo.incomeStatement);

                $("#house_number").html(data.customerAdditionalInfo.house_number);

                $("#house_buy_date").html(data.customerAdditionalInfo.house_buy_date.substring(0,10));

                $("#house_addr").html(data.customerAdditionalInfo.house_addr);

                $("#car_license_plate").html(data.customerAdditionalInfo.car_license_plate);

                $("#car_brand").html(data.customerAdditionalInfo.car_brand);

                $("#house_buy_price").html(data.customerAdditionalInfo.house_buy_price+"万元");

                $("#car_buy_date").html(data.customerAdditionalInfo.car_buy_date.substring(0,10));

                $("#bare_car_price").html(data.customerAdditionalInfo.bare_car_price);

                $("#family_car_number").html(data.customerAdditionalInfo.family_car_number);

                var house_ownership="";
                switch(data.customerAdditionalInfo.house_ownership)
                {
                    case 0:
                        house_ownership="本人名下";
                        break;
                    case 1:
                        house_ownership="配偶或父母名下";
                        break;
                    case 2:
                        house_ownership="自建房";
                        break;
                    case 3:
                        house_ownership="其他";
                        break;
                }
                $("#house_ownership").html(house_ownership);

                $("#house_buy_way").html(data.customerAdditionalInfo.house_buy_way=="0"?"一次性":"按揭(月供"+data.customerAdditionalInfo.house_monthly_mortgage_payment+"元)");

                $("#car_buy_way").html(data.customerAdditionalInfo.car_buy_way=="0"?"一次性":"按揭(月供"+data.customerAdditionalInfo.car_monthly_mortgage_payment+"元)");

                $("#insurance_type").html(data.customerAdditionalInfo.insurance_type);
                //数据显示更新 by why 20160918

                $.get(
                        "${basePath}/admin/customer/queryContactsCusId.html?uuid="+uuid,
                        function(result) {
                            $(result).each(
                                    function(i) {
                                        if (result[i].relation == "配偶") {
                                            $("#spouse_id").val(result[i].id);
                                            $("#spouse_name").html(
                                                    result[i].contactsName);
                                            $("#spouse_tel").html(
                                                    result[i].contactsTel);
                                            $("#spouse_mobile").html(
                                                    result[i].contactsMobile)
                                            $("#spouse_ck").attr("checked",result[i].know);
                                        }
                                        if (result[i].contactsTel == "直系亲属1") {
                                            $("#immediate_id1").val(
                                                    result[i].id);
                                            $("#immediate_name1").html(
                                                    result[i].contactsName);
                                            $("#immediate_relation1").html(
                                                    result[i].relation);
                                            $("#immediate_Mobile1").html(
                                                    result[i].contactsMobile);
                                            $("#immediate_ck1").attr("checked",result[i].know);
                                        }
                                        if (result[i].contactsTel == "直系亲属2") {
                                            $("#immediate_id2").val(
                                                    result[i].id);
                                            $("#immediate_name2").html(
                                                    result[i].contactsName);
                                            $("#immediate_relation2").html(
                                                    result[i].relation);
                                            $("#immediate_Mobile2").html(
                                                    result[i].contactsMobile);
                                            $("#immediate_ck2").attr("checked",result[i].know);
                                        }
                                        if (result[i].contactsTel == "其他联系人1") {
                                            $("#other_id1").val(result[i].id);
                                            $("#other_name1").html(
                                                    result[i].contactsName);
                                            $("#other_relation1").html(
                                                    result[i].relation);
                                            $("#other_mobile1").html(
                                                    result[i].contactsMobile);
                                            $("#other_ck1").attr("checked",result[i].know);
                                        }
                                        if (result[i].contactsTel == "其他联系人2") {
                                            $("#other_id2").val(result[i].id);
                                            $("#other_name2").html(
                                                    result[i].contactsName);
                                            $("#other_relation2").html(
                                                    result[i].relation);
                                            $("#other_mobile2").html(
                                                    result[i].contactsMobile);
                                            $("#other_ck2").attr("checked",result[i].know);
                                        }
                                    });
                        })

            }

        })
        ;
        $.ajax({
            url : "/admin/customer/getCarInfo?uuid=" + customer_id_hidden,
            type : "get",
            dataType : "json",
            success : function(data) {
                var details=data.guaranteeEvaluateInfo.indoor.split(",");
                var indoor="";
                var transmissionCase=data.guaranteeEvaluateInfo.indoor.split(",")[0];
                var structure=data.guaranteeEvaluateInfo.indoor.split(",")[1];
                //针对爱车帮需求去掉
               //$("#isExamined").html(data.guaranteeEvaluateInfo.isExamined);
               //$("#isInsure").html(data.guaranteeEvaluateInfo.isInsure);
               //$("#isProvince").html(data.guaranteeEvaluateInfo.isProvince); 
                $("#vehicleBrand").html(data.guaranteeEvaluateInfo.vehicleBrand);
                $("#vehicleModels").html(data.guaranteeEvaluateInfo.vehicleModels);
                $("#vehicleNo").html(data.guaranteeEvaluateInfo.vehicleNo);
                $("#mileaged").html(data.guaranteeEvaluateInfo.mileaged+"km");
                $("#purchaseDate").html(data.guaranteeEvaluateInfo.purchaseDate.substring(0,10));
                $("#vehicleIdentification").html(data.guaranteeEvaluateInfo.vehicleIdentification);
                $("#engineNo").html(data.guaranteeEvaluateInfo.engineNo);
                for(var i=2;i<details.length;i++){
                    indoor=indoor+" "+details[i];
                }
                if(""==indoor||null==indoor){
                    indoor="无装置";
                }
                $("#indoor").html(indoor);
                $("#transmissionCase").html(transmissionCase);
                $("#configuration").html(data.guaranteeEvaluateInfo.configuration);
                $("#structure").html(structure);
                $("#color").html(data.guaranteeEvaluateInfo.color);
                $("#tire").html(data.guaranteeEvaluateInfo.tire);
                $("#displacement").html(data.guaranteeEvaluateInfo.displacement+"L");
                var darkLocks1=data.guaranteeEvaluateInfo.darkLocks;
                if(""==darkLocks1||null==darkLocks1){
                    $("#darkLocks").html("无暗锁");
                }else{
                    $("#darkLocks").html("有暗锁");
                }
                var carTool=data.guaranteeEvaluateInfo.tool;
                if(""==carTool||null==carTool){
                    carTool="无随车工具";
                }
                $("#carTool").html(carTool);
                $("#engine").html(data.guaranteeEvaluateInfo.engine);
                $("#price").html(data.guaranteeEvaluateInfo.price+"万元");
                $("#buyTheWay").html(data.guaranteeEvaluateInfo.buyTheWay);
                $("#evaluatePrice").html(data.guaranteeEvaluateInfo.evaluatePrice);
                $("#evaluateby").html(data.guaranteeEvaluateInfo.evaluateby);
                var evaluatePrice1=data.guaranteeEvaluateInfo.evaluatePrice+"万元";
                $("#evaluatePrice").html(evaluatePrice1);
                $("#evaluateConclusion").html(data.guaranteeEvaluateInfo.evaluateConclusion);




            }})
        $.ajax({
            url : "${basePath}/admin/loan/review/recordnew/"+customer_id_hidden+".html",
            type : "get",
            dataType : "json",
            success : function(data) {
                var count=data.loanReviewRecordSize;
                var repayPlanVocount=data.repayPlanVosize;
                var repayPlanVo="";
                var abc=data.sumCaptial;
                var info="";
                //附件显示
                var path="";
                var type="";
                var personalInformation="";
                var title="";
                var vehicleInformation="";
                var contractInformation="";
                var otherInformation="";
                var recordingInformation="";
                for(var q=0;q<data.loanInfoAttachmentssize;q++){
                    path=data.loanInfoAttachments[q];
                    type=path.attachmentType;
                    title=path.attachmentTitle.split("-")[0];
                    if(type=="idCardType"||type=="idCardBack"||type=="Illegal"||type=="litigation"||type=="trialPhaseReview"
                            ||type=="businessInformation"||type=="heWarrants"||type=="visiteCheckReview"){
                        var ul='<li> <div class="file_img"> <p class="tools">'
                                +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
                                +'<h4>'+title+'</h4>'
                                +'</li>'
                        personalInformation=personalInformation+ul;
                    }
                    $("#personalInformation").html(personalInformation);
                    if(type=="oneCarPhoto"||type=="vehiclStatusOne"||type=="vehicleLicense"||type=="registrationCertificateOne"||type=="businessInsurancePolicy"||type=="vehiclStatusThree"||type=="vehiclStatusFour"
                            ||type=="spareKey"||type=="vehiclStatusTwo"||type=="gpsInstall"||type=="locationSuccess"||type=="vehicleDriveCard"||type=="registrationCertificateTwo"||type=="insurancePolicy"||type=="falseKey"
                            ||type=="pledgeVehicleConsultArchives"){
                        var ul='<li> <div class="file_img"> <p class="tools">'
                                +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
                                +'<h4>'+title+'</h4>'
                                +'</li>';
                        vehicleInformation=vehicleInformation+ul;
                    }
                    $("#vehicleInformation").html(vehicleInformation);
                    if(type=="loanContractOne"||type=="mortgageContractOne"||type=="pledgeContract"||type=="loanReceipt"||type=="signTheContract"||type=="loanContractTwo"||type=="mortgageContractTwo"
                            ||type=="pledgeContractTwo"||type=="lendedReview"||type=="signContractReview"||type=="continueUpload"){
                        var ul='<li> <div class="file_img"> <p class="tools">'
                                +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+' " title="放大"><i class="fa  fa-search-plus"></i></a></p>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
                                +'<h4>'+title+'</h4>'
                                +'</li>';
                        contractInformation=contractInformation+ul;
                    }
                    if(type=="entrustVideo"){
                        var ul='<li> <div class="file_img"> <p class="tools">'
                                +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa fa-cloud-download"></i></a>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"></a> </div>'
                                +'<h4>'+title+'</h4>'
                                +'</li>';
                        contractInformation=contractInformation+ul;
                    }
                    $("#contractInformation").append(contractInformation);
                    if(type=="other"){
                        var ul='<li> <div class="file_img"> <p class="tools">'
                                +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
                                +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
                                +'<h4>'+title+'</h4>'
                                +'</li>';
                        otherInformation=otherInformation+ul;
                    }
                    $("#otherInformation").html(otherInformation);
                    if(type=="telephoneRecordings"){
                        var ul='<li> <div class="file_img"> <p class="tools">'
                                +'<a  href="#" title="下载"  onclick="pictureDownload('+path.id+')"><i class="fa fa-cloud-download" >'
                                +'</i></a></p><img class="example-image" src="${basePath}/img/luyin.jpg" alt="录音"/></div>'
                                +'<h4>电话回访录音</h4></li>';
                        recordingInformation=recordingInformation+ul;
                    }
                    $("#recordingInformation").html(recordingInformation);
                }
                for(var j=0;j<repayPlanVocount;j++){
                    var	record=data.repayPlanVo.planList[j];
                    var date = new Date(record.repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
                    var html = "";
                    html += "<tr>";
                    html += "<td align='center'>" + record.repayPeriod + "</td>";
                    html += "<td align='center'>" + record.repayCapital + "</td>";
                    html += "<td align='center'>" + record.repayInterest + "</td>";
                    html += "<td align='center'>" + record.depreciationFee + "</td>";
                    html += "<td align='center'>" + record.gpsCost + "</td>";
                    html += "<td align='center'>" + record.parkCost + "</td>";
                    html += "<td align='center'>" + record.cashdepositFee + "</td>";
                    html += "<td align='center'>" + record.repayTotal + "</td>";
                    html += "<td align='center'>" + date + "</td>";
                    html += "</tr>";
                    repayPlanVo=repayPlanVo+html;
                }
                //计算合计金额
                var sum = accAdd(data.repayPlanVo.sumInvest, data.repayPlanVo.sumCaptial);
                sum = accAdd(sum,data.repayPlanVo.sumManageFee);
                sum = accAdd(sum,data.repayPlanVo.sumGpsFee);
                sum = accAdd(sum,data.repayPlanVo.sumParkFee);
                sum = accAdd(sum,data.repayPlanVo.sumDepreciationFee);
                sum = accAdd(sum,data.repayPlanVo.sumdrunkDrugDrive);
                sum = accAdd(sum,data.repayPlanVo.sumcashdepositFee);
                sum = accAdd(sum,data.repayPlanVo.sumCertificateFee);
                sum = accAdd(sum,data.repayPlanVo.sumOverdueFee);
                sum = accAdd(sum,data.repayPlanVo.sumPenaltyFee);

                repayPlanVo=repayPlanVo+
                        "<tr>" + "<td align='center'>合计：</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumCaptial + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumInvest + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumDepreciationFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumGpsFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumParkFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumcashdepositFee + "</td>"
                        + "<td align='center'>" + sum.toFixed(2) + "</td>"
                        + "<td align='center'>----</td>"
                        +"</tr>";
                $("#repayPlanVo tr:last").after(repayPlanVo);
                for(var i=0;i<count;i++){

                    var record = data.loanReviewRecord[i];
                    var reviewLevel = "";
                    //对贷款状态进行转换
                    if(record.reviewLevel == "vehicleAssess"){
                        reviewLevel = "车辆评估";
                    }else if(record.reviewLevel == "departLeadAduit"){
                        reviewLevel = "初审";
                    }else if(record.reviewLevel == "trialPhase"){
                        reviewLevel = "总部面审";
                    }else if(record.reviewLevel == "callBack"){
                        reviewLevel = "总部电话核实";
                    }else if(record.reviewLevel == "visiteCheck"){
                        reviewLevel = "线下上门核实";
                    }else if(record.reviewLevel == "judgment"){
                        reviewLevel = "总部终审";
                    }else if(record.reviewLevel == "signContract"){
                        reviewLevel = "签订相关合同";
                    }else if(record.reviewLevel == "dataReview"){
                        reviewLevel = "资料复核";
                    }else if(record.reviewLevel == "lended"){
                        reviewLevel = "出账";
                    }else if(record.reviewLevel == "mortgage"){
                        reviewLevel = "抵押办理";
                    }else if(record.reviewLevel == "instock"){
                        reviewLevel = "押品入库";
                    }else if (record.reviewLevel == "reloanReview"){
                        reviewLevel = "再贷资料复核";
                    }else if (record.reviewLevel == "reloanApprove"){
                        reviewLevel = "再贷审批";
                    }else if (record.reviewLevel == "reloanE_Contract"){
                        reviewLevel = "再贷电子合同签订";
                    }else if (record.reviewLevel == "reloan_lended"){
                        reviewLevel = "再贷放款";
                    }else if (record.reviewLevel == "helploanReview"){
                        reviewLevel = "助贷资料复核";
                    }else if (record.reviewLevel == "helploanApprove"){
                        reviewLevel = "助贷审批";
                    }else if (record.reviewLevel == "helploanE_Contract"){
                        reviewLevel = "助贷电子合同签订";
                    }else if (record.reviewLevel == "helploan_lended"){
                        reviewLevel = "助贷放款";
                    }else if (record.reviewLevel == "reuploadInformatin"){
                        reviewLevel = "附件和资料重新上传";
                    }

                    var comment="";

                    if(record.reviewLevel=="callBack"){
                        if(record.reviewStatus=="passed"){
                            comment="无需家访";
                        }
                        else{
                            comment="需家访";

                        }
                    }else if(record.reviewLevel=="dataReview"){
                        if(record.reviewStatus=="passed"){
                            comment="资料复核无误";
                        }
                        else{
                            comment="资料复核有误";
                        }
                    }else if(record.reviewLevel=="lended"){
                        if(record.reviewStatus=="helploan"){
                            comment="助贷申请";
                        }else if(record.reviewStatus=="loandirect"){
                            comment="直贷放款";
                        }
                        else{
                            comment="再贷申请";
                        }
                    }else if(record.reviewLevel=="reloanReview"){
                        if(record.reviewStatus=="rejected"){
                            comment="放弃再贷";
                        }else{
                            comment="通过";
                        }
                    }else if(record.reviewLevel=="reloanApprove"){
                        if(record.reviewStatus=="rejected"){
                            comment="放弃再贷";
                        }else{
                            comment="通过";
                        }
                    }else if(record.reviewLevel=="helploanReview"){
                        if(record.reviewStatus=="rejected"){
                            comment="放弃助贷";
                        }else{
                            comment="通过";
                        }
                    }else if(record.reviewLevel=="helploanApprove"){
                        if(record.reviewStatus=="rejected"){
                            comment="放弃助贷";
                        }else{
                            comment="通过";
                        }
                    }else{
                        if(record.reviewStatus=="passed"){
                            comment="通过";
                        }
                        else if(record.reviewStatus=="rejected"){
                            comment="不通过";
                        }
                        else{
                            comment="合同调整";
                        }

                    }

                    var reviewAmount=record.reviewAmount;
                    var reviewAmount1="";
                    if(record.reviewLevel=="judgment"||record.reviewLevel=="trialPhase"){
                        var reviewAmount = new Number(reviewAmount);
                        reviewAmount1=reviewAmount.toFixed(2)
                    }else{reviewAmount1="----"}

                    var str = "<tr>"
                            +"<td>"+ record.user.realname + "</td>"
                            +"<td>"+ reviewLevel + "</td>"
                            +"<td>"+ comment + "</td>"
                            +"<td>"+ reviewAmount1 + "</td>"
                            +"<td>"+ record.reviewConclusion + "</td>"
                            +"<td>"+ record.createdAt + "</td>"
                            +"</tr>";

                    info = info + str;
                }

                $("#examineinfo tr:last").after(info);


            }

        });
        //设置直贷，再贷，助贷选择之后出账时间，还款凭证的表示与隐藏
        $("#loandirect").change(function(){
            $("#lenddate_div").css("display","block");
            $("#lendedpic_div").css("display","block");
        });
        $("#helploan").change(function(){
            $("#lenddate_div").css("display","block");
            $("#lendedpic_div").css("display","block");
        });
        $("#reloan").change(function(){
            $("#lenddate_div").css("display","none");
            $("#lendedpic_div").css("display","none");
        });
        //设置再贷审批中的通过与放弃radio button压下后的处理
        $("#reloanApproveinlineRadio1").change(function(){
            //选择通过的情况下，利率相关的设置为可见状态
            $("#reloan_rate_div").css("display","block");
            $("#reloan_starttime_div").css("display","block");
            $("#relaon_endtime_div").css("display","block");
        });
        //放弃的情况下，都设定为不可见状态
        $("#reloanApproveinlineRadio2").change(function(){
            //选择放弃的情况下，利率相关的设置为可见状态
            $("#reloan_rate_div").css("display","none");
            $("#reloan_starttime_div").css("display","none");
            $("#relaon_endtime_div").css("display","none");
        });
        //设置再贷审批中的通过与放弃radio button压下后的处理
        $("#helploanApproveinlineRadio1").change(function(){
            //选择通过的情况下，利率相关的设置为可见状态
            $("#helploan_rate_div").css("display","block");
            $("#helploan_starttime_div").css("display","block");
            $("#helplaon_endtime_div").css("display","block");
        });
        //放弃的情况下，都设定为不可见状态
        $("#helploanApproveinlineRadio2").change(function(){
            //选择放弃的情况下，利率相关的设置为可见状态
            $("#helploan_rate_div").css("display","none");
            $("#helploan_starttime_div").css("display","none");
            $("#helplaon_endtime_div").css("display","none");
        });
    });

    function closePage(){
        $("#lightboxOverlay").remove();
        $("#lightbox").remove();
        $("#order_modal").empty();
        colsediv(0);
    }

    function setStatusBar(processDefinitionId,pledge_type){

        //分别把两个控制条，设置为非可见的状态
        $("#ol_vehiclesLoans").attr("style","display:none;");
        $("#ol_vehiclesLoans_group").attr("style","display:none;");
        //进行条件判断,首先使用最长的进行统计
        var li_arr_group = $("#ol_vehiclesLoans_group").find("span");
        var shortbar = 1;	//默认情况下是短的滚动条
        //当前节点的index
        var currentindex = 0;

        $.each(li_arr_group,function(index,value){
            if(($(this).attr("id") == ("ligroup_" + processDefinitionId))||
                    ($(this).attr("id") == ("ligroup_" + processDefinitionId.replace(/help/,"re")))||
                    ($(this).attr("id") == ("ligroup_" + processDefinitionId.replace(/instock/,"mortgage")))){
                currentindex = index;
            }

        });
        currentindex = currentindex/2;
        if(currentindex <= 10){
            $("#ol_vehiclesLoans").attr("style","display:block;");
            if(pledge_type == 'vehiclePledge'){
                $("#mortgage_stock").html("押品入库");
                if(processDefinitionId.indexOf("instock")>=0){
                    processDefinitionId = "mortgage";
                }
            }
        }
        if(currentindex > 10){
            $("#ol_vehiclesLoans_group").attr("style","display:block;");
            if(pledge_type == 'vehiclePledge'){
                $("#mortgage_stock").html("押品入库");
                if(processDefinitionId.indexOf("instock")>=0){
                    processDefinitionId = "mortgage";
                }
            }
            //使用长状态条
            shortbar = 0;
            //通过关键字re，help进行判断
            if(processDefinitionId.indexOf("help")>=0){
                processDefinitionId = processDefinitionId.replace(/help/,"re");
                //更换助贷文字
                $("#loanReview_span").html("助贷资料复核");
                $("#laonApprove_span").html("助贷审批");
                $("#contract_span").html("助贷电子合同签订");
                $("#loan_lended_span").html("助贷放款");
            }
        }

        if(shortbar == 1){
            //进度条控制
            var li_arr = $("#ol_vehiclesLoans").find("li");
            $.each(li_arr,function(index,value){
                if($(this).find("span").eq(0).attr("id") == ("li_" + processDefinitionId)){
                    //如果找到之后发现index>= 10,则说明已经到分公司放款之后的节点了，因此需要
                    // 控制第二个使用第二个状态条进行表示
                    if(index + 1 == li_arr.length){
                        $(this).attr("class","step-end");
                        $(this).find("span").eq(0).css("background-color","#d43f3a");
                        $(this).find("span").eq(1).css("color","#d43f3a");
                    }else{
                        $(this).attr("class","step-active");
                    }
                    return false;
                }else{
                    $(this).attr("class","step-done");
                    $(this).find("span").eq(0).html("√");
                }
            });
        }else{
            var li_arr = $("#ol_vehiclesLoans_group").find("li");
            $.each(li_arr,function(index,value){
                if($(this).find("span").eq(0).attr("id") == ("ligroup_" + processDefinitionId)){
                    //如果找到之后发现index>= 10,则说明已经到分公司放款之后的节点了，因此需要
                    // 控制第二个使用第二个状态条进行表示
                    if(index + 1 == li_arr.length){
                        $(this).attr("class","step-end");
                        $(this).find("span").eq(0).css("background-color","#d43f3a");
                        $(this).find("span").eq(1).css("color","#d43f3a");
                    }else{
                        $(this).attr("class","step-active");
                    }
                    return false;
                }else{
                    $(this).attr("class","step-done");
                    $(this).find("span").eq(0).html("√");
                }
            });
        }

    }
    function pictureDownload(oid){
        $("#downloadIframe").attr("src","/admin/loan/getroute?id=" + oid);
    }
    $("#file_more").click(function () {

        $(".nav-tabs").find("li").removeClass('active');
        $("#file_tab").addClass('active');
        $("#file_tab a").attr("aria-expanded","true");
        location.hash = 'header';
    });

    //生成还款计划
    function generateRepayPlanB2B(type)
    {
        var loanId = $("#customer_id_hidden").val().split(":")[0];
        var loan_rate;
        var startDate;
        var period;
        var otherFee;
        var serviceFee;
        var repayWay;
        debugger;

        loan_rate=$("#loanRate").val();
        startDate = $("#startDate_reloan").val();
        period= $("#period_reloan").val();
        otherFee= $("#otherFee_reloan").val();
        serviceFee= $("#serviceFee_reloan").val();
        repayWay=$("#repayWay_reloan").val();



        if(loan_rate.length==0)
        {
            layer.alert("请填写年化利率");
            return;
        }

        if(startDate.length==0)
        {
            layer.alert("请填写开始日期");
            return;
        }

        if(period.length==0)
        {
            layer.alert("请填写贷款期数");
            return;
        }

        if(otherFee.length==0)
        {
            otherFee=0;
        }

        if(serviceFee.length==0)
        {
            serviceFee=0;
        }


        $("#repayplan_helploan").html("");
        $("#repayplan_reloan").html("");

        $.ajax({
            url : "/admin/loanB2B/generateRepayPlanB2B",
            type : "get",
            dataType : "json",
            data:{
                "loan_rate": loan_rate,
                "startDate": startDate,
                "period": period,
                "otherFee":otherFee,
                "serviceFee":serviceFee,
                "loanId": loanId,
                "repayWay":repayWay
            },
            success:function(data){
                for(var i=0;i<data.length;i++){

                    var htmlStr = '<tr><td>' + data[i].period + '</td><td>'
                            + data[i].capital + '</td><td>' + data[i].interest
                            + '</td><td>' + data[i].service + '</td><td>'
                            + data[i].other + '</td><td>' + data[i].total
                            + '</td><td>' + data[i].repaydate.substring(0, 10)
                            + '</td></tr>';

                    if(type=="helploan")
                    {
                        $("#repayplan_helploan").append(htmlStr);
                    }
                    else
                    {
                        $("#repayplan_reloan").append(htmlStr);
                    }

                }
                getDataForRepayB2B();
            },
            error : function() {
            }
        });

    }
    //获取总公司还款计划
    function getDataForRepayB2B()
    {
        debugger;
        var loanId = $("#customer_id_hidden").val().split(":")[0];


        $.ajax({
            url : "/admin/loanB2B/queryRepayInfoB2B?uuid=" + loanId,
            type : "get",
            dataType : "json",
            success :function(data){
                if(data){
                    $("#periodB2B").val(data.period);
                    $("#startDateB2B").html(data.starttime.substring(0,10));
                    $("#loanMoneyB2B").val(data.loanMoney);
                    $("#loanRateB2B").val(data.loanrate);
                    $("#repaywayB2B").val(data.repayway);

                }
            },
            error:function(){}
        });

        $.ajax({
            url : "/admin/loanB2B/queryRepayPlanB2B?uuid=" + loanId,
            type : "get",
            dataType : "json",
            success :function(data){

                $("#repayb2b").html('')

                for(var i=0;i<data.length;i++){

                    var htmlStr = makeRepayHTML(data[i]);

                    $("#repayb2b").append(htmlStr);

                }

                BindEvents();


            },
            error:function(){}
        });



    }

    function makeRepayHTML(repayPlan)
    {

        var str ='<tr id="'+repayPlan.id+'"><td>'+repayPlan.period+'</td><td><span class="repay_capital">'+repayPlan.capital+'</span></td><td><span id="repay_interest" class="repay_interest">'+repayPlan.interest+'</span></td>'
                +'<td>'+repayPlan.service+'</td><td>'+repayPlan.other+'</td><td class="repay_total">'+repayPlan.total+'</td></td><td><span class="other_txt">'+repayPlan.repaydate.substring(0,10)+'</span>'
                +'<div class="input-group date form_date pull-left red-group repayDate" data-date="" data-date-format="yyyy-mm-dd" data-link-field="repay_date_'+repayPlan.id+'" data-link-format="yyyy-mm-dd" style="width:160px; display:none;">'
                +'<input class="control-sml txt_repayDate" type="text" value="'+repayPlan.repaydate.substring(0,10)+'" readonly style="width:100%;" id="repay_date_'+repayPlan.id+'">'
                +'<i class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></i> </div></td>';
        if(repayPlan.period!=0){
            str+='<td><a href="#" class="collection_Edit">修改</a><span class="btn-do" style="display:none;"><a href="#" class="collection_cancel">取消</a> <a href="#" class="collection_update text-success repayplanSave">保存</a></span> </td>';
        }
        else
        {
            str+='<td></td>';
        }
        str+='</tr>';
        return str;

    }

    function BindEvents()
    {

        $(".collection_Edit").click(
                function() {
                    $(this).parents("tr").find($(".other_txt")).hide();
                    $(this).parents("tr").find($(".control-sml")).show();
                    $(this).parents("tr").find($(".red-group")).show();
                    $(this).parents("tr").find($(".btn-do")).show();
                    $(this).hide();
                    $(this).parents("tr").find($(".collection_cancel"))
                            .click(
                                    function() {
                                        $(this).parents("tr")
                                                .find($(".btn-do")).hide();
                                        $(this).parents("tr").find(
                                                $(".control-sml")).hide();
                                        $(this).parents("tr").find(
                                                $(".red-group")).hide();
                                        $(this).parents("tr").find(
                                                $(".other_txt")).show();
                                        $(this).parents("tr").find(
                                                $(".collection_Edit")).show();
                                    });
                });
        $(".parent").siblings().not(".parent").not(":first-child").hide();
        $(".collection_link")
                .click(
                        function() {
                            $(this).parents("tr").siblings().not(".parent")
                                    .not(":first-child").hide();
                            $(this).parents("tr").next()
                                    .find($(".cuishou_box")).show();
                            $(this).parents("tr").next().find(
                                    $(".huankuan_box")).hide();
                            $(this).parents("tr").next().show().next().show();
                        });
        $(".collection_money")
                .click(
                        function() {
                            $(this).parents("tr").siblings().not(".parent")
                                    .not(":first-child").hide();
                            $(this).parents("tr").next()
                                    .find($(".cuishou_box")).hide();
                            $(this).parents("tr").next().find(
                                    $(".huankuan_box")).show();
                            $(this).parents("tr").next().show().next().show();
                        });



        $('.repayDate').datetimepicker({
            language: 'zh-CN',/*加载日历语言包，可自定义*/
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        }).on('changeDate', function(ev){

            var curTr = $(this).parents('tr');
            var prevTr = curTr.prev();

            var prevDate=new Date( prevTr.find("input").val().replace(/-/g,"/"));
            var curDate =new Date( curTr.find("input").val().replace(/-/g,"/"));

            var period = $("#period_reloan").val();
            var startDate = $("#startDate_reloan").val();
            var loanMoney= parseFloat($("#approveMoney").find(".text-danger").html())*10000;
            //		var loanRate = $("#reloan_rate").val();
            var loanRate = $("#loanRate").val();
            var repayWay = $("#repayWay_reloan").val();


            var dateDiff = parseInt(Math.abs(curDate - prevDate) / 1000 / 60 / 60 / 24)

            var interest = (parseFloat(loanMoney)*parseFloat(loanRate)*parseInt(dateDiff)/365/100).toFixed(2);

            var capital = parseFloat(curTr.find('.repay_capital').html());

            curTr.find('.repay_interest').html(interest);
            curTr.find('.repay_total').html(parseFloat(interest)+parseFloat(capital));

        });



        $(".repayplanSave").click(function() {
            var loanId = $("#customer_id_hidden").val().split(":")[0];

            var tr = $(this).parents('tr');

            var interest=tr.find(".repay_interest").html();
            var total = tr.find(".repay_total").html();
            var date = tr.find("input").val()
            var period = tr.find(".repay_period").html();
            var repayId = tr.attr("id");

            $.ajax({
                url : "/admin/loanB2B/saveRepayPlanB2B",
                type : "post",
                dataType : "json",
                data : {
                    repay_interest : interest,
                    repay_total : total,
                    repay_date : date,
                    loanId : loanId,
                    repay_period : period,
                    repay_id : repayId
                },
                success : function(data) {
                    layer.msg("提交成功");
                    cancelAll();
                    getDataForRepayB2B();
                },
                error : function() {
                }
            });
        });

        function cancelAll() {
            $(this).parents("tr").siblings().not(".parent").not(":first-child")
                    .hide();
            $(".cuishou_box").hide();
            $(this).parents("tr").siblings().not(".parent").not(":first-child")
                    .hide();
            $(".huankuan_box").hide();
            $(".btn-do").hide();
            $(".control-sml").hide();
            $(".red-group").hide();

            $(".other_txt").show();
            $(".collection_Edit").show();
        }


        //计算天数差的函数，通用
        //sDate1和sDate2是2006-12-18格式
        function DateDiff(sDate1, sDate2) {
            var aDate, oDate1, oDate2, iDays
            aDate = sDate1.split("-")
            oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]) //转换为12-18-2006格式
            aDate = sDate2.split("-")
            oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0])
            iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24) //把相差的毫秒数转换为天数
            return iDays
        }
    }

</script>
</html>
