<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统</title>
    <%@include file="../common/taglibs.jsp" %>
<%--     <link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap/bootstrap.min.css"/> --%>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${basePath}/css/index.css"/>

    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <![endif]-->
    <script type="text/javascript">
        $(document).ready(function () {
	$("#weizhang").click(function () {
	  			window.parent.TabControlAppend('37', '违章记录查询', '/admin/loan/weizhang.jsp');
            });
        	$.ajax({
    		url:"${basePath}/admin/loan/queryNewTaskNew",
    		type:"get",
    		datatype:"json",
    		success:function(data){

    		    if (data!=0){
    			var count="<a href='/admin/loan/agency.html?category=1'>"+ data + "</a> ";
    			$("#count").html(count);
    			}else{
    			var count="<a href='#'>"+ data + "</a> "
    			$("#count").html(count);
    			}
    		}})
    		$.ajax({
    		url:"${basePath}/admin/loan/queryAgencyCountNew",
    		type:"get",
    		datatype:"json",
    		success:function(data){
    			if (data!=0){
    			var count="<a href='/admin/loan/agency.html?category=0'>"+ data + "</a> ";
    			$("#agencycount").html(count);
    			}else{
    			var count="<a href='#' >"+ data + "</a> ";
    			$("#agencycount").html(count);
    			}
    		}})
        	

            /* 代办 */
            $.post("${basePath}/admin/toRemind.html?uuid=${sessionScope.auth_user.uuid}",
                    function (msg) {
                        $("#repayPlanCount").text(msg.repayCount);
                        $("#todoList").text(msg.totalCount);
                    });

            /*今日需还款笔数*/
            $.post("${basePath}/admin/queryRepaymentCount.html?type=0", function (msg) {
                var json = eval("(" + msg + ")");
                $("#todayCount").text(json);
            });

            /*近三日需还款笔数*/
            $.post("${basePath}/admin/queryRepaymentCount.html?type=2", function (msg) {
                $("#threeCount").text(msg);
            });

            /*近五日需还款笔数*/
            $.post("${basePath}/admin/queryRepaymentCount.html?type=4", function (msg) {
                $("#fiveCount").text(msg);
            });


            /*获取当前分公司下的会员总数*/
            $.post("${basePath}/admin/queryUserCount", function (msg) {
                $("#userCount").text(msg);

            });

            $.post("${basePath}/admin/queryPlatFormInfo.html", function (msg) {
                var json = eval("(" + msg + ")");
                $("#yesterday_add_cus").text(json.yestdAddCustomer);
                $("#yesterday_add_loan_count").text(json.yestdAddLoanCount);
                $("#yesterday_add_loan_money").text(json.yestdAddLoanMoney);
                $("#month_new_loan_count").text(json.monthLoanCount);
                $("#month_new_loan_money").text(json.monthLoanMoney);
            });
        });

        function refreshData(){
        window.location.reload();
        }
    </script>
</head>

<body> 
<div id="order_modal" class="modal fade in"></div>
<div class="main_box01 clearfix" >
  <div class="col-sm-4 ">
    <dl  class="dl-horizontal">
      <dt><i class="fa fa-file-text"></i></dt>
      <dd>
        <dl class="dl-horizontal">
          <dt>今日新增任务</dt>
          <dd><a href="/admin/loan/agency.html?category=1" id="count"  class="J_menuItem"></a>件</dd>
          <dt>待办任务</dt>
          <dd><a href="#" id="agencycount" ></a>件</dd>
         
        </dl>
      </dd>
    </dl>
  </div>
  <div class="col-sm-4">
    <dl  class="dl-horizontal">
      <dt><i class="fa fa-bell"></i></dt>
      <dd>
        <dl class="dl-horizontal">
          <dt>今日新增提醒</dt>
          <dd><a href="#">0</a> 件</dd>
          <dt>未查看提醒</dt>
          <dd><a href="#">0</a> 件</dd>
          <dt>提醒历史</dt>
          <dd><a href="#">0</a> 件</dd>
        </dl>
      </dd>
    </dl>
  </div>
  <div class="col-sm-4">
    <dl  class="dl-horizontal ">
      <dt><i class="fa  fa-exclamation-triangle"></i></dt>
      <dd>
        <dl class="dl-horizontal">
          <dt>今日新增警告</dt>
          <dd><a href="#">0</a> 件</dd>
          <dt>未查看警告</dt>
          <dd><a href="#">0</a> 件</dd>
          <dt>警告历史</dt>
          <dd><a href="#">0</a> 件</dd>
        </dl>
      </dd>
    </dl>
  </div>
</div>
<div class="main_box02">
  <h2>常用工具</h2>
  <ul class=" list-inline">
    <li><a href="#" id="weizhang" > <i class="fa fa-search"></i><br/>
      违章记录查询</a></li>
    <li><a href="http://www.che300.com/pinggu?from=bd_seo"  target="_blank" ><i class="fa fa-edit"></i><br/>
      车辆评估</a></li>
    <li><a href="http://www.laolai007.com/"  target="_blank" ><i class="fa  fa-shield"></i><br/>
      征信查询</a></li>
     <li><a href = "javascript:void(0)" onclick="opendiv('qr_box')" id="bad_info"><i class="fa fa-bolt"></i><br/>
      不良信息核查</a></li>
      <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" id="shesu" ><i class="fa  fa-compass"></i><br/>
      涉诉精准查询</a></li>
      <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" id="blacklist"><i class="fa fa-exclamation-circle"></i><br/>
      失信黑名单</a></li>
      <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" id="bankcard"><i class="fa fa-credit-card"></i><br/>
      银行卡验证</a></li>
      <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" ><i class="fa fa-file-text"></i><br/>
      个人报告</a></li>
      <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" ><i class="fa fa-car"></i><br/>
      车辆信息查询</a></li>
       <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" id="driving_licence" ><i class="fa fa-tasks"></i><br/>
      驾驶证查询</a></li>
       <li><a href="javascript:void(0)" onclick="opendiv('qr_box')" id="xingshizheng"><i class="fa fa-folder-open"></i><br/>
      行驶证查询</a></li>
  </ul>
</div>
<div> 
		
</div>
<div id="qr_box" class="modal modal_sml fade in">
  <div class="modal-header"> <a  type="button" href = "javascript:void(0)" onclick = "colsediv(0)"  class="close" ><span aria-hidden="true">&times;</span></a>
    <h4 class="modal-title" id="myModalLabel" style="font-size:16px;">提示</h4>
  </div>
  <div class="modal-body" >
    <dl class="dl-horizontal p_tip" >
      <dt><i class="fa fa-exclamation-triangle text-warning"></i></dt>
      <dd>
        <p class="p_tip p_single" style="line-height:20px;"> 数据正在对接中！<br/>微信端已上线，欢迎使用！</p>
      </dd>
    </dl>
    <div class="btn_list clearfix"><a class="btn btn-danger btn-sm" href="javascript:void(0)" onclick = "colsediv(0)" >确定</a></div>
  </div>
</div>
<div id="fade2" class="black_overlayx"> </div>
</body>
<script type="text/javascript" src="${basePath}/js/jquery.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap.js"></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script type="text/javascript" src="${basePath}/js/scripts.js"></script>
<script type="text/javascript" src="${basePath}/js/pace.min.js"></script>
<script type="text/javascript" src="${basePath}/js/contabs.min.js"></script>
</html>
