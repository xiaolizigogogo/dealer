<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link type="text/css" rel="stylesheet" href="${basePath}/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="${basePath}/css/dropZone.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload-ui.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/css/jquery.fileupload.css" />
    <link type="text/css" rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
	<link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
	<link rel="stylesheet" href="${basePath}/css/lightbox.min.css"/>

    <script src="${basePath}/js/lightbox.js"></script>
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

<div class="modal-header">
	<a type="button" href="javascript:void(0)" onclick="closePage();"
		class="close"><span aria-hidden="true">&times;</span></a>
	<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">
		查看订单<small style="padding-left: 20px; font-size: 14px;"
			class="text-danger" id="orderid">订单号：</small>
	</h4>
</div>
<input type="text" hidden="hidden" name="uuid"  id="uuid">
<div class="modal-body">
	<div class="tab_box" style="padding:0;">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist">
			<li role="presentation" class="active"><a href="#tab1"
				aria-controls="tab1" role="tab" data-toggle="tab">个人资料</a></li>
			<li role="presentation"><a href="#tab2" aria-controls="tab2"
				role="tab" data-toggle="tab">车辆信息</a></li>
			<li role="presentation"><a href="#tab3" aria-controls="tab3"
				role="tab" data-toggle="tab">借款需求</a></li>
			<li role="presentation"><a href="#tab4" aria-controls="tab4"
				role="tab" data-toggle="tab">附件资料</a></li>
			<li role="presentation"><a href="#tab5" aria-controls="tab5"
				role="tab" data-toggle="tab">审批历史</a></li>
			<li role="presentation"><a href="#tab6" aria-controls="tab6"
				role="tab" data-toggle="tab">历史借款</a></li>
			<li role="presentation"><a href="#tab7" aria-controls="tab7"
			    role="tab" data-toggle="tab">还款计划</a></li>
                 <!--<li role="presentation"><a href="#tab0" aria-controls="tab0"
			    role="tab" data-toggle="tab">总公司还款计划</a></li>-->
		</ul>
        <input type="hidden" id="processid">
		<!-- Tab panes -->
		<div class="tab-content clearfix">
        <div role="tabpanel" class="tab-pane" id="tab0">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">总公司还款计划</h3>
          </div>
         
          <div class="row">
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>借款额</dt>
                <dd id="head-office-money"></dd>
              </dl>
            </div>
              <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>利率</dt>
                <dd id="head-office-rate"></dd>
              </dl>
            </div>
            <div class="col-sm-6">
              <dl class="dl-horizontal">
                <dt>借款日</dt>
                <dd id="head-office-date"></dd>
              </dl>
            </div>
          
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>应还本金</dt>
                <dd id="head-office-capital"></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>应还利息</dt>
                <dd id="head-office-interest"></dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>还款方式</dt>
                <dd id="head-office-repayment"></dd>
              </dl>
            </div>
           
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
                <dd id="immediate_name2"> </dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>关系</dt>
                <dd id="immediate_relation2"> </dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>手机号码</dt>
                <dd id="immediate_Mobile2"> </dd>
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
                <dd id="other_name2"> </dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>关系</dt>
                <dd id="other_relation2"> </dd>
              </dl>
            </div>
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>手机号码</dt>
                <dd id="other_mobile2"> </dd>
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
			<div class="from_box carinfo_from">
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
        </div>
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
                <dd id="approveMoney"> <b class="text-danger">25</b> 万元 </dd>
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
                <dd id="repay_way"></dd>
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
                <dd id="plantype"> </dd>
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
			<div role="tabpanel" class="tab-pane" id="tab4">
			<div class="row">
					<div class="col-sm-12">
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">个人信息</h3>
							</div>
							<div class="img_list">
							<ul class="list-inline" id="personalInformation">
									
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">车辆类信息</h3>
							</div>
							<div class="img_list">
								<ul class="list-inline" id="vehicleInformation">
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">合同类信息</h3>
							</div>
							<div class="img_list">
								<ul class="list-inline" id="contractInformation">
								</ul>
							</div>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">其他类信息</h3>
							</div>
							<div class="img_list">
								<ul class="list-inline" id="otherInformation">
								</ul>
							</div>
						</div>
					</div>
					            <div class="from_box">
              <div class="from_tit clearfix">
                <h3 class="pull-left">录音信息</h3>
              </div>
              <div class="img_list" >
                <ul class="list-inline" id="recordingInformation">
                </ul>
              </div>
            </div>
		</div>
					<div class="col-sm-12">
						<div class="from_box">
							<div class="from_tit clearfix">
								<h3 class="pull-left">合同下载</h3>
							</div>
							<div class="ht_list">
								<ul class="list-inline">
									<li>
										<div class="file_img ">
											<img src="${basePath}/img/ht01.png" />
										</div>
										<h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="loan_contact"><i class=""></i>借款合同</a></h4>
									</li>
									<li>
										<div class="file_img"><img src="${basePath}/img/ht02.png" /></div>
										<h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="financing_services_agreement">融资服务协议</a></h4>
									</li>
									<li>
										<div class="file_img"><img src="${basePath}/img/ht03.png" /></div>
										<h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="mortgage_contract">抵押合同</a></h4>
									</li>
									<li>
										<div class="file_img"><img src="${basePath}/img/ht04.png" /></div>
										<h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="pledge_contract" >机动车质押合同</a></h4>
									</li>
									<li>
										<div class="file_img"><img src="${basePath}/img/ht05.png" /></div>
										<h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="loan_receipt" >借款收据</a></h4>
									</li>
									<li>
										<div class="file_img"><img src="${basePath}/img/ht06.png" /></div>
										<h4 class="text-center"><i class="text-muted glyphicon glyphicon-cloud-download"></i> <a href="#" id="loan_apply" >借款申请表</a></h4>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
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
		    <div role="tabpanel" class="tab-pane" id="tab7">
        <div class="list_box">
          <table class="table table-bordered table-striped" id="repayPlanVo">
            <thead>
              <tr>
				  <th>期数</th>
				  <th>还款本金</th>
				  <th>还款利息</th>
				  <%--<th>手续费</th>--%>
				  <%--<th>办理费</th>--%>
				  <%--<th>查档费</th>--%>
				  <th>停车费</th>
				  <th>服务费</th>
				  <th>核查管理费</th>
				  <%--<th>风险金</th>--%>
				  <th>违约金</th>
				  <th>逾期罚息</th>
				  <th>本期还款总额</th>
				  <th>剩余本金</th>
				  <%--<th>提前还款</th>--%>
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
        <div class="col-sm-4">
          <label>面审视频截图</label>

          <div>
          	<table id="warp" name="warp">
          	<tr>
          	<td>
          	<a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_0" type="file" name="files[]"
              data-url="trialPhaseReview" />
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_0" /></p>
            </td>
            </tr>
          </table>
          </div>

        </div>
      </form>
    </div>
  </div>
  <div class="op_box"  id="op_box_callBack" style="display:none;">
    <h4>电话核实</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label"><i class="text-danger">*</i> 电话核实记录</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_callBack"  maxlength="50"
                                  name="conclusion"></textarea>
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
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 是否家访</label>
          <div class="col-sm-10">
            <label class="radio-inline">
              <input type="radio" name="reviewStatus_signContract" id="signContractinlineRadio1" value="passed" checked="checked">
              已家访 </label>
            <label class="radio-inline">
              <input type="radio" name="reviewStatus_signContract" id="signContractinlineRadio1" value="rejected">
              未家访 </label>
          </div>
        </div>
        <div class="form-group">
          <label  class="col-sm-2 control-label"> 附件上传</label>
          <div class="col-sm-10" style="padding-top:10px;">

            <ul class="list-inline">
            <table id="warp" name="warp">
         	<tr>
         	  <td>
              <li>
                <p><i class="text-danger">*</i> 机动车交通强制保险单</p>
                <div> <a href="javascript:;" class="file">选择文件
                  <input id="up_img_WU_FILE_1" type="file"  name="files[]"
                  data-url="insurancePolicy" />
                  </a>
                  <p class="file_img"><img id="imgShow_WU_FILE_1" ></p>
                </div>
              </li>
              </td>
              <td>
              <li>
                <p><i class="text-danger">*</i> 车辆备用钥匙</p>
                <div> <a href="javascript:;" class="file">选择文件
                  <input type="file" name="files[]" id="up_img_WU_FILE_2"
                    data-url="falseKey" />
                  </a>
                  <p class="file_img"><img id="imgShow_WU_FILE_2" ></p>
                </div>
              </li>
              </td>
              <td>
              <li>
                <p><i class="text-danger">*</i> 相关合同附件</p>
                <div> <a href="javascript:;" class="file">选择文件
                  <input type="file" name="files[]" id="up_img_WU_FILE_3"
                  	data-url="signContractReview" />
                  </a>
                  <p class="file_img"><img id="imgShow_WU_FILE_3" ></p>
                </div>
              </li>
              </td>
              <td>
              <li>
                <p><i class="text-danger">*</i> 人车合照</p>
                <div> <a href="javascript:;" class="file">选择文件
                  <input type="file" name="files[]" id="up_img_WU_FILE_4"
                  	data-url="oneCarPhoto" />
                  </a>
                  <p class="file_img"><img id="imgShow_WU_FILE_4" ></p>
                </div>
              </li>
              </td>
              <td>
              <li>
                <p>车辆购置税证明</p>
                <div> <a href="javascript:;" class="file">选择文件
                  <input type="file" name="files[]" id="up_img_WU_FILE_5"
                  	data-url="fahrzeugbeschaffung"  />
                  </a>
                  <p class="file_img"><img id="imgShow_WU_FILE_5" ></p>
                </div>
              </li>
              </td>
              </tr>
              </table>
            </ul>
          </div>
        </div>
        <div class="form-group">
          <label for="inputEmail3" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
          <div class="col-sm-8">
            <textarea cols="168" rows="2" class="form-control" id="conclusion_signContract" maxlength="50"
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
        <div class="form-group">
          <label class="col-sm-2 control-label"><i class="text-danger">*</i> 附件上传</label>
          <div class="col-sm-8">
          	<table id="warp" name="warp">
          	<tr>
          	<td>
          	<a href="javascript:;" class="file">选择文件
            <input id="up_img_WU_FILE_7" type="file" name="files[]"
              data-url="visiteCheckReview" />
            </a>
            <p class="file_img"><img id="imgShow_WU_FILE_7" /></p>
            </td>
            </tr>
          </table>
          </div>
        </div>
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
            <label class="radio-inline">
              <input type="radio" name="reviewStatus_judgment" id="judgmentinlineRadio3" value="concludeAgain">
              合同调整 </label>
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
  <div class="op_box"  id="op_box_lended" style="display: none;">
    <h4>出账</h4>
    <div class="op_box_con clearfix">
      <form class="form-horizontal">
        <div class=" col-sm-8">
          <div class="form-group">
            <label class="col-sm-2 control-label"><i class="text-danger">*</i> 出账时间</label>
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
          <div class="form-group">
            <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 上传出账凭证</label>
            <div class="col-sm-10">
             <table name="warp">
             <tr>
             <td>
             <a href="javascript:;" class="file">选择文件
              <input id="up_img_WU_FILE_6"  name="files[]" type="file"
              		data-url="lendedReview" />
              </a>
              <p class="file_img"><img id="imgShow_WU_FILE_6"  /></p>
              </td>
              </tr>
              </table>
            </div>
          </div>
          <div class="form-group">
            <label  class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
            <div class="col-sm-10">
              <textarea cols="168" rows="2" class="form-control" id="conclusion_lended" maxlength="50"
                                  name="conclusion"></textarea>
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal-footer ">
	<p class="col-sm-2 ">
		<a href="javascript:void(0)" onclick="closePage();"
			class="btn btn-default btn-block">关闭</a>
	</p>
		<p class="col-sm-2">
		<a  id="submitA" href = "javascript:void(0)" onclick="submitReview();" class="btn btn-danger btn-block">提交处理</a>
	</p>
</div>
<input type="hidden" id="processDefinitionId" />
<div id="loan_attachment_div" style="display:none;">
</div>
</body>
<script type="text/javascript">
	function loanController(taskId,processDefinitionId){
		$("#op_box_" + processDefinitionId).css("display","block");
	}

	function doReview(conclusion,loanId,reviewStatus,processDefinitionId,taskId,reviewMoney,lendDate){
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
                    if (data == '0000') {
                    	if(processDefinitionId == "lended"){
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
    	                                 document.location.href = '/admin/loan/contractManagement.html';
    	                                 return true;
    	                             });
    	                        }
                        	});
                    	}else{
                    		layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                            	$("#fade2").css("display","none");
                                //parent.document.getElementById('fade1').style.display='none';
			                    $("#fade1").hide();
                                 document.location.href = '/admin/loan/contractManagement.html';
                                return true;
                            });
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

	/** 提交评审 */
    function submitReview() {
    	var processDefinitionId = $("#processDefinitionId").val();
        var reviewStatus = $('input[name="reviewStatus_" + processDefinitionId]:checked').val();
        var loanId = $("#customer_id_hidden").val().split(":")[0];
        var processDefinitionId = $("#customer_id_hidden").val().split(":")[3];
		var taskId = $("#customer_id_hidden").val().split(":")[2];
        var conclusionObj = $("#conclusion_" + processDefinitionId);
        var conclusion = conclusionObj.val();
        var lendDate = $("#lendDate").val();

        var reviewStatusStr = "通过";
        if (reviewStatus == "rejected") {
            reviewStatusStr = "拒绝";
        } else if (reviewStatus == "concludeAgain") {
            reviewStatusStr = "合同调整";
        }
        if (processDefinitionId === 'signContract') {
            /** 判断附件是否上传完毕 */
            var signContractReview = $("input[id='signContractReview']").val();//相关合同附件
            var oneCarPhoto = $("input[id='oneCarPhoto']").val();//人车合照
            var insurancePolicy = $("input[id='insurancePolicy']").val();//机动车交通强制保险单
            var falseKey = $("input[id='falseKey']").val();//车辆备用钥匙

            if (signContractReview == null || signContractReview == "") {
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
            }

            if (reviewStatus == "rejected") {
                reviewStatusStr = "未家访";
            } else {
                reviewStatusStr = "已家访";
            }
        } else if(processDefinitionId === 'lended') {
            if (lendDate == null || lendDate == "") {
                layer.msg("出账时间不能为空！");
                return false;
            }
            var lendedReview = $("#lendedReview").val();
            if(lendedReview == "" || lendedReview == null){
            	layer.msg("请上传出账凭证！");
                return false;
            }
        } else if(processDefinitionId === 'visiteCheck'){
        	var visiteCheckReview = $("#visiteCheckReview").val();
        	if(visiteCheckReview == "" || visiteCheckReview == null){
            	layer.msg("请上传家访凭证！");
                return false;
            }
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
        var dialogMsg = "你确定此笔借款<font color='red'>" + reviewStatusStr + "</font>吗？";
        alertMessage(dialogMsg,'doReview("'+conclusion+'","'+loanId+'","'+reviewStatus+'","'+processDefinitionId+'","'+taskId+'","'+reviewMoney+'","'+lendDate+'")','qs_box1');
    }
	$(function() {
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

        var doneProcess = function (data,obj) {
            $.each(data.result, function (index, file) {
                if (file.code == "0000") {
                    layer.msg("上传成功！");
                    $(obj).attr("src",file.showFilePath);
                    $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId="+loanId);
                } else {
                	if(file.code == "9999"){
                		layer.msg("不支持此类型的文件！");
                	}
                }
            });
        };


		var uuid;
		var customer_id_hiddenstr = $("#customer_id_hidden").val();
		var strarray = new Array();
		strarray = customer_id_hiddenstr.split(":");
		var customer_id_hidden = strarray[0];
		var orderid = strarray[1];
		var taskId = strarray[2];
		var processDefinitionId = strarray[3];
		var assignee = strarray[4];
		var path=strarray[6];
		$("#processDefinitionId").val(processDefinitionId);

		//进度条控制
		var li_arr = $("#ol_vehiclesLoans").find("li");
		$.each(li_arr,function(index,value){
			if($(this).find("span").eq(0).attr("id") == ("li_" + processDefinitionId)){
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

 //        alert(path);
        if(path=="no"){
            if("null" != assignee && "" != assignee){
                loanController(taskId,processDefinitionId);
                $("#submitA").show();
            }else{
                $("#submitA").hide();
            }}else{

            $("#submitA").hide();
            }






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

                var pledgeType = data.loanInfo.pledgeType;
				var pledgeTypeStr = "";
        	    if(pledgeType == "drivePledge"){
					pledgeTypeStr = "押证";
        	    }else if(pledgeType == "vehiclePledge"){
					pledgeTypeStr = "押车";
				}
				$("#mortgageType").html(pledgeTypeStr);
				//订单号
				$("#loanorderid").html(orderid);
				//借款人
				$("#loanername").html(data.loanInfo.customerRegisterInfo.customerName);
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
				$("#repay_way").html(repaywaystr);
				
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
				
				$("#plantype").html(data.loanInfo.plantype=="0"?"综合服务费按月收取":"综合服务费一次性收取");
				
				$("#drunkDrive").html(data.loanInfo.drunkDrive+"%");
				
				$("#depreciationFee").html(data.loanInfo.depreciationFee+"%");
							
				$("#parkCost").html((data.loanInfo.parkCost==""?"0":data.loanInfo.parkCost)+"元");
				//数据显示更新 by why 20160918

				//合同相关下载的相关信息取得
				var loaninfo = data.loanInfo;
				if((loaninfo.loanStatus == 'signContract')||
						(loaninfo.loanStatus == 'callBack')||
						(loaninfo.loanStatus == 'signContract_rejected')||
						(loaninfo.loanStatus == 'dataReview')||
						(loaninfo.loanStatus == 'reuploadInformatin')||
						(loaninfo.loanStatus == 'lended')){
					$("#contact_div").css("display","block");
					//设置合同下载为可见状态
					var loanId = loaninfo.uuid;
					//贷款合同
					$("#loan_contact").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'getLoanContractWord\')");
					//融资服务协议
					$("#financing_services_agreement").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'getLoanServiceWord\')");
					//抵押合同
					$("#mortgage_contract").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'getLoanPledgeContractWord\')");
					//机动车质押合同
					$("#pledge_contract").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'getLoanPledgeGuaranteeContractWord\')");
					//借款收据
					$("#loan_receipt").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'getloan_receiptWord\')");
				}else{
					//设置合同下载为不可见状态
					$("#contact_div").css("display","none");
				}
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
								data.customerAdditionalInfo.enterpriseIndustry);
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
						$("#isExamined").html(data.guaranteeEvaluateInfo.isExamined);
						$("#isInsure").html(data.guaranteeEvaluateInfo.isInsure);
						$("#isProvince").html(data.guaranteeEvaluateInfo.isProvince);
						$("#vehicleBrand").html(data.guaranteeEvaluateInfo.vehicleBrand);
						$("#vehicleModels").html(data.guaranteeEvaluateInfo.vehicleModels);
						$("#vehicleNo").html(data.guaranteeEvaluateInfo.vehicleNo);
						$("#mileaged").html(data.guaranteeEvaluateInfo.mileaged+"km");
						$("#purchaseDate").html(data.guaranteeEvaluateInfo.purchaseDate);
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
					$
				.ajax({
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
				                    +'</li>';
							   personalInformation=personalInformation+ul;    
							}
							$("#personalInformation").html(personalInformation);
							if(type=="oneCarPhoto"||type=="vehiclStatusOne"||type=="vehicleLicense"||type=="registrationCertificateOne"||type=="businessInsurancePolicy"||type=="vehiclStatusThree"||type=="vehiclStatusFour"
							   ||type=="spareKey"||type=="vehiclStatusTwo"||type=="gpsInstall"||type=="locationSuccess"||type=="vehicleDriveCard"||type=="registrationCertificateTwo"||type=="insurancePolicy"||type=="falseKey"
							   ||type=="pledgeVehicleConsultArchives"){
							 var ul='<li> <div class="file_img"> <p class="tools">'
							        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
							        +'<img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /> </div>'
							        +'<h4>'+title+'</h4>'
							        +'</li>';
							   vehicleInformation=vehicleInformation+ul;    
							}
							$("#vehicleInformation").html(vehicleInformation);
							if(type=="loanContractOne"||type=="mortgageContractOne"||type=="pledgeContract"||type=="loanReceipt"||type=="signTheContract"||type=="loanContractTwo"||type=="mortgageContractTwo"
							   ||type=="pledgeContractTwo"||type=="lendedReview"||type=="signContractReview"||type=="continueUpload"){
							 var ul='<li> <div class="file_img"> <p class="tools">'
				                    +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
				                    +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
				                    +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
				                    +'<h4>'+title+'</h4>'
				                    +'</li>';
							   contractInformation=contractInformation+ul;    
							}
							$("#contractInformation").html(contractInformation);
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
//							html += "<td align='center'>" + record.manageFee + "</td>";
//							html += "<td align='center'>" + record.gpsCost + "</td>";
//							html += "<td align='center'>" + record.checkCost + "</td>";
							html += "<td align='center'>" + record.parkCost + "</td>";
							html += "<td align='center'>" + record.depreciationFee + "</td>";
							html += "<td align='center'>" + record.drunkDrive + "</td>";
//							html += "<td align='center'>" + record.cashdepositFee + "</td>";
							html += "<td align='center'>" + record.penaltyFee + "</td>";
							html += "<td align='center'>" + record.overdueFee + "</td>";
							html += "<td align='center'>" + record.repayTotal + "</td>";
							html += "<td align='center'>" + record.surplusCapital + "</td>";
//							html += "<td align='center'>" + record.advancerepay + "</td>";
							html += "<td align='center'>" + date + "</td>";
							html += "</tr>";
							repayPlanVo=repayPlanVo+html;
						}
						//计算合计金额
						var sum = accAdd(data.repayPlanVo.sumInvest, data.repayPlanVo.sumCaptial);
						sum = accAdd(sum,data.repayPlanVo.sumManageFee);
						sum = accAdd(sum,data.repayPlanVo.sumGpsFee);
//						sum = accAdd(sum,data.repayPlanVo.sumCheckFee);
						sum = accAdd(sum,data.repayPlanVo.sumParkFee);
						sum = accAdd(sum,data.repayPlanVo.sumDepreciationFee);
						sum = accAdd(sum,data.repayPlanVo.sumdrunkDrugDrive);
						sum = accAdd(sum,data.repayPlanVo.sumcashdepositFee);
						sum = accAdd(sum,data.repayPlanVo.sumPenaltyFee);
						sum = accAdd(sum,data.repayPlanVo.sumOverdueFee);
                        repayPlanVo=repayPlanVo+
                        "<tr>" + "<td align='center'>合计：</td>"
						+ "<td align='center'>" + data.repayPlanVo.sumCaptial + "</td>"
						+ "<td align='center'>" + data.repayPlanVo.sumInvest + "</td>"
//						+ "<td align='center'>" + data.repayPlanVo.sumManageFee + "</td>"
//						+ "<td align='center'>" + data.repayPlanVo.sumGpsFee + "</td>"
//						+ "<td align='center'>" + data.repayPlanVo.sumCheckFee + "</td>"
						+ "<td align='center'>" + data.repayPlanVo.sumParkFee + "</td>"
						+ "<td align='center'>" + data.repayPlanVo.sumDepreciationFee + "</td>"
						+ "<td align='center'>" + data.repayPlanVo.sumdrunkDrugDrive + "</td>"
//						+ "<td align='center'>" + data.repayPlanVo.sumcashdepositFee + "</td>"
						+ "<td align='center'>" + data.repayPlanVo.sumPenaltyFee + "</td>"
								+ "<td align='center'>" + data.repayPlanVo.sumOverdueFee + "</td>"
						+ "<td align='center'>" + sum.toFixed(2) + "</td>"
						+ "<td align='center'>----</td>"
//						+ "<td align='center'>----</td>"
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
                          }else if (record.reviewLevel == "reloanAduit"){
                            reviewLevel = "再贷初审";
                          }else if (record.reviewLevel == "helploanAduit"){
                            reviewLevel = "助贷初审";
                          }

                        var a="";
                        if(record.reviewLevel !="signContract"){
                        	if(record.reviewStatus=="passed"){
                        		a="通过";
                        	}
                        	else if(record.reviewStatus=="passed"){
                        		a="不通过";
                        	}
                        	else{
                        		a="合同调整";
                        	}

                        }
                          if(record.reviewLevel=="signContract"){

                        	  if(record.reviewStatus=="passed"){
                        		  a="已家访";
                        	  }
                        	  else{
                        		  a="未家访";

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
								+"<td>"+ a + "</td>"
								+"<td>"+ reviewAmount1 + "</td>"
								+"<td>"+ record.reviewConclusion + "</td>"
								+"<td>"+ record.createdAt + "</td>"
								+"</tr>";

							info = info + str;
						}

						$("#examineinfo tr:last").after(info);



					}})


	})

	function closePage(){
		$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
	}

	function pictureDownload(oid){
       $("#downloadIframe").attr("src","/admin/loan/getroute?id=" + oid);
    }
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
				window.open(url, '_blank');
			}, error: function () {
				layer.msg("系统错误!");
				return false;
			}
		})
	}
</script>
</html>
