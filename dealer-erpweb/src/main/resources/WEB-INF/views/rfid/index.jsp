<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<title>工作平台</title>
		<%@include file="../common/taglibs.jsp" %>
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/bootstrap/bootstrap.min.css" >
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/bootstrap/bootstrap-table.css">
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/libs/font-awesome.css" />
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/common.css" />
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/selectCity.css" />
		<link rel="stylesheet" type = "text/css" href="${basePath}/css/pagination.css"/>

		<style>
			td {
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="tools_bar col-sm-12">
			<div class="clearfix">
				<form class="form-inline " role="form">
					<div class="form-group">
						<label class="sr-only" for="txt_name">车行名称</label>
						<input type="text" class="form-control" id="acountName" placeholder="请输入车行名称">
					</div>
					<div class="form-group">
						<label class="sr-only" for="txt_tel">车行电话</label>
						<input type="text" class="form-control" id="acountMobile" placeholder="请输入车行电话">
					</div>
					<div class="form-group" style=" position: relative; width: 300px; vertical-align: top;">
					<div>
						<label class="sr-only" for="txt_name">地区选择</label>
						<input type="text" class="form-control" id="sel_city" placeholder="请选择地区" style="width: 400px;"></div>
					</div>
					<div class="form-group">
						<button type = "button" onclick="initSearch()" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
					</div>
				</form>
			</div>
		</div>
		<div class="list_box col-sm-12">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>车行名称</th>
						<th>车行电话</th>
						<th>库存量</th>
						<th>车行地址</th>
						<th>申请时间</th>
						<th>负责人</th>
						<th>账号</th>
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
		  <div id="Pagination" class="pagination pull-right"><!-- 这里显示分页 --></div>
		</div>
		<script src="${basePath}/js/common.js"></script>
		<script src="${basePath}/js/jquery.js"></script>
		<script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
		<script src="${basePath}/js/layer/layer.js"></script>
		<script src="${basePath}/js/tableutils.js"></script>
		<script src="${basePath}/js/jquery.min.js" ></script>
		<script src="${basePath}/js/jquery.cookie.js" ></script>
		<script src="${basePath}/js/jquery.pagination.js" ></script>
		<script src="${basePath}/js/selectCity.js"></script>

<script>
	
    $(function(){
    	$("#sel_city").city();
        init();
    })

    var isInit = 0;
    var pageSize = 15;

    function init(){
        var param = variable(1 , pageSize);
        onLoadDate(param);
    }
    
    function initSearch(){
    	isInit = 0;
        var param = variable(1 , pageSize);
        onLoadDate(param);
    }
    
    function jump(paramId , paramMerchantName){
    	var jumpData = {
 			   dealerId: paramId,
 			   merchantName: paramMerchantName
     	}
     	$.cookie('jumpData' , JSON.stringify(jumpData));
     	window.location.href="xunjian_list.jsp";
    }
    
    function onLoadDate(param) {
    	var load;
	//获取页面初始数据
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/rfid/merchantInfo.html",
			beforeSend : function() {
				load = layer.load();
			},
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "json",
            success: function(data){
            	layer.close(load);
                var list = "";
                if(data.list != null && data.list.length > 0){
                    for(var i = 0; i < data.list.length; i++){
		            	var paramId = '"' + data.list[i].id + '"';
		            	var paramMerchantName = '"' + data.list[i].merchantName + '"';
                        list += "<tr>"
                             + "<td>" + (data.list[i].merchantName == "" ? "-" : data.list[i].merchantName) + "</td>"
                             + "<td>" + (data.list[i].mobile == "" ? "-": data.list[i].mobile) + "</td>"
                             + "<td>" + (data.list[i].repertoryNumber == "" ? "-" : data.list[i].repertoryNumber) + "</td>"
                             + "<td>" + (data.list[i].detailedAddress == "" ? "-" : data.list[i].detailedAddress) + "</td>"
                             + "<td>" + (data.list[i].applyDate == "" ? "-" : data.list[i].applyDate) + "</td>"
                             + "<td>" + (data.list[i].realName == "" ? "-" : data.list[i].realName) + "</td>"
                             + "<td>" + (data.list[i].accountName == "" ? "-" : data.list[i].accountName) + "</td>"
                             + "<td><a href='#' onclick = 'jump(" + paramId + " , " + paramMerchantName + ")' >巡检信息</a></td>";
                             + "</tr>";
                    }
                }
                $("#total").html("共" + data.total + "条记录");
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
            	layer.close(load);
                layer.msg("系统错误");
            }
        });
    }
    
    function variable(pageNum,pageSize){
        var datarequest={};
        datarequest['pageNum'] = pageNum;
        datarequest['pageSize'] = pageSize;
        datarequest['acountName'] = $("#acountName").val();
        datarequest['acountMobile'] = $("#acountMobile").val();
        datarequest['address'] = $("#sel_city").val();
        return datarequest;
    }
    
    function pageselectCallback1(page_index, jq){
        var param = variable(page_index + 1 , pageSize);
        onLoadDate(param);
        return true;
    }

</script>
	</body>

</html>