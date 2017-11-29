<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>工作平台</title>
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
        <label class="sr-only" for="srch_company">经销商名称</label>
        <input type="text" class="form-control" id="srch_company" placeholder="请输入经销商名称">
      </div>
      <div class="form-group">
        <label class="sr-only" for="srch_bankNumber">卡号</label>
        <input type="text" class="form-control" id="srch_bankNumber" placeholder="卡号">
      </div>
      <%--<div class="form-group">
        <select class="form-control" id="txt_review">
          <option value="3">全部</option>
          <option value="0"> 未审核</option>
          <option value="1"> 审核通过</option>
          <option value="2">审核未通过</option>
        </select>
      </div>--%>
      <button type="button"  onclick="select()" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>经销商名称</th>
      <th>开户行</th>
      <th>账号</th>
      <th>创建日期</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody id="record">

    </tbody>
  </table>
  <div class="clearfix col-sm-12">
    <div id="total" class="pull-left"></div>
    <div id="Pagination" class="pagination pull-right"><!-- 这里显示分页 --></div>
  </div>

</div>
<div id="merchant_modal" class="modal fade in"></div>
<!--获取车商id  -->
<input type="hidden" value=""  id="accountId"/>
<!--获取车商申请表自增id  -->
<input type="hidden" value=""  id="applyId"/>
<!--获取用户选择的状态  -->
<input type="hidden" value=""  id="status_select" />
</body>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${basePath}/js/layer/layer.js"></script>
<script src="${basePath}/js/tableutils.js"></script>
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
  function onLoadDate(param) {
    debugger;
//获取页面初始数据
    $.ajax({
      type: 'post',
      url: "/admin/bank/queryMerchantBankCardList",
      data: JSON.stringify(param),
      contentType:"application/json",
      dataType: "json",
      success: function(data){
        debugger;
        $("#total").html("共"+data.sum+"条记录");
        if(isInit == 0){
          isInit = 1;
          initPagination = function() {
            // 创建分页
            $("#Pagination").pagination(data.sum, {
              num_edge_entries: 1, //边缘页数
              num_display_entries: 6, //主体页数
              callback: pageselectCallback,
              items_per_page:pageSize //每页显示1项
            });
          }();
        }
        var list = "";
        var caozuo = "";
        for(var i = 0; i <data.result.length;i++){
          caozuo="<td><a href='#' onclick='customerDetails(this)' id="+data+">查看 </a>"+
          " <a href='#' onclick='deleteOne(this)' applyId="+data.result[i].id+">删除</a>"
          +"</td>";
          list+="<tr>"
                  + "<td>"+data.result[i].merchantName+"</td>"
                  + "<td>"+data.result[i].cardtype+"</td>"
                  + "<td>"+data.result[i].banknumber+"</td>"
                  + "<td>"+data.result[i].createddata+"</td>"
                  + caozuo+"</tr>";
        }
        $("#record").html(list);
      },error:function(){
        layer.msg("系统错误！");
      }
    });
  }
  function variable(pageNum,pageSize){
    var datarequest={};
    datarequest['pageNum'] = pageNum;
    datarequest['pageSize'] = pageSize;
    datarequest['merchantName']=$("#srch_company").val();
    datarequest['bankNumber']=$("#srch_bankNumber").val();
    return datarequest;
  }
  function select() {
    //清空隐藏域的值
    $("#status_select").val("");
    isInit=0;
    var param =variable(1,pageSize);
    onLoadDate(param);
  }

  function pageselectCallback(page_index, jq){
    var param = variable(page_index+1,pageSize);
    onLoadDate(param);
    return true;
  }
  function deleteOne(obj){
	  var applyId=$(obj).attr("applyId");
	  layer.confirm("你确定删除吗？", {icon: 3, title: '提示'}, function () {
	  $.ajax({
	      type: 'post',
	      url: "${basePath}/admin/delete/bankCard/"+applyId,
	      dataType: "text",
	      async:false,
	      success: function(data){
	    	  if(data=="-2"){
	    		  layer.alert("没有权限");
	    		  return;
	    	  }
			if(data!="-1"){
				layer.confirm("操作成功", {icon: 3, title: '操作成功'}, function () {
				 window.location.reload();
			});
			}
			else{
				layer.msg("操作失败");	
			}
	      },error:function(){
	        layer.msg(" 操作失败！");
	      }
	    });
	  });
  }
</script>
</html>
