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
		<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/selectCity.css" />
		<link rel="stylesheet" type="text/css" href="${basePath}/css/pagination.css"/>
		<script src="${basePath}/js/jquery.js"></script>
		<script src="${basePath}/js/layer/layer.js"></script>
		<script src="${basePath}/js/jquery.pagination.js" ></script>
		<script type="text/javascript" src="${basePath}/js/selectCity.js"></script>
		<script src="${basePath}/js/jquery.cookie.js" ></script>
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
						<input type="text" class="form-control" id="txt_company" placeholder="请输入车行名称">
					</div>
					<div class="form-group" style=" position: relative; width: 300px; vertical-align: top;">
						<div>
							<label class="sr-only" for="txt_name">地区选择</label>
							<input type="text" class="form-control" id="sel_city" placeholder="请选择地区" style="width: 400px;"></div>
					</div>
					<div class="form-group">
						<button type="button" onclick="initSearch()" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
						<a class="btn btn-danger" id="fp_btn">分配线下人员</a>
					</div>
				</form>
			</div>
		</div>
		<div class="list_box col-sm-12">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th width="80" style="text-align: left;"><input type="checkbox" id="all" /> 全选</th>
						<th>车行名称</th>
						<th>车行电话</th>
						<th>车辆总数</th>
						<th>车行地址</th>
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

		        <!--获取车行列表的信息 -->
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
    
    function onLoadDate(param) {
	//获取页面初始数据
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/carDistribution/getMerchantInfo",
            data: JSON.stringify(param),
            contentType:"application/json",
            dataType: "json",
            success: function(data){
                var list = "";
                var edits;
                if(data!= null && data.length >= 0){
                    for(var i = 0; i < data.length; i++){
                    	if(data[i].merchantName!=null){
                        list += '<tr>'
                        	+'<td style="text-align: left;"><input date-locationNotSplit='+data[i].locationNotSplit+' type="checkbox" data-name="'+data[i].acountid+'"/></td>'
    						+'<td>'+data[i].merchantName+'</td>'
    						+'<td>'+data[i].merchantPhone+'</td>'
    						+'<td><span class="badge badge-danger">'+data[i].repertoryNumber+'</span></td>'
    						+'<td>'+data[i].location+'</td>'
                            +'</tr>';
                            }
                    }
                }
                if(isInit == 0){
                    isInit = 1 ;
                    initPagination = function() {
                        // 创建分页
                        $("#Pagination").pagination(data[0].total, {
                            num_edge_entries: 1, //边缘页数
                            num_display_entries: 6, //主体页数
                            prev_text: "« 上一页",
                            next_text: "下一页 »",
                            callback: pageselectCallback1,
                            items_per_page: pageSize //每页显示1项
                        });
                    }();
                }
                $("#col-list").html(list);
                $("#total").html("共" + data[0].total + "条记录");
            },error:function(){
                layer.msg("系统错误");
            }
        });
    }
    
    function pageselectCallback1(page_index, jq){
        var param = variable(page_index + 1 , pageSize);
        onLoadDate(param);
        return true;
    }  
    
    function variable(pageNum,pageSize){
        var datarequest={};
        datarequest['pageNum'] = pageNum;
        datarequest['pageSize'] = pageSize;
        datarequest['selCity'] = $("#sel_city").val();
        datarequest['merchantName'] = $("#txt_company").val();
        return datarequest;
    }
    
    function pageselectCallback1(page_index, jq){
        var param = variable(page_index + 1 , pageSize);
        onLoadDate(param);
        return true;
    }

</script>
		 <script>
			$("#sel_city").city();
			$("#all").click(function() {
				if($(this).prop("checked") == true) {
					$("#col-list input[type='checkbox']").prop("checked", true);
				} else {
					$("#col-list input[type='checkbox']").prop("checked", false);
					$(this).find()
				}
			});
			$("#fp_btn").click(function() {
				
				var ckLength = $("#col-list input[type='checkbox']:checked").length;
				var arrbox=[];
				var arrLocation=[];
				for(var index=0;index<ckLength;index++){
					arrbox.push($("#col-list input[type='checkbox']:checked").eq(index).attr('data-name'))
				}
				for(var index=0;index<ckLength;index++){
					arrLocation.push($("#col-list input[type='checkbox']:checked").eq(index).attr('date-locationNotSplit'))
				}
				arrLocation.sort();
				if(arrLocation[arrLocation.length-1]!=arrLocation[0]){
					layer.msg("请选择相同地理位置车行的数据");
					 return false;
				}
				var location =$("#col-list input[type='checkbox']:checked").eq(0).attr('date-locationNotSplit');
				$.cookie('editValue' ,  JSON.stringify(arrbox));
				$.cookie('location'  ,  JSON.stringify(location));
				console.log(arrbox)
				if(ckLength > 0) {
					var index = layer.open({
						type: 2,
						title: '<h4>分配线下人员</h4>',
						content: 'rfid_modal.jsp?'+arrbox,
						area: ['600px', '220px'],
						end: function(){
// 							window.location.reload();
						}
					});
				} else {
					layer.alert("至少要选择一个车行！")
				}
			})
		</script> 
</body>
</html>