<%@ page import="com.utonw.utonbase.core.erpcommon.config.ParamterControl" %>
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
  <a type="button" href="javascript:void(0)" onclick="closePage(0);"
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
      <li role="presentation"><a  href="#tab_attachment" aria-controls="tab_attachment"
                                 role="tab" data-toggle="tab">附件资料</a></li>
      <li role="presentation"><a href="#tab5" aria-controls="tab5"
                                 role="tab" data-toggle="tab">审批历史</a></li>
      <li role="presentation"><a href="#tab6" aria-controls="tab6"
                                 role="tab" data-toggle="tab">历史借款</a></li>
      <li role="presentation"><a href="#tab7" aria-controls="tab7"
                                 role="tab" data-toggle="tab">还款计划</a></li>
      <li role="presentation"><a href="#tab8" aria-controls="tab8"
                                 role="tab" data-toggle="tab">催收历史</a></li>
      <li role="presentation"><a href="#tab9" aria-controls="tab9"
                                 role="tab" data-toggle="tab">还款情况</a></li>
      <li role="presentation"><a href="#tab10" aria-controls="tab10"
                                 role="tab" data-toggle="tab">总公司还款计划</a></li>
    </ul>
    <input type="hidden" id="processid">
    <!-- Tab panes -->
    <!-- Tab panes -->
<div class="tab-content clearfix">
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
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>机动车登记号码</dt>
                <dd id="vehicleRegisterCode"></dd>
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
                <dd id="loanstatuss"></dd>
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
            <div class="col-sm-3">
              <dl class="dl-horizontal">
                <dt>购车方式</dt>
                <dd id="buy_car_method"></dd>
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
                <dt>抵押方式</dt>
                <dd id="mortgageType"></dd>
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
      <div role="tabpanel" class="tab-pane" id="tab8">
        <div class="list_box">
          <table class="table table-bordered table-striped"  id="collection">
            <thead>
            <tr>
              <th>序号</th>
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

      <div role="tabpanel" class="tab-pane" id="tab7">
        <div class="list_box">
          <table class="table table-bordered table-striped" id="repayPlanVo">
            <thead>
            <tr>
              <th>期数</th>
              <th>还款本金</th>
              <th>还款利息</th>
              <th>综合服务费</th>
              <th>办理费</th>
              <th>GPS流量费</th>
              <th>停车费</th>
              <th>风险保证金</th>
              <th>罚息</th>
              <th>违约金</th>
              <th>催收费</th>
              <th>拖车费</th>
              <th>本期还款总额</th>
              <th>还款日期</th>
            </tr>
            </thead>
            <tbody id="repayPlayDetail">
            </tbody>
          </table>
        </div>
      </div>
      
       <div role="tabpanel" class="tab-pane" id="tab10">
        <div class="list_box">
          <table class="table table-bordered table-striped" id=repayPlanB2bVo>
            <thead>
            <tr>
              <th>期数</th>
              <th>还款本金</th>
              <th>还款利息</th>
              <th>服务费</th>
              <th>其它费用</th>
              <th>本期还款总额</th>
              <th>还款日期</th>
            </tr>
            </thead>
            <tbody id="repayPlanB2bVo_tbody">
            </tbody>
          </table>
        </div>
   </div>

      <div role="tabpanel" class="tab-pane" id="tab9">
        <div class="from_box">
          <div class="from_tit clearfix">
            <h3 class="pull-left">累计还款信息</h3>
          </div>
          <div class="list_box">
            <table class="table table-bordered table-striped" style="margin-bottom:0px;">
              <thead>
              <tr>
                <th  style="width:5%;">期数</th>
                <th style="width:10%;">应还款金额</th>
                <th style="width:40%;">实际还款金额</th>
                <th  style="width:9%;">累计差额</th>
                <th style="width:36%;">还款时间</th>
              </tr>
              </thead>
              <tbody id="leiji_repayment">
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
            <label for="inputEmail3" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
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
                  <input type="text" class="form-control" name="reviewMoney" id="reviewMoney" onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
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
            <label for="conclusion" class="col-sm-2 control-label"><i class="text-danger">*</i> 意见</label>
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
      <a href="javascript:void(0)" onclick="closePage(0);"
         class="btn btn-default btn-block">关闭</a>
    </p>
  </div>
  <input type="hidden" id="processDefinitionId" />
  <div id="loan_attachment_div" style="display:none;">
  </div>
</body>
<script type="text/javascript">

  var id = $("#customer_id_hidden").val();
  var loanDetailsAll = map.get(id);
  var loanId = loanDetailsAll.uuid;

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
                  document.location.href = '/admin/loan/loanInfoList.html';
                  return true;
                });
              }
            });
          }else{
            layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
              $("#fade2").css("display","none");
              //parent.document.getElementById('fade1').style.display='none';
	          $("#fade1").hide;
              document.location.href = '/admin/loan/loanInfoList.html';
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
  //下载合同共通函数
  function getLoanContractWord(loanId, type) {
	  debugger;
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

  //累计还款信息表格
  function addUpPaymentInfo(paymentHistoryList){
    var html = "";
    $.each(paymentHistoryList,function(key,value){
      html += "<tr>"+"<td>"+(key+1)+"</td><td>"+value.createTime+"</td><td>"+value.repaymentAmount+"</td><td>"+value.surplusAmount+"</td>"+"</tr>";
    });
    return html;
  }



  $(function() {
    $('input[type="radio"]').click(function(){
      $("input[type='radio']").removeAttr("checked");
      $(this).attr("checked","checked");
    });
    /*var aaa = $("#customer_id_hidden").val();
    var loanId = $("#customer_id_hidden").val().split(":")[0];
    var taskid = $("#customer_id_hidden").val().split(":")[2];
    var state = $("#customer_id_hidden").val().split(":")[5];*/
    var loanId = loanDetailsAll.uuid;
    var customerId = loanDetailsAll.customerId;
    var div= "";

    $.ajax({
      url : "/admin/loan/loanRepaymentReviewByLoanId?loanId=" + loanId,
      type : "get",
      dataType : "json",
      success : function(data) {
        var leiji_repayment_html = "";
        var wangqi_repayment_html = "";

        //金额明细
        var currentperiod = 0;


        $.each(data.rList,function(key,value){
          //累计还款信息
          var listn = "#list" + value.repayPlanDetail.repayPeriod;
          var listn1 = "list" + value.repayPlanDetail.repayPeriod;
          var addUpPaymentInfoHtml = addUpPaymentInfo(value.paymentHistoryList);
          leiji_repayment_html += "<tr>" +
                  "<td>"+value.repayPlanDetail.repayPeriod+"</td>" +
                  "<td style='width:30%;'>"+value.repayPlanDetail.repayTotal+"</td>" +
                  "<td><a class=;='collapsed list_btn' role='button' data-toggle='collapse' href='"+listn+"' aria-expanded='false' aria-controls='"+listn1+"'>"+value.repaymentTransactions[0].actualRepaymentSum+"</a>"+
                  "<div id='"+listn1+"' class='collapse'>"+
                  "<table class='table'><tr><th>#</th><th>还款时间</th><th>还款金额</th><th>剩余金额</th></tr>" +
                  addUpPaymentInfoHtml +
                  "</table><div>" +
                  "</td>" +
                  "<td>"+(parseFloat(value.repayPlanDetail.repayTotal) - parseFloat(value.repaymentTransactions[0].actualRepaymentSum))+"</td>" +
                  "<td>"+value.updateDay+"</td>"+
                  "</tr>";
          //取得已经还款去期数的总和
          currentperiod ++;
        });
        $("#leiji_repayment").html(leiji_repayment_html);

        //Bug:397 start by wangyj  2016-07-12
        //更新还款评审的标题
        var repayTitle = "第"+currentperiod+"期还款评审";
        var repaymentName="第"+currentperiod+"期还款";
        $("#repayment_name").html(repaymentName);
        $("#review_name").html(repayTitle);
        //Bug:397 end by wangyj  2016-07-12
        //更新拖车标题
        var detainCarTitle = "第"+currentperiod+"期逾期处理";
        $("#review_detaincar").html(detainCarTitle);

        //本期还款信息
        $("#repaymentName").html(data.repayPlanDetail.remark);
        $("#repayTotal").html(data.repayPlanDetail.repayTotal);
        $("#repayDate").html(data.repayPlanDetail.repayDate.substring(0,10));
        //首先判断日期的大小
        var now = new Date();
        var repaydatetime = Date.parse(data.repayPlanDetail.repayDate);
        var date;
        if(now > repaydatetime){
          //存在延期的情况
          date = (now - repaydatetime)/(24*60*60*1000);
          $("#overdueDay").html(parseInt(date));
        }else {
          //当前没有处于逾期的情况
          $("#overdueDay").html("0");
        }
        $("#rpd_money").html(data.repayPlanDetail.repayTotal); //本期还款计划金额
        //记录本期还款总额
        totalrepayAmount = data.repayPlanDetail.repayTotal;
        //记录本期还款利息总和
        totalInterest = data.repayPlanDetail.repayInterest;
        totalInterest += data.repayPlanDetail.manageFee;
        totalInterest += data.repayPlanDetail.gpsCost;
        //totalInterest += data.repayPlanDetail.checkCost;
        totalInterest += data.repayPlanDetail.parkCost;
        totalInterest += data.repayPlanDetail.depreciationFee;
        totalInterest += data.repayPlanDetail.drunkDrive;
        totalInterest += data.repayPlanDetail.cashdepositFee;
        totalInterest += data.repayPlanDetail.penaltyFee;
        totalInterest += data.renzhengfei;
        $("#repayPlanDetailId").val(data.repayPlanDetail.id);
        $("#surplus_rpd_money").html(data.repayPlanDetail.surplusRepayTotal);  //本期剩余应还金额
        //记录本期还款剩余金额
        surplus_rpd_money = data.repayPlanDetail.surplusRepayTotal;
        var actualmoney = parseFloat(data.repayPlanDetail.repayTotal)-parseFloat(data.repayPlanDetail.surplusRepayTotal);
        var float_actualmoney = actualmoney.toFixed(2);
        $("#repaymentAmount").val(float_actualmoney); //还款实际金额
        $("#actualMoeny").html(float_actualmoney);
        $("#smsContent").html("您本月有还款未还截止日" + data.repayPlanDetail.repayDate + ",为免逾期罚息,请及时还款,如已还款请忽略.");

        var moneyDetailHtml = "<tr>" +
                "<td>金额明细</td>" +
                "<td>"+data.repayPlanDetail.repayCapital+"</td>" +
                "<td>"+data.repayPlanDetail.repayInterest+"</td>" +
                "<td>"+data.repayPlanDetail.depreciationFee+"</td>" +
                "<td>"+data.repayPlanDetail.gpsCost+"</td>" +
                "<td>"+data.repayPlanDetail.parkCost+"</td>" +
                "<td>"+data.repayPlanDetail.cashdepositFee+"</td>" +
                "<td>"+data.repayPlanDetail.overdueFee+"</td>" +
                "<td>"+data.repayPlanDetail.checkCost+"</td>" +
                "<td>"+data.repayPlanDetail.repayTotal+"</td>" +
                "</tr>";
        $("#moneyDetail").append(moneyDetailHtml);


        var manyRepaymentHtml = "";
        var actualMoeny = 0;
        //本期多次还款
        $.each(data.paymentHistoryL,function(key,value){
          manyRepaymentHtml += "<tr>"
                  +  "<td>"+(key+1)+"</td><td>"+value.createTime+"</td><td>"+value.repaymentAmount+"</td><td>"+value.surplusAmount+"</td>"
                  +  "</tr>";
          actualMoeny += parseFloat(value.repaymentAmount);
          surplusAmount = value.surplusAmount;
        });
        $("#manyRepayment").html(manyRepaymentHtml);
        $("#repayPeriod").html(data.repayPlanDetail.remark);
        //$("#actualMoeny").html(actualMoeny);

        //剩余还款金额，从多次还款的历史中，取得最后一次还款的数据
        $("#continueAmount").val(surplusAmount)


        if(activityId=="advancedRepaymented")
        {
          //更新还款评审的标题
          var repayTitle = "提前还款评审";
          $("#review_name").html(repayTitle);

          //计算剩余本金
          var advanceRepaySum = 0;
          for(var i=data.repayPlanDetail.repayPeriod;i<data.repayPlan.planList.length;i++)
          {
            advanceRepaySum+=parseFloat(data.repayPlan.planList[i].repayCapital);
          }

          $("#rpd_money").parent().html('剩余本金<span class="text-danger" id="surplus_rpd_money">'+ advanceRepaySum +'</span> 元');
          surplus_rpd_money=advanceRepaySum;

          $("#repaymentAmount").val(advanceRepaySum);
          $("#multiRepay").css("display","none");
          $("#overdue").css("display","block");


        }


      }
    });


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
    /*var customer_id_hiddenstr = $("#customer_id_hidden").val();
    var strarray = new Array();
    strarray = customer_id_hiddenstr.split(":");
    var customer_id_hidden = strarray[0];
    var orderid = strarray[1];
    var taskId = strarray[2];
    var processDefinitionId = strarray[3];
    var assignee = strarray[4];*/
    var orderid = loanDetailsAll.orderId;

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

    //如果是车辆评估节点，则不显示提交处理按钮
    /*if(processDefinitionId == "vehicleAssess"){
      $("#submitA").hide();
    }else{
      //流程画面控制
      if("null" != assignee && "" != assignee){
        loanController(taskId,processDefinitionId);
        $("#submitA").show();
      }else{
        $("#submitA").hide();
      }
    }*/

    /*BUG277*/
    //工作平台待办任务不显示提交处理按钮
    if(window.location.href.indexOf("queryagencypage")!=-1
            ||window.location.href.indexOf("querynewtaskpage")!=-1
            ||window.location.href.indexOf("contractManagement")!=-1){
      $("#submitA").css("display","none");
    }
    /*BUG277*/



    //设置订单号
    $("#orderid").html("订单号:"+orderid);
    //取得贷款历史数据
    $.ajax({
      url : "/admin/loan/historyloanlist?uuid="+loanId,
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
          }else if(record.loanStatus =="badLoanApplication" ){
            loanstatus = "坏账归档"
          }else if (record.loanStatus == "reloanAduit"){
            loanstatus = "待再贷初审";
          }else if (record.loanStatus == "helploanAduit"){
            loanstatus = "待助贷初审";
          }else if (record.loanStatus == "noTowTruck"){
            loanstatus = "未拖车";
          }else if (record.loanStatus == "towTruck"){
            loanstatus = "已拖车";
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
      url : "/admin/loan/loanreqinfo?uuid="+loanId,
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
        }else if(record.loanStatus =="badLoanApplication" ){
          loanstatus = "坏账归档"
        }else if (record.loanStatus == "reloanAduit"){
          loanstatus = "待再贷初审";
        }else if (record.loanStatus == "helploanAduit"){
          loanstatus = "待助贷初审";
        }
        $("#loanstatuss").html(loanstatus);
        //如果贷后的情况，则显示合同信息
        if(record.loanStatus == "repayment"){
          $("#contact_div").css("display","block");
          //设置合同下载为可见状态
          //var loanId = uuid;
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
          //借款申请表loan_apply
          $("#loan_apply").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'loan_applyFormExcel\')");
          //还款计划
          $("#repay_plan").attr("href","javascript:getLoanContractWord(\'"+loanId+"\', \'repay_planFormExcel\')");
        }else{
          //设置合同下载为不可见状态
          $("#contact_div").css("display","none");
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

        $("#plantype").html(data.loanInfo.plantype=="0"?"综合服务费按月收取":"综合服务费一次性收取");

        $("#drunkDrive").html(data.loanInfo.drunkDrive+"%");

        $("#depreciationFee").html(data.loanInfo.depreciationFee+"%");

        $("#parkCost").html((data.loanInfo.parkCost==""?"0":data.loanInfo.parkCost)+"元");
        //数据显示更新 by why 20160918

      }
    });
    function getRoundDigital(digit, length) {
      length = length ? parseInt(length) : 0;
      if (length <= 0) return Math.round(digit);
      digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
      return digit;
    }
    $.ajax({
      url : "/admin/customer/loanerDetailInfo?uuid=" + customerId,
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
                "${basePath}/admin/customer/queryContactsCusId.html?uuid="+customerId,
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
      url : "/admin/customer/getCarInfo?uuid=" + loanId,
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

        //机动车登记号码
        $("#vehicleRegisterCode").html(data.guaranteeEvaluateInfo.vehicleRegisterCode);


      }})
    //催收历史
    $.ajax({
      url : "/admin/loan/getcollectionRecord/" + loanId + ".html",
      type : "get",
      dataType : "json",
      success : function(data) {
        var collection = "";
		for(var i=0;i<data.loanReviewRecord.length;i++){
			debugger;
			var details =data.loanReviewRecord[i];
			var status=details.reviewStatus;
			var type=data.urgeType[status];
			if(type==null){
				type="电话催收";
			}
		
			var str="<tr>"
				   +"<td>"+(i+1)+"</td>"
			       +"<td>"+details.name+"</td>"
                   +"<td>"+type+"</td>"
			       +"<td>"+details.createdAt+"</td>"
			       +"<td>"+details.reviewConclusion+"</td>"
			       +"</tr>"
          collection=collection+str;
        }
//                        $("#collection tr:last").after(collection);
        $("#collection_tbody").append(collection);
      }});
    $
            .ajax({
              url : "${basePath}/admin/loan/review/recordnew/"+loanId+".html",
              type : "get",
              dataType : "json",
              success : function(data) {
                var count=data.loanReviewRecordSize;
                var repayPlanVocount=data.repayPlanVosize;
                var repayPlanVo="";
                var repayPlanB2bVo="";
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
                //还款计划tab
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
                  html += "<td align='center'>" + record.drunkDrive + "</td>";
                  html += "<td align='center'>" + record.parkCost + "</td>";
                  html += "<td align='center'>" + record.cashdepositFee + "</td>";
                  html += "<td align='center'>" + record.overdueFee + "</td>";
                  html += "<td align='center'>" + record.penaltyFee + "</td>";
                  html += "<td align='center'>" + record.checkCost + "</td>";
                  html += "<td align='center'>" + record.towCost + "</td>";
                  html += "<td align='center'>" + record.repayTotal + "</td>";
//                        html += "<td align='center'>" + record.surplusCapital + "</td>";
                  html += "<td align='center'>" + date + "</td>";
                  html += "</tr>";
                  repayPlanVo=repayPlanVo+html;
                }
                //计算合计金额
                var sum = accAdd(data.repayPlanVo.sumInvest, data.repayPlanVo.sumCaptial);
//						sum = accAdd(sum,data.repayPlanVo.sumManageFee);
                sum = accAdd(sum,data.repayPlanVo.sumGpsFee);
                sum = accAdd(sum,data.repayPlanVo.sumCheckFee);
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
                        + "<td align='center'>" + data.repayPlanVo.sumDepreciationFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumGpsFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumdrunkDrugDrive + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumParkFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumcashdepositFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumOverdueFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumPenaltyFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumCheckFee + "</td>"
                        + "<td align='center'>" + data.repayPlanVo.sumTowCost + "</td>"
                        + "<td align='center'>" + sum.toFixed(2) + "</td>"
                        + "<td align='center'>----</td>"
                        +"</tr>";             
                $("#repayPlanVo tr:last").after(repayPlanVo);
                //总公司还款计划Tab
              	$.each(data.repayPlanB2bVo.planList,function(key,value){
              	   var html = "";
              	   //var date = new Date(record.repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
                   html += "<tr>";
                   html += "<td align='center'>" + value.period + "</td>";
                   html += "<td align='center'>" + value.capital + "</td>";
                   html += "<td align='center'>" + value.interest + "</td>";
                   html += "<td align='center'>" + value.service + "</td>";
                   html += "<td align='center'>" + value.other + "</td>";
                   html += "<td align='center'>" + value.total + "</td>";
                   html += "<td align='center'>" + new Date(value.repaydate).Format("yyyy-MM-dd") + "</td>";
                   html += "</tr>";
                   repayPlanB2bVo=repayPlanB2bVo+html;
              	});
              	repayPlanB2bVo=repayPlanB2bVo+
                 "<tr>" + "<td align='center'>合计：</td>"
                 + "<td align='center'>" + data.repayPlanB2bVo.sumCapital + "</td>"
                 + "<td align='center'>" + data.repayPlanB2bVo.sumInterest + "</td>"
                 + "<td align='center'>" + data.repayPlanB2bVo.sumService + "</td>"
                 + "<td align='center'>" + data.repayPlanB2bVo.sumOther + "</td>"
                 + "<td align='center'>" + data.repayPlanB2bVo.sumTotal + "</td>"
                 + "<td align='center'>----</td>"
                 +"</tr>";             
         		$("#repayPlanB2bVo tr:last").after(repayPlanB2bVo);  
             
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
                    reviewLevel = "待再贷初审";
                  }else if (record.reviewLevel == "helploanAduit"){
                    reviewLevel = "待助贷初审";
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

                $.ajax({
                  url : "/admin/loan/getLoanAfterReviewRecord/" + loanId + ".html",
                  type : "get",
                  dataType : "json",
                  success : function(data) {
                    var count=data.loanReviewRecordSize;
                    var collection1 = "";
                    for(var i=0;i<count;i++){
                      var details =data.loanReviewRecord[i];
                      var reviewstatusstr;
                      reviewstatusstr=data.nameEnums[details.reviewStatus];
					if(reviewstatusstr==null||reviewstatusstr==''){
						reviewstatusstr="通过";
					}
                      //进行还款：repayment  申请续借：renew  完成本次催收：continueRepaymenting 申请逾期处理：overdueHandle
                      //正常还款：commonRepayment  续借还款：continueRepayment  提前还款：advancedRepayment 放弃还款：abandonRepayment
					var reviewAmount="----";
                      if(details.reviewAmount!=null&&details.reviewAmount!=''){
						reviewAmount=details.reviewAmount;
					}
                      var str="<tr>"
                              +"<td>"+details.user.realname+"</td>"
                              +"<td>"+details.reviewname+"</td>"
                              +"<td>"+reviewstatusstr+"</td>"
                              +"<td>"+reviewAmount+"</td>"
                              +"<td>"+details.reviewConclusion+"</td>"
                              +"<td>"+details.createdAt+"</td>"
                              +"</tr>"
                      collection1=collection1+str;
                    }
//                        $("#collection tr:last").after(collection);
                    $("#examineinfo tr:last").after(collection1);
                  }});
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

</script>
</html>
