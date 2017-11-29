<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>工作平台</title>
<link href="${basePath}/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${basePath}/css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/libs/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/dateRange.css" />
<link rel="stylesheet" type="text/css"
	href="${basePath}/css/pagination.css" />

<script src="${basePath}/js/jquery.min.js"></script>

<style>
td {
	text-align: center;
}
</style>
</head>

<body>

	<div class="tools_bar col-sm-12">
		<ol class="breadcrumb">
			<li><a href="index.html">RFID监管车行列表</a></li>
			<li class="active" id="merchantNameDiv"></li>
		</ol>
		<div class="clearfix">
			<form class="form-inline " role="form">
				<div class="form-group">
					<label class="sr-only" for="txt_name">巡检时间段</label>
					<div class="ta_date" id="div_date1">
						<span class="date_title" id="date1"></span> <a class="opt_sel"
							id="input_trigger1" href="#"> <i class="i_orderd"></i>
						</a>
					</div>
					<div id="datePicker1"></div>

				</div>

				<div class="form-group">
					<button type="button" onclick="initSearch()"
						class="btn btn-primary btn-search" id="btn-submit">
						<i class="fa fa-search"></i> 搜索
					</button>

				</div>
			</form>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>开始巡检时间</th>
					<th>结束巡检时间</th>
					<th>本次巡检总车辆</th>
					<th>巡检状态</th>
					<th>巡检人</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody id="col-list">

			</tbody>
		</table>
		<!--<div class="loading"></div>-->

	</div>
	<div class="clearfix col-sm-12">
		<div id="total" class="pull-left"></div>
		<div id="Pagination" class="pagination pull-right">
			<!-- 这里显示分页 -->
		</div>
	</div>

	<div id="pagination"></div>

	<script src="${basePath}/js/jquery.js"></script>
	<script src="${basePath}/js/layer/layer.js"></script>
	<script src="${basePath}/js/jquery.min.js"></script>
	<script src="${basePath}/js/jquery.cookie.js"></script>
	<script src="${basePath}/js/jquery.pagination.js"></script>

	<script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
	<script>
		$(function() {
			//时间插件
			var dateRange1 = new pickerDateRange('date1', {
				isTodayValid : true,
				startDate : '请选择巡检时间段',
				endDate : '',
				autoSubmit : false,
				inputTrigger : 'input_trigger1',
				theme : 'ta',
				success : function(obj) {
					$("#dCon2").html(
							'开始时间 : ' + obj.startDate + '<br/>结束时间 : '
									+ obj.endDate);
					$("#startDate").val(obj.startDate);
					$("#endDate").val(obj.endDate);
				},
				clear : function() {
					$("#date1").html("请选择巡检时间段");
					$("#startDate").val(null);
					$("#endDate").val(null);
				}
			});
			//获取cookie数据作为全局变量
			var jumpData = $.cookie('jumpData');
			jumpData = JSON.parse(jumpData);
			var merchantName = jumpData.merchantName;
			$("#merchantNameDiv").text(merchantName + "巡检信息");
			var dealerId = jumpData.dealerId;
			init();
		})

		var isInit = 0;
		var pageSize = 15;

		function init() {
			var param = variable(1, pageSize);
			onLoadDate(param);
		}

		function initSearch() {
			isInit = 0;
			var param = variable(1, pageSize);
			onLoadDate(param);
		}

		function onLoadDate(param) {
			var load;
			//获取页面初始数据
				$.ajax({
						type : "POST", //提交方式 
						url : "${basePath}/admin/carInspection/supervisionsList",//路径
						beforeSend : function() {
							load = layer.load();
						},
						data : JSON.stringify(param),
						contentType : "application/json",
						dataType : "json",
						success : function(result) {
							layer.close(load);
							var list = "";
							if (result.list != null && result.list.length >= 0) {
								for (var i = 0; i < result.list.length; i++) {									
									if (result.list[i].patrolAccountId == "noUserRecord") {
										result.list[i].patrolAccountId = ""
									}
									list += "<tr>"
											+ "<td>"
											+ (result.list[i].patrolStartTime == null ? ""
													: result.list[i].patrolStartTime)
											+ "</td>"
											+ "<td>"
											+ (result.list[i].patrolEndTime == null ? ""
													: result.list[i].patrolEndTime)
											+ "</td>"
											+ "<td>"
											+ (result.list[i].patrolCarCounts == null ? ""
													: result.list[i].patrolCarCounts)
											+ "</td>"
											+ "<td>"
											+ (result.list[i].dealePatrolState == 1 ? "<span class='label label-success'>正常</span>"
													: "<span class='label label-danger'>异常</span>")
											+ "</td>"
											+ "<td>"
											+ (result.list[i].patrolAccountId == null ? ""
													: result.list[i].patrolAccountId)
											+ "</td>"
											+ "<td><a href = 'car_list.jsp?dealerId="
											+ result.list[i].patrolId
											+ "'>车辆信息</a></td>" + "</tr>";
								}

							}
							$("#total").html("共" + result.total + "条记录");
							if (isInit == 0) {
								isInit = 1;
								initPagination = function() {
									// 创建分页
									$("#Pagination").pagination(result.total, {
										num_edge_entries : 1, //边缘页数
										num_display_entries : 6, //主体页数
										callback : pageselectCallback1,
										items_per_page : pageSize
									//每页显示1项
									});
								}();
							}
							$("#col-list").html(list);
						},
						error : function() {
							layer.close(load);
							layer.msg("系统错误");
						}
					});
			}

		function variable(pageNum, pageSize) {
			var datarequest = {};
			var jumpData = $.cookie('jumpData');
			jumpData = JSON.parse(jumpData);
			var dealerId = jumpData.dealerId;
			datarequest['pageNum'] = pageNum;
			datarequest['pageSize'] = pageSize;
			datarequest['dealerId'] = dealerId;

			var timeAll = $(".date_title").text();
			var reg = new RegExp("-", "g");
			var patrolStartTime = "";
			var patrolEndTime = "";

			if (timeAll == "请选择巡检时间段") {
				
				patrolStartTime = new Date().toLocaleString().substring(0, 10)
						+ " 00:00:00";
				patrolEndTime = new Date().toLocaleString().substring(0, 10)
						+ " 23:59:59";
				datarequest['patrolStartTime'] = patrolStartTime;
				datarequest['patrolEndTime'] = patrolEndTime;
				$("#date1").text(new Date().toLocaleString().substring(0, 10));
			} else {
				
				var today = new Date().toLocaleString().substring(0, 10);
				
				if(timeAll == today){
					
					patrolStartTime = new Date().toLocaleString().substring(0, 10)
					+ " 00:00:00";
					patrolEndTime = new Date().toLocaleString().substring(0, 10)
							+ " 23:59:59";
					datarequest['patrolStartTime'] = patrolStartTime;
					datarequest['patrolEndTime'] = patrolEndTime;
					$("#date1").text(new Date().toLocaleString().substring(0, 10));
				}else{
				
					patrolStartTime = timeAll.substring(0, 10).replace(reg, "/")
					+ " 00:00:00";
					patrolEndTime = timeAll.substring(13).replace(reg, "/")
							+ " 23:59:59";
					
					datarequest['patrolStartTime'] = patrolStartTime;
					datarequest['patrolEndTime'] = patrolEndTime;
				}
				
			}
			
			return datarequest;
		}

		function pageselectCallback1(page_index, jq) {
			var param = variable(page_index + 1, pageSize);
			onLoadDate(param);
			return true;
		}
	</script>
</body>

</html>