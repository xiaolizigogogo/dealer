<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>工作平台</title>
		<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
		<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/pagination.css"/>
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
				<li>
					<a href="index.html">RFID监管车行列表</a>
				</li>
				<li>
					<a href="xunjian_list.html" id="dealerName"></a>
				</li>
				<li class="active">巡检车辆信息</li>
			</ol>
			<div class="clearfix">
				<form class="form-inline " role="form">
					<div class="form-group">
						<label class="sr-only" for="txt_name">车牌号码</label>
						<input type="text" class="form-control" id="plateNumber" placeholder="请输入车牌号码">
					</div>
					<div class="form-group">
						<select class="form-control" id="carPatrolState">
							<option value="" selected disabled>巡检状态</option>
							<option value="1">正常</option>
							<option value="2">异常</option>
							<option value="">全部</option>
							</select>
					</div>
					<div class="form-group">
						<button  onclick="initSearch()" type="button" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>

					</div>
				</form>
			</div>
		</div>
		<div class="list_box col-sm-12">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>车牌号</th>
					<%--	<th>品牌车型</th>--%>
						<th>开始巡检时间</th>
						<th>结束巡检时间</th>
						<th>巡检状态</th>
						<%--<th>巡检人</th>--%>
						<th>备注</th>
					</tr>
				</thead>
				<tbody id="col-list">

				</tbody>
			</table>
			<!--<div class="loading"></div>-->

		</div>
		<div class="clearfix col-sm-12">
			<div id="total" class="pull-left"></div>
			<div id="Pagination" class="pagination pull-right"><!-- 这里显示分页 --></div>
		</div>
	</body>
	<script src="${basePath}/js/common.js"></script>
	<script src="${basePath}/js/jquery.js"></script>
	<script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
	<script src="${basePath}/js/layer/layer.js"></script>
	<script src="${basePath}/js/tableutils.js"></script>
	<script src="${basePath}/js/jquery.min.js" ></script>
	<script src="${basePath}/js/jquery.cookie.js" ></script>
	<script src="${basePath}/js/jquery.pagination.js" ></script>

	<script>
		$(function(){

			var jumpData = $.cookie('jumpData');
			jumpData = JSON.parse(jumpData);
			$("#dealerName").text(jumpData.merchantName + "巡检信息");
			init();
		})

		var isInit = 0;
		var pageSize = 15;

		function init(){
			var param =variable(1,pageSize);
			onLoadDate(param);
		}

		function initSearch(){
			isInit = 0;
			var param =variable(1,pageSize);
			onLoadDate(param);
		}

		function onLoadDate(param) {
			//获取页面初始数据
			$.ajax({
				type: 'post',
				url: "${basePath}/admin/rfid/RfidPatrolRecord",
				data: JSON.stringify(param),
				contentType:"application/json",
				dataType: "json",
				success: function(data){
					var list = "";
					var edits;
					if(data.list != null && data.list.length >= 0){
						for(var i = 0; i < data.list.length; i++){
							debugger;
							list += "<tr>"
								+ "<td>" + (data.list[i].plateNumber == null ? "" : data.list[i].plateNumber) + "</td>"
								+ "<td>" + (data.list[i].patrolStartTime == null ? "": data.list[i].patrolStartTime) + "</td>"
								+ "<td>" + (data.list[i].patrolEndTime ==null ? "" : data.list[i].patrolEndTime) + "</td>"
								+ "<td>" + (data.list[i].carPatrolState ==1 ? "<span class='label label-success'>正常</span>" : "<span class='label label-danger'>异常</span>") + "</td>"
								+ "<td>" + (data.list[i].failureReason == null ? "" : data.list[i].failureReason) + "</td>"
								+ "</tr>";
					}
					}
					$("#total").html("共"+data.total+"条记录");
					if(isInit == 0){
						isInit = 1 ;
						initPagination = function() {
							// 创建分页
							$("#Pagination").pagination(data.total, {
								num_edge_entries: 1, //边缘页数
								num_display_entries: 6, //主体页数
								callback: pageselectCallback1,
								items_per_page: pageSize //每页显示1项
							});
						}();
					}
					$("#col-list").html(list);
				},error:function(){
					layer.msg("系统错误");
				}
			});
		}

			//获取url参数值
		function GetQueryString(name)
		{
			var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if(r!=null)return  unescape(r[2]); return null;

		}

		function variable(pageNum,pageSize){
			debugger;
			var datarequest={};
			datarequest['pageNum'] = pageNum;
			datarequest['pageSize'] = pageSize;
			datarequest['acountId'] = GetQueryString("dealerId");
			datarequest['plateNumber'] = $("#plateNumber").val();
			datarequest['carPatrolState'] = $("#carPatrolState").val();
			return datarequest;
		}

		function pageselectCallback1(page_index, jq){
			var param = variable(page_index + 1 , pageSize);
			onLoadDate(param);
			return true;
		}

	</script>
</html>
