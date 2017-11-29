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
    p{
      margin-bottom: 0 !important;
    }
    .a_btn{
      display: block;
      height: 29px;
      line-height: 33px;
    }
  </style>
</head>

<body>
<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix" style="padding-bottom:15px;overflow: hidden;">
    <p class="col-sm-2" style="color: red"><span class="a_btn">监管列表</span></p>
    <p class="col-sm-2" style="float: right"><button type="submit" onclick="search(2)" class="btn btn-danger btn-block"  >已解除监管</button></p>
    <p class="col-sm-2" style="float: right"><button type="submit"  onclick="search(1)" class="btn btn-danger btn-block">监管中</button></p>

  </div>
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_company">经销商名称</label>
        <input type="text" class="form-control" id="txt_company" placeholder="车行名，姓名">
      </div>
      <button type="button"  onclick="init($('#txt_company').val())" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>借款人</th>
      <th>车行名称</th>
      <th>联系电话</th>
      <th>在押车数量</th>
      <th>总借款额度</th>
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
<!--获取任务id-->
<input type="hidden" value=""  id="taskId" />
<!--用于传递用户选择状态-->
<input type="hidden" id="status_select" />
<!--获取任务名字-->
<input type="hidden" value=""  id="taskName" />
<!--获取车辆ID-->
<input type="hidden" value=""  id="productId" />
<!--获取车牌号-->
<input type="hidden" value=""  id="plateNumber" />
<!--获取订单ID  -->
<input type="hidden" value=""  id="indentId"/>
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
    function search(obj){
        debugger;
        var param =variable(1,pageSize);
        param['regulationType'] = obj;
        onLoadDate(param);
    }

    function init(name){
        debugger;
        var param =variable(1,pageSize);

            param['merchantName'] = name;

        onLoadDate(param);
    }
    function onLoadDate(param) {
//获取页面初始数据
        $.ajax({
            type: 'post',
            url: "/admin/supervise/supervisionsList/",
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
                            callback: pageselectCallback1,
                            items_per_page:pageSize //每页显示1项
                        });
                    }();
                }
                var list="";
                var caozuo;
                var value;
                if(data.supervisions!=null&&data.supervisions.length>=0){
                    for(var i = 0; i <data.supervisions.length;i++){
                    	var paramMerchantName = '"' + data.supervisions[i].merchantName + '"';
                        debugger;
                        caozuo="<td><a href='#' onclick='customerDetails(this)' id="+data.supervisions[i].acountId+" >详情</a></td>"
                      /* value=data.supervisions[data.result[i].id].name;*/
                        list+=  "<tr>"
                            +"<td>"+(data.supervisions[i].realName==null?"-":data.supervisions[i].realName)+"</td>"
                            +"<td>"+(data.supervisions[i].merchantName==null?"-":data.supervisions[i].merchantName)+"</td>"
                            +"<td>"+(data.supervisions[i].mobile==null?"-":data.supervisions[i].mobile)+"</td>"
                            +"<td><a href = '#' onclick = 'jumpView(" + paramMerchantName + ")'>"+(data.supervisions[i].totalIndent==null?"-":data.supervisions[i].totalIndent)+"</a></td>"
                            +"<td>"+(data.supervisions[i].stockNumber==null?"-":data.supervisions[i].stockNumber)+"</td>"
                            +caozuo+"</tr>";
                    }
                }
                $("#record").html(list);
            },error:function(){
                layer.msg("系统错误！");
            }
        });
    }
    function assignment(obj,pageNum){
        isInit=0;
        debugger;
        $("#status_select").val($(obj).attr("id"));
        var param=variable(1,pageSize);
        onLoadDate(param);
    }
    
    function jumpView(merchantName){
    	var jumpUrl = "/admin/page/merchant/order/history_list.html?merchantName=" + merchantName;
    	window.location.assign(encodeURI(jumpUrl));
    }
    
    function variable(pageNum,pageSize){
        var status = $("#status_select").val();
        var datarequest={};
        datarequest['pageNum'] = pageNum;
        datarequest['pageSize'] = pageSize;
        if(status==""||status==null){
            datarequest['merchantName']=$("#txt_company").val();
        }else{
            datarequest['merchantName']="";
        }
        return datarequest;
    }
    function select() {
        //清空隐藏域的值
        $("#status_select").val("");
        $("#status_select").val($(obj).attr("id"));
        isInit=0;
        var param =variable(1,pageSize);
        onLoadDate(param);
    }
    function customerDetails(obj){
        $("#applyId").val($(obj).attr("id"));
        $("#merchant_modal").load("/admin/page/merchant/supervise/headquarters_audit.html");
        opendiv("merchant_modal");
    }
    function pageselectCallback1(page_index, jq){
        var param = variable(page_index+1,pageSize);
        onLoadDate(param);
        return true;
    }
    function claim(obj) {
        debugger;
        console.debug("claim called.");
        var taskId = $(obj).attr("id");
        $.ajax({
            type: "POST",
            url: "/admin/csdtodo?method=claim",
            dataType: "json",
            data: {
                taskId: taskId
            },
            success: function (data) {
                var data1 = eval(data);
                var code = data1.res;
                if (code) {
                    console.debug("签收成功");
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        init();
                        return true;
                    });
                } else {
                    {
                        layer.msg("操作失败!");
                        return false;
                    }
                }
            },
            error: function () {
                layer.msg("未知错误!");
                return false;
            }
        });
    }
</script>
</html>
