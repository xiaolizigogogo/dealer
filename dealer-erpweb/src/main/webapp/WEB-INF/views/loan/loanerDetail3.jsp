<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
	<link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
	<link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
	<link type="text/css" rel="stylesheet" href="${basePath}/css/lightbox.min.css" />
	<link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
	<script type="text/javascript" src="${basePath}/js/lightbox.js"></script>
	<script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
	<script type="text/javascript" src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
	<script type="text/javascript" src="${basePath}/js/jquery/jquery.fileupload.js"></script>
	<script type="text/javascript" src="${basePath}/js/other.js"></script>
	<script type="text/javascript" src="${basePath}/js/my.js"></script>
	<script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
	<script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
	<link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>

</head>
<body>

<div class="modal-header" id="header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
  <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">查看订单<small style="padding-left:20px; font-size:14px;" class="text-muted" id="orderid"></small></h4>
</div>
<div class="modal-body" >
  <ol class="ui-step ui-step-red ui-step-3">
    <li class="step-start step-done">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span class="ui-step-cont-number">√</span> <span class="ui-step-cont-text">出账</span> </div>
    </li>
    <li class="step-active" id="repaymenting_li">
      <div class="ui-step-line"></div>
      <div class="ui-step-cont"> <span id="span1" class="ui-step-cont-number"></span> <span id="span2" class="ui-step-cont-text">还款中</span> </div>
    </li>
    <li class="step-end" id="ended_li">
      <div class="ui-step-cont"> <span id="span3" class="ui-step-cont-number"></span> <span id="span4" class="ui-step-cont-text">已完结</span> </div>
    </li>
  </ol>
  <div class="tab_box clearfix"> 
    
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist" id="nav-tabs">
      <li role="presentation"  class="active"><a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">还款情况</a></li>
      <li role="presentation"><a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">还款计划</a></li>
		<li role="presentation"><a href="#tab3" aria-controls="tab3"
								   role="tab" data-toggle="tab">附件资料</a></li>
      <li role="presentation"><a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">催收历史</a></li>
      <li role="presentation"><a href="#tab5" aria-controls="tab5" role="tab" data-toggle="tab">借款需求</a></li>
      <li role="presentation"><a href="#tab6" aria-controls="tab6" role="tab" data-toggle="tab">个人资料</a></li>
      <li role="presentation" id="car_tab"><a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab" >车辆信息</a></li>
		<li role="presentation"><a href="#tab8" aria-controls="tab8"
								   role="tab" data-toggle="tab">审批历史</a></li>
    </ul>
    
    <!-- Tab panes -->
    <div class="tab-content clearfix">
      <div role="tabpanel" class="tab-pane active" id="tab1">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">累计还款信息</h3>
          </div>
          <div class="list_box">
            <table class="table table-bordered table-striped" style="margin-bottom:0px;">
              <thead>
                <tr>
                    <th  style="width:10%;">期数</th>
                  <th style="width:20%;">应还款金额</th>
                  <th style="width:50%;">实际还款金额</th>
                  <th  style="width:20%;">累计差额</th>
                </tr>
              </thead>
              <tbody id="leiji_repayment">
              </tbody>
            </table>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">本期还款计划</h3>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>还款期数</dt>
                <dd id="repaymentName"></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>还款金额</dt>
                <dd><b class="text-danger" id="repayTotal"></b></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>应还款时间</dt>
                <dd id="repayDate"></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>逾期天数</dt>
                <dd><b class="text-danger" id="overdueDay"></b></dd>
              </dl>
            </div>
          </div>
          <div class="list_box">
            <table class="table table-bordered table-striped" style="margin-bottom:0px;">
              <thead>
                <tr>
                  <th>&nbsp;</th>
                  <th>还款本金</th>
                  <th>还款利息</th>
                  <th>管理费</th>
                  <th>GPS费用</th>
                  <th>查档费</th>
                  <th>停车费</th>
                  <th>折旧费</th>
                  <th>毒酒驾</th>
                  <th>保证金</th>
                  <th>认证费</th>
					<th>逾期罚息</th>
                </tr>
              </thead>
              <tbody id="moneyDetail">
              </tbody>
            </table>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">本期还款实际</h3>
          </div>
          <div style="width:600px;" class="list_box">
          	<div class="row">
            <div class="col-sm-6">
              <dl class="dl-horizontal">
                <dt id="repayPeriod"></dt>
                <dd></dd>
              </dl>
            </div>
            <div class="col-sm-6">
              <dl class="dl-horizontal">
                <dt>实际金额</dt>
                <dd><b class="text-danger" id="actualMoeny"></b></dd>
              </dl>
            </div>
          </div>
          	<table class="table table-bordered table-striped" style="margin-bottom:0px;">
            <thead>
               <tr>
               <th>#</th><th>还款时间</th><th>还款金额</th><th>剩余金额</th>
               </tr></thead>
                        <tbody id="manyRepayment">
                        </tbody>
          </table>
          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab2">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">基本信息</h3>
          </div>
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>借款金额</dt>
                <dd id="approveMoney1"><b class="text-danger">万</b> </dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>年利率</dt>
                <dd id="yearrate1"><b class="text-danger"></b></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>月利率</dt>
                <dd id="monthrate1"></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>借款期限</dt>
                <dd id="period1"><b class="text-danger"></b></dd>
              </dl>
            </div>
          </div>
        </div>
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">还款计划列表</h3>
          </div>
          <div class="list_box">
            <table class="table table-bordered table-striped"  id="repayPlanVo">
              <thead>
                <tr>
					<th>期数</th>
					<th>还款本金</th>
					<th>还款利息</th>
					<th>管理费</th>
					<th>GPS费用</th>
					<th>查档费</th>
					<th>停车费</th>
					<th>折旧费</th>
					<th>毒酒驾</th>
					<th>保证金</th>
					<th>认证费</th>
					<th>逾期罚息</th>
					<th>本期还款总额</th>
					<th>剩余本金</th>
					<th>还款日期</th>
                </tr>
              </thead>
              <tbody id="repayPlayDetail">
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab4">
        <div class="row">
          <div class="col-sm-12 list_box">
            <table class="table table-bordered table-striped"  id="collection">
              <thead>
                <tr>
                  <th>期数</th>
                  <th>还款状态</th>
                  <th>催收方式</th>
                  <th>催收时间</th>
                  <th>备注</th>
                </tr>
              </thead>
              <tbody id="collection_tbody">
              
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab5">
        <div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">基本信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>申请金额</dt>
								<dd id="applyMoney">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>审批金额</dt>
								<dd id="approveMoney">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>借款状态</dt>
								<dd id="loanstatus">
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>订单号</dt>
								<dd id="loanorderid"></dd>
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
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>还款方式</dt>
								<dd id="repayWay"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>抵押方式</dt>
								<dd id="mortgageType"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>还款来源</dt>
								<dd id="repaymentsrc"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
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
					</div>
					<div class="row">
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
						<h3 class="pull-left">利率、期限</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>年利率</dt>
								<dd id="yearrate"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>月利率</dt>
								<dd id="monthrate"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>借款期限</dt>
								<dd id="period"></dd>
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
						<div class="col-sm-5">
							<dl class="dl-horizontal">
								<dt>开户行</dt>
								<dd id="accountbank"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>银行账号</dt>
								<dd id="accountnumber"></dd>
							</dl>
						</div>
					</div>
				</div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab6">
        <div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">基本信息</h3>
					</div>					
					<div id="loan_review_div"></div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>借款人：</dt>
								<dd id="customerName1"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>身份证号码：</dt>
								<dd id="idCard"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="mobile"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>学历:</dt>
								<dd id="education"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>住房性质：</dt>
								<dd id="house"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>婚姻状况：</dt>
								<dd id="maritalStatus"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>居住人数：</dt>
								<dd id="liveNumber1"></dd>
							</dl>
						</div>
						<div class="col-sm-12">
							<dl class="dl-horizontal">
								<dt>现居地址：</dt>
								<dd id="liveAddress"></dd>
							</dl>
						</div>

					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">工作信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位全称：</dt>
								<dd id="enterpriseName"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属行业：</dt>
								<dd id="enterpriseIndustry"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位电话：</dt>
								<dd id="enterpriseTel"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位性质：</dt>
								<dd id="enterpriseType"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>职务：</dt>
								<dd id="position"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位地址：</dt>
								<dd id="enterpriseAddress"></dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">资产信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>房产：</dt>
								<dd id="hasHouse1"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>月收入水平：</dt>
								<dd id="income"></dd>
							</dl>
						</div>

					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">其他信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属分公司：</dt>
								<dd id="company-name"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属部门：</dt>
								<dd id="dept-name"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>所属客户经理：</dt>
								<dd id="user-realname"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>信用卡张数：</dt>
								<dd id="creditCardNum"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>信用卡额度：</dt>
								<dd id="creditCardQuota"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>信用卡银行名称：</dt>
								<dd id="creditCardBankName"></dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>银行信用卡号：</dt>
								<dd id="creditCard"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<dl class="dl-horizontal">
								<dt>备注：</dt>
								<dd id="remark" >
								</dd>
							</dl>
						</div>

					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">联系人信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>配偶姓名：</dt>
								<dd id="spouse_name">
								
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>单位电话：</dt>
								<dd id="spouse_tel">
									
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="spouse_mobile">
							
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>直系亲属姓名：</dt>
								<dd id="immediate_name1">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd id="immediate_relation1" >
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="immediate_Mobile1">
								</dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>其他联系人姓名：</dt>
								<dd id="other_name1">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>关系：</dt>
								<dd id="other_relation1">
								</dd>
							</dl>
						</div>
						<div class="col-sm-4">
							<dl class="dl-horizontal">
								<dt>手机号码：</dt>
								<dd id="other_mobile1">
								</dd>
							</dl>
						</div>
					</div>
				</div>
      </div>
      <div role="tabpanel" class="tab-pane" id="tab7">
      <div class="from_box carinfo_from">
					<div class="from_tit clearfix">
						<h3 class="pull-left">基本信息</h3>
					</div>
					<div class="row">
						
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车身是否在有效期内:</dt>
								<dd id="isExamined"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车辆商业全险是否购买:</dt>
								<dd id="isInsure"></dd>
								</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>节假日是否驾驶车辆离省:</dt>
								<dd id="isProvince"></dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="from_box">
					<div class="from_tit clearfix">
						<h3 class="pull-left">车辆信息</h3>
					</div>
					<div class="row">
						<div class="col-sm-12" id="d1">
							
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车辆品牌:</dt>
								<dd id="vehicleBrand"></dd>
							</dl>
						</div>
						
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车牌号码:</dt>
								<dd id="vehicleNo"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>已行驶里程:</dt>
								<dd id="mileaged"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车身结构:</dt>
								<dd id="structure"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>购置日期:</dt>
								<dd id="purchaseDate"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>车架号:</dt>
								<dd id="vehicleIdentification"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>发动机号:</dt>
								<dd id="engineNo"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>变速箱:</dt>
								<dd id="transmissionCase"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>配 置:</dt>
								<dd id="configuration"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>颜色:</dt>
								<dd id="color"></dd>
							</dl>
						</div>
						
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>排量:</dt>
								<dd id="displacement"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>暗 锁:</dt>
								<dd id="darkLocks"></dd>								
							</dl>
						</div>
						<div class="col-sm-9">
							<dl class="dl-horizontal">
								<dt>随车工具:</dt>
								<dd id="carTool"></dd>
							</dl>
						</div>
						<div class="col-sm-9">
							<dl class="dl-horizontal">
								<dt>室内装置:</dt>
								<dd id="indoor"></dd>
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
								<dt>发动机:</dt>
								<dd id="engine"></dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>发票价:</dt>
								<dd id="price"></dd>
								</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>全款/按揭:</dt>
								<dd id="buyTheWay"></dd>
							</dl>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>评估价格:</dt>
								<dd id="evaluatePrice">
								</dd>
							</dl>
						</div>
						<div class="col-sm-3">
							<dl class="dl-horizontal">
								<dt>评估师:</dt>
								<dd id="evaluateby"></dd>
							</dl>
						</div>
						<div class="col-sm-6">
							<dl class="dl-horizontal">
								<dt>评估结论:</dt>
								<dd>
									<span class="text-danger" id="evaluateConclusion"></span>
								</dd>
							</dl>
						</div>
					</div>
				</div>
			</div>
		<div role="tabpanel" class="tab-pane" id="tab8">
			<div class="list_box">
				<table class="table table-bordered table-striped" id="reviewresult">
					<thead>
					<tr>
						<th>审批环节</th>
						<th>评审人</th>
						<th>评审结果</th>
						<th>评审结论</th>
						<th>评审时间</th>
					</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div role="tabpanel" class="tab-pane" id="tab3">
			<div class="row">
				<div class="col-sm-4">
					<div class="from_box">
						<div class="from_tit clearfix">
							<h3 class="pull-left">个人信息</h3>
						</div>
						<div class="img_list">
							<ul class="list-inline">
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="idCardTypeSave" title="保存"><i class="fa  fa-save"></i></a> <a
												id="aidCardType"
												href=""
												data-lightbox="example-set" data-title="身份证 " title="放大"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img class="example-image" src=""  id="idCardType"
										/>
									</div>
									<h4>身份证</h4>
								</li>
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="vehicleLicenseSave" title="保存"><i class="fa  fa-save"></i></a> <a
												href=""
												id="avehicleLicense"
												data-lightbox="example-set" data-title="车辆行驶证"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img class="example-image" src="" id="vehicleLicense">
									</div>
									<h4>车辆行驶证</h4>
								</li>
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="registrationCertificateSave" title="保存"><i class="fa  fa-save"></i></a> <a
												id="aregistrationCertificate"
												href=""
												data-lightbox="example-set" data-title="车辆行驶证"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img  class="example-image" id="registrationCertificate" src="">
									</div>
									<h4>机动车登记证书</h4>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="from_box">
						<div class="from_tit clearfix">
							<h3 class="pull-left">车辆类信息</h3>
						</div>
						<div class="img_list">
							<ul class="list-inline">
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="insurancePolicySave" title="保存"><i class="fa  fa-save"></i></a> <a
												href=""
												id="ainsurancePolicy"
												data-lightbox="example-set" data-title="身份证 " title="放大"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img class="example-image" src=""
											 id="insurancePolicy"/>
									</div>
									<h4>交通强制保险单</h4>
								</li>
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="oneCarPhotoSave" title="保存"><i class="fa  fa-save"></i></a> <a
												href=""
												id="aoneCarPhoto"
												data-lightbox="example-set" data-title="车辆行驶证" title="放大"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img src="" class="example-image" id="oneCarPhoto">
									</div>
									<h4>人车合照</h4>
								</li>
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="businessInsurancePolicySave" title="保存"><i class="fa  fa-save"></i></a> <a
												id="abusinessInsurancePolicy"
												href=""
												data-lightbox="example-set" data-title="车辆行驶证"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img src="" class="example-image" id="businessInsurancePolicy">
									</div>
									<h4>车辆商业保险单</h4>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="from_box">
						<div class="from_tit clearfix">
							<h3 class="pull-left">合同类信息</h3>
						</div>
						<div class="img_list">
							<ul class="list-inline">
								<li>
									<div class="file_img">
										<p class="tools">
											<a href="javascript:void(0);" id="signContractReviewSave" title="保存"><i class="fa  fa-save"></i></a> <a
												href=""
												id="asignContractReview"
												data-lightbox="example-set" data-title="身份证 " title="放大"><i
												class="fa  fa-search-plus"></i></a>
										</p>
										<img class="example-image" src="" id="signContractReview"
										/>
									</div>
									<h4>合同一</h4>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_urgeRepayment">
    <h4>催收</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class=" col-sm-12">
          <div class="form-group">
	          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款方式</label>
	          <div class="col-sm-8">
	            <label class="radio-inline">
	              <input type="radio" name="urgeRepaymentRadio" id="inlineRadio1" value="commonRepayment" checked="checked">
	              正常还款 </label>
	            <label class="radio-inline">
	              <input type="radio" name="urgeRepaymentRadio" id="inlineRadio2" value="overdueHandle">
	              逾期处理 </label>
	          </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"> 短信催收</label>
            <div class="col-sm-8">
              <textarea cols="168" rows="2" class="form-control" id="smsContent" name="smsContent"></textarea>
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-2 col-sm-offset-2"> <a name="submitSms" id="submitSms"  href = "javascript:void(0)" onclick = "javascript:loanSubmitSms()" class="btn btn-danger  btn-search">发送短信</a> </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 电话催收备注</label>
            <div class="col-sm-8">
              <textarea cols="168" rows="2" class="form-control" id="callRemark"  maxlength="30"
                                      name="callRemark"></textarea>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_repaymenting">
    <h4>第1期还款</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="repaymentingRadio" id="inlineRadio1" value="commonRepayment" checked="checked">
              正常还款 </label>
            <label class="radio-inline">
              <input type="radio" name="repaymentingRadio" id="inlineRadio2" value="advancedRepayment">
              提前还款 </label>
            <label class="radio-inline" id="inlineRadio4_label">
              <input type="radio" name="repaymentingRadio" id="inlineRadio4" value="continueRepayment">
              申请续借 </label>
            <label class="radio-inline">
              <input type="radio" name="repaymentingRadio" id="inlineRadio3" value="abandonRepayment">
              放弃还款 </label>
          </div>
        </div>
        <div class="form-group" id="repaymenting_photoDiv">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 上传还款凭证截图</label>
          <div class="col-sm-8">
          	 <a href="javascript:;" class="file">选择文件
            <input type="file"  id="repaymentUploadProof" name="files[]"
            data-url="">
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_0" ></p>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款信息备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="repaymentingRemark" name="repaymentingRemark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" id="op_box_repaymented" style="display:none;">
    <h4 id="review_name">第1期还款评审</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group" style="margin-bottom:10px;">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 评审结论</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input type="radio" value="passed" name="reviewStatus" checked="checked">
              确认无误进行还款 </label>
            <label class="radio-inline">
              <input type="radio" value="rejected" name="reviewStatus">
              凭证有误，驳回 </label>
          </div>
        </div>
        <div class="form-group">
        	<label  class="col-sm-2 control-label"><i class="text-danger">*</i> 本次还款金额</label>
        	<div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" autofocus id="repaymentAmount1"
                               onkeyup="displayUpper(this)"  maxlength="6"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> 
              </div>
              <p class="help-block pull-left" style="padding-left:10px;margin-top:0px;">
              	<a href="javascript:void(0)" onClick="submitNowRepayment();" class="btn btn-danger btn-block">提交本次还款</a>
              </p>
             </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 还款实际金额</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" autofocus id="repaymentAmount" readonly
                               onkeyup="displayUpper(this)" maxlength="6"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> </div>
            <p class="help-block pull-left" style="padding-left:10px;">
            	本期还款计划金额 <span class="text-danger" id="rpd_money">5000.00</span> 元
            	&nbsp;&nbsp;&nbsp;本期还款计划剩余金额 <span class="text-danger" id="surplus_rpd_money"></span> 元
            </p>
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 评审备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="repaymentReviewRemark"
                                      name="repaymentReviewRemark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_lateProcessing">
    <h4 id="review_lateprocessing">第1期逾期处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="lateProcessingRadio" id="inlineRadio1" value="interestHandle" checked="checked">
              申请罚息调整 </label>
            <label class="radio-inline">
              <input type="radio" name="lateProcessingRadio" id="inlineRadio3" value="trackCarHandle">
              拖车处理 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 逾期处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="lateProcessingRemark"
                                      name="lateProcessingRemark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
   <div class="op_box" style="display:none;" id="op_box_detainCar">
    <h4 id="review_detaincar">第1期逾期处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="detainCarRadio" id="inlineRadio1" value="alreadyTowTruck" checked="checked">
              已拖车 </label>
            <label class="radio-inline">
              <input type="radio" name="detainCarRadio" id="inlineRadio3" value="noTowTruck">
              未拖车 </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="detainCarRemark"
                                      name="detainCarRemark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- 续借 -->
  <div class="op_box" style="display:none;" id="op_box_continueRepayment">
    <h4>续借处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="continueRepaymentReviewStatus" id="inlineRadio1" value="passed" checked="checked">
              同意续借 </label>
            <label class="radio-inline">
              <input type="radio" name="continueRepaymentReviewStatus" id="inlineRadio3" value="rejected">
              拒绝续借 </label>
          </div>
        </div>
        <div class="form-group" id="continueRepayAmountDiv">
          <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 还款实际金额</label>
          <div class="col-sm-8">
            <div class="input-group input-append pull-left" style="width:160px">
              <input type="text" class="form-control" autofocus id="repaymentAmountContinue"
                               onkeyup="displayUpper(this)"  maxlength="8"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="continueRepaymentRemark"
                                      name="continueRepaymentRemark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_continueUpload">
    <h4>续借合同签订</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal" id="warp">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 上传续借合同</label>
          <div class="col-sm-8"> <a href="javascript:;" class="file">选择文件
            <input type="file" name="files[]" id="continueUpload">
            </a>
            <p class="file_img"><img id="imgShow_continueUpload" ></p>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_continueLoan">
    <h4>借款展期续借</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal" id="warp">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借金额</label>
          <div class="col-sm-2">
            <div class="input-group input-append bootstrap-timepicker" style="width:160px">
              <input type="text" class="form-control" value="${continueMoney}" name="continueAmount" id="continueAmount" style="width:100%;" readonly>
              <span class="add-on input-group-addon">元</span> </div>
          </div>
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借期限</label>
          <div class="col-sm-2">
            <select class="form-control"  name="continueLimit" id="continueLimit">
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
            </select>
          </div> <label class="col-sm-2 control-label"> 还款方式</label>
           <div  class="col-sm-2">
           	<p class="form-control-static text-muted" id="RepayWay_continue"></p>
           </div></div>
          <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 续借开始日期</label>
          <div class="col-sm-2">
            <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="continueDate"
                                 data-link-format="yyyy-mm-dd">
              <input class="form-control" type="text" value="" readonly >
              <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
            <input type="text" hidden="hidden"  id="continueDate" name="continueDate" />
          </div>
          
          <div class="col-sm-4"><a href="#" class="btn btn-success btn-search" style="margin-left:10px;">生成新的还款计划</a></div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 评审结论</label>
          <div class="col-sm-8">
            <label class="radio-inline">
              <input type="radio" name="continueLoanRadio" id="inlineRadio1" value="passed" checked="checked">
              完成续借 </label>
            <label class="radio-inline">
              <input type="radio" name="continueLoanRadio" id="inlineRadio3" value="return">
              续借有误，需调整续借手续 </label>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_fineSet">
  	<input type="hidden" id="repayPlanDetailId" />
    <h4>罚息处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 本期罚息调整</label>
          <div class="col-sm-8">
            <div class="input-group input-append" style="width:160px">
              <input type="text" class="form-control" autofocus id="updatefinFee"
                               onkeyup="displayUpper(this)"
                               onpaste="return false" style="width:100%;">
              <span class="add-on input-group-addon">元</span> </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 罚息处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="fineSetRemark" name="fineSetRemark"></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_lateProcessed">
    <h4>风控二次处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"></label>
          <div class="col-sm-8"> <a href="#tab7" aria-controls="tab7" role="tab" data-toggle="tab"  id="car_more">查看车辆信息</a> </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理结果</label>
          <!-- 根据是否是押车订单显示处理结果，如果押车就直接显示赝品出售即可-->
          <div class="col-sm-5">
          <label class="radio-inline">
              <input type="radio" name="lateProcessedRadio" id="inlineRadio1" value="countinueAdjust" checked="checked">
              继续拖车 </label>
           <label class="radio-inline">
              <input type="radio" name="lateProcessedRadio" id="inlineRadio1" value="interestHandle">
             申请调整罚息 </label>
            <label class="radio-inline">
              <input type="radio" name="lateProcessedRadio" id="inlineRadio1" value="tracked">
              拖车处理 </label>
            <label class="radio-inline">
              <input type="radio" name="lateProcessedRadio" id="inlineRadio3" value="loanApplyEnd">
              坏账处理 </label>
          </div>
          <div class="col-sm-4">
            <label class="checkbox">
              <input type="checkbox" checked="checked" disabled="disabled" >
              押品处置</label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="lateProcessedRemark" name="lateProcessedRemark"
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_detainedCarDispose">
    <h4>拖车处理</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <%--<div class="form-group">--%>
          <%--<label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车时间</label>--%>
          <%--<div class="col-sm-2">--%>
            <%--<div class="input-group date form_date" data-date=""--%>
                                 <%--data-date-format="yyyy-mm-dd"--%>
                                 <%--data-link-field="dateJoined"--%>
                                 <%--data-link-format="yyyy-mm-dd" >--%>
              <%--<input class="form-control" type="text" value="" readonly >--%>
              <%--<span class="input-group-addon"><span--%>
                                        <%--class="glyphicon glyphicon-calendar"></span></span> </div>--%>
            <%--<input type="text" hidden="hidden" id="date_tc" name="date_tc" />--%>
          <%--</div>--%>
          <%--<label class="col-sm-2 control-label"><i class="text-danger">*</i> 营业厅</label>--%>
          <%--<div class="col-sm-2">--%>
            <%--<select  class="form-control">--%>
              <%--<option>请选择</option>--%>
            <%--</select>--%>
          <%--</div>--%>
          <%--<label class="col-sm-2 control-label"><i class="text-danger">*</i> 拖车费用</label>--%>
          <%--<div class="col-sm-2">--%>
            <%--<div class="input-group input-append" >--%>
              <%--<input type="text" class="form-control" autofocus id="repaymentAmount"--%>
                               <%--onkeyup="displayUpper(this)"--%>
                               <%--onpaste="return false">--%>
              <%--<span class="add-on input-group-addon">元</span> </div>--%>
          <%--</div>--%>
        <%--</div>--%>

        <%--<hr />--%>


        <div class="form-group" style="margin-bottom:10px;">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理方式</label>
          <div class="col-sm-10">
          <label class="radio-inline">
              <input type="radio" value="saleRepayment" name="detainedCarDisposeRadio" checked="checked">
              已卖出</label>
            <label class="radio-inline">
              <input type="radio" value="detainedCarRepayment" name="detainedCarDisposeRadio">
              还款提车 </label>
          <label class="radio-inline">
              <input type="radio" value="vehicleNoSaleRepayment" name="detainedCarDisposeRadio">
              还款不提车 </label>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;">
    <h4>押品处置</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 处理结果</label>
          <div class="col-sm-4">
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1" checked="checked">
              还款提车 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option2">
              还款不提车 </label>
            <label class="radio-inline">
              <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3">
              卖车 </label>
          </div>
        </div>
        <div id="tc_box">
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 提车人员</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" readonly value="张三" >
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 提车日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_tc" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出库人员</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" >
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出库日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_ck" />
            </div>
          </div>
          <div class="form-group"  id="warp">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 提车凭证</label>
            <div class="col-sm-2"> <a href="javascript:;" class="file">选择文件
              <input type="file" name="" id="up_img_WU_FILE_2">
              </a>
              <p class="file_img"><img id="imgShow_WU_FILE_2" ></p>
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 还款凭证</label>
            <div class="col-sm-2"> <a href="javascript:;" class="file">选择文件
              <input type="file" name="" id="up_img_WU_FILE_3">
              </a>
              <p class="file_img"><img id="imgShow_WU_FILE_3" ></p>
            </div>
          </div>
        </div>
        <!--选择售出车辆表单-->
        <div id="mc_box">
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 车辆接收员</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" readonly value="接收员" >
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出售价格</label>
            <div class="col-sm-2">
              <div class="input-group input-append" >
                <input type="text" class="form-control" autofocus 
                               onkeyup="displayUpper(this)"
                               onpaste="return false">
                <span class="add-on input-group-addon">元</span> </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 售出日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_sc" />
            </div>
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出库日期</label>
            <div class="col-sm-2">
              <div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="dateJoined"
                                 data-link-format="yyyy-mm-dd">
                <input class="form-control" type="text" value="" readonly >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="date_tc" name="date_ck2" />
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="op_box" style="display:none;" id="op_box_badLoanApplication">
    <h4>坏账处理</h4>
    <div class="op_box_con clearfix">
      <table class="no-boreder-table">
        <tr>
          <th>车辆品牌</th>
          <th>车辆型号</th>
          <th>车牌号</th>
          <th>发动机号</th>
          <th>拖车状态</th>
          <th>罚息总额</th>
          <th>GPS总费</th>
          <th>管理费总额</th>
          <th>本息总额</th>
          <th>欠账总额</th>
        </tr>
        <tr>
          <td>大众</td>
          <td>Passat 2008款 R36 旅行版</td>
          <td>辽B 8888</td>
          <td>Passat 123456</td>
          <td>不能拖车</td>
          <td>2000.00</td>
          <td>300.00</td>
          <td>500.00</td>
          <td>12000.00</td>
          <td>6800.00</td>
        </tr>
      </table>
      <form class="form-horizontal" style="margin-top:20px;">
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 坏账处理备注</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="badLoanRemark" name="badLoanRemark"
                                  ></textarea>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal-footer">
  <p class="col-sm-2"> <a  href = "javascript:void(0)" onclick = "closePage(0)" class="btn btn-default btn-block">关闭</a> </p>
  <p class="col-sm-2"> <a  href = "javascript:void(0)" id="submitA" style="display:none" class="btn btn-danger btn-block">提交处理</a> </p>
</div>
<div id="sta_modal_saleRepayment" class="modal modal_sml fade in" style=" width:350px; height:200px;">
	<div class="modal-header" id="header1"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
		<h4 class="modal-title" id="myModalLabel1" style="font-size:16px;">输入卖出金额</h4>
	</div>
	<input type="text" hidden="hidden" name="flag" value="" id="flag">
	<input type="text" hidden="hidden" name="taskid" value="" id="taskid">
	<div class="modal-body" >
		<div class="form-group">
			<div class="form-group">
				<div class="form-group">
					<label>卖出金额：</label>
					<input type="number" class="form-control" id="saleMoney" name="saleMoney" min="0">
				</div>
			</div>
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-danger" onclick="CarDispose(0);">提交</button>
			<button type="button" onclick="colsediv(0);" class="btn btn-default">取消</button>
		</div>
	</div>
</div>
<div id="sta_modal_detainedCarRepayment" class="modal modal_sml fade in" style=" width:350px; height:200px;">
	<div class="modal-header" id="header2"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
		<h4 class="modal-title" id="myModalLabel2" style="font-size:16px;">输入提车还款金额</h4>
	</div>
	<div class="modal-body" >
		<div class="form-group">
			<div class="form-group">
				<div class="form-group">
					<label>还款金额：</label>
					<input type="number" class="form-control" id="repaymentMoney" name="repaymentMoney" min="0">
				</div>
			</div>
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-danger" onclick="CarDispose(0);">提交</button>
			<button type="button" onclick="colsediv(0);" class="btn btn-default">取消</button>
		</div>
	</div>
</div>

<div id="sta_modal_vehicleNoSaleRepayment" class="modal modal_sml fade in" style=" width:350px; height:200px;">
	<div class="modal-header" id="header3"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
		<h4 class="modal-title" id="myModalLabel3" style="font-size:16px;">输入提车还款金额</h4>
	</div>
	<div class="modal-body" >
		<div class="form-group">
			<div class="form-group">
				<div class="form-group">
					<label>还款金额：</label>
					<input type="number" class="form-control" id="repaymentMoney2" name="repaymentMoney2" min="0">
				</div>
			</div>
		</div>
		<div class="form-group">
			<button type="button" class="btn btn-danger" onclick="CarDispose(0);">提交</button>
			<button type="button" onclick="colsediv(0);" class="btn btn-default">取消</button>
		</div>
	</div>
</div>

</body>
<script type="text/javascript" src="${basePath}/js/loanerDetail.js"></script>
<script type="text/javascript" >
	function closePage(){
//		$("#order_modal").empty();
		$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
	}
</script>
</html>
