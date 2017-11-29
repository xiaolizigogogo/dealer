<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<title>工作平台</title>
	<%@include file="../common/taglibs.jsp" %>
	<link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/pagination.css"/>
<style>
td {
	text-align: center;
}
</style>
</head>

<body>
<div class="tools_bar col-lg-12">

  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_name">车行名称</label>
        <input type="text" class="form-control" id="acountName" name = "acountName" placeholder="请输入车行名称">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">车行电话</label>
        <input type="text" class="form-control" id="acountMobile" name = "acountMobile" placeholder="请输入车行电话">
      </div>
    </form>
    <button onclick="initSearch()" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
      	<th>车行名称</th>
        <th>车行电话</th>
        <th>摄像头总数</th>
        <th>车位个数</th>
        <th>库存量</th>
        <th>最高贷款额</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="record">

    </tbody>
  </table>
</div>
<div id="order_modal" class="modal fade in"></div>
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
    
    //跳转设备信息页面需要的参数,通过cookie带值
    function setCookie(id , merchantName){
    	var jumpData = {
			   id: id,
			   merchantName: merchantName
    	}
    	$.cookie('jumpData' , JSON.stringify(jumpData));
    	window.location.href="ac_camera.jsp";
    }
    
    function onLoadDate(param) {
	//获取页面初始数据
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/emi/showMer.html",
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "json",
            success: function(data){
                var list = "";
                var edits;
                if(data.list != null && data.list.length >= 0){
                    for(var i = 0; i < data.list.length; i++){
		            	var paramId = '"' + data.list[i].id + '"';
		            	var paramMerchantName = '"' + data.list[i].merchantName + '"';
                    		if(data.list[i].monInfoListSize > 0){
                    			edits = "<td><a href='#' onclick = 'setCookie(" + paramId + " , " + paramMerchantName + ")' >设备信息</a></td>";
                    		}else{
                    			edits = "<td>尚无设备</td>";
                    		}
                        list += "<tr>"
                             + "<td>" + (data.list[i].merchantName == null ? "" : data.list[i].merchantName) + "</td>"
                             + "<td>" + (data.list[i].mobile == null ? "": data.list[i].mobile) + "</td>"
                             + "<td>" + (data.list[i].monInfoListSize ==null ? "" : data.list[i].monInfoListSize) + "</td>"
                             + "<td>" + (data.list[i].carPortNumber ==null ? "" : data.list[i].carPortNumber) + "</td>"
                             + "<td>" + (data.list[i].merchantSize == null ? "" : data.list[i].merchantSize) + "</td>"
                             + "<td>" + (data.list[i].maximumLoan == null ? "" : data.list[i].maximumLoan) + "</td>"
                             +  edits
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
                $("#record").html(list);
            },error:function(){
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
        return datarequest;
    }
    
    function pageselectCallback1(page_index, jq){
        var param = variable(page_index + 1 , pageSize);
        onLoadDate(param);
        return true;
    }

</script>
</html>