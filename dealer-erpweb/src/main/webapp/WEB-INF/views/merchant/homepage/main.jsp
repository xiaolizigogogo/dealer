<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>工作平台</title>
<link href="${basePath}/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
<link href="${basePath}/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/index.css"/>


</head>

<body>
<div class="main_box01 clearfix" >
  <div class="col-sm-4 ">
    <dl  class="dl-horizontal">
      <dt><i class="fa fa-file-text"></i></dt>
      <dd>
        <dl class="dl-horizontal">
          <dt>待办任务</dt>
          <dd><span id = "daitask"></span> 件</dd>
         
        </dl>
      </dd>
    </dl>
  </div>
</div>
<div class="main_box02" id="layer_notice">
  <h2>常用工具</h2>
  <ul class=" list-inline">
    <li><a href="#" id="weizhang"> <i class="fa fa-search"></i><br/>
      违章记录查询</a></li>
    <li><a href="http://www.che300.com/pinggu?from=bd_seo"  target="_blank" ><i class="fa fa-edit"></i><br/>
      车辆评估</a></li>
    <li><a href="http://www.laolai007.com/"  target="_blank" ><i class="fa  fa-shield"></i><br/>
      征信查询</a></li>
      <li><a href="#" id="bad_info"><i class="fa fa-bolt"></i><br/>
      不良信息核查</a></li>
      <li><a href="#" id="shesu" ><i class="fa  fa-compass"></i><br/>
      涉诉精准查询</a></li>
      <li><a href="#" id="blacklist"><i class="fa fa-exclamation-circle"></i><br/>
      失信黑名单</a></li>
      <li><a href="#" id="bankcard"><i class="fa fa-credit-card"></i><br/>
      银行卡验证</a></li>
      <li><a href="#" ><i class="fa fa-file-text"></i><br/>
      个人报告</a></li>
      <li><a id="car_info"><i class="fa fa-car"></i><br/>
      车辆信息查询</a></li>
       <li><a href="#" id="driving_licence" ><i class="fa fa-tasks"></i><br/>
      驾驶证查询</a></li>
       <li><a href="#" id="xingshizheng"><i class="fa fa-folder-open"></i><br/>
      行驶证查询</a></li>
  </ul>
</div>
<div> 
	
</div>
</body>
<script type="text/javascript" src="${basePath}/js/jquery.js"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap.js"></script>
<script type="text/javascript" src="${basePath}/js/pace.min.js"></script>
<script type="text/javascript" src="${basePath}/js/tab-control.js"></script>

<script type="text/javascript">
/* ;!function(){

    //使用相册
    parent.layer.photos({
        photos: '#p1'
    });

//关于

}(); */


	(function($){
	    
	    $.getJSON("${basePath}/admin/count/new",function(result){
	    	$("#daitask").html(result.daicount);
	    });
	})(jQuery); 

  $("#jr_rw").click(function () {
	  			window.parent.TabControlAppend('16', '今日新增任务', 'task.html');
            });
 $("#jr_tx").click(function () {
	  			window.parent.TabControlAppend('30', '今日新增提醒', 'remind.html');
            });
			 $("#weizhang").click(function () {
	  			window.parent.TabControlAppend('31', '违章查询', 'weizhang.html');
            });
			$("#today_warning").click(function () {
	  			window.parent.TabControlAppend('32', '今日警告', 'today_warning.html');
            });
			$("#history_warning").click(function () {
	  			window.parent.TabControlAppend('33', '历史警告', 'history_warning.html');
            });
$("#bad_info").click(function () {
	  			window.parent.TabControlAppend('34', '不良信息核查', 'query/bad_info.html');
            });
			$("#shesu").click(function () {
	  			window.parent.TabControlAppend('35', '涉诉精准查询', 'query/shesu.html');
            });
			$("#blacklist").click(function () {
	  			window.parent.TabControlAppend('36', '失信黑名单', 'query/blacklist.html');
            });
			$("#bankcard").click(function () {
	  			window.parent.TabControlAppend('37', '银行卡验证', 'query/bankcard.html');
            });
				$("#car_info").click(function () {
	  			window.parent.TabControlAppend('38', '车辆信息查询', 'query/car_info.html');
            });
			$("#driving_licence").click(function () {
	  			window.parent.TabControlAppend('39', '驾驶证查询', 'query/driving_licence.html');
            });
			$("#xingshizheng").click(function () {
	  			window.parent.TabControlAppend('40', '行驶证证查询', 'query/xingshizheng.html');
            });
			
</script>

</html>
