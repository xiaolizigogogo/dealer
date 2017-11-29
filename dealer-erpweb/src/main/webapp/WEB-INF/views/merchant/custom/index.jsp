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
  <div class="tj_box clearfix" style="padding-bottom:15px;">
    <div class="col-sm-2"> <a href="#" onclick="assignment(this)" id="0">分配线下人员</a> <span class="badge red" data-key="distribution_user">0</span></div>
    <div class="col-sm-2"> <a href="#"  onclick="assignment(this)" id="1">线下人员信息核查</a> <span class="badge" data-key="information_verification">0</span></div>
    <div class="col-sm-2"> <a href="#"  onclick="assignment(this)" id="2">总部终审</a> <span class="badge" data-key="headquarters_audit">0</span> </div>
    <div class="col-sm-2"> <a href="#"  onclick="assignment(this)" id="3">线下安装摄像头和签订合同</a> <span class="badge" data-key="installCamera_signContract">0</span></div>
    <div class="col-sm-2"> <a href="#"  onclick="assignment(this)" id="4">风控审核</a> <span class="badge" data-key="audit_camera_contract">0</span></div>
    <div class="col-sm-2"> <a href="#"  onclick="assignment(this)" id="5">绑定银行卡</a> <span class="badge" data-key="bind_bankCard">0</span></div>
  </div>
  <div class="clearfix">
    <form class="form-inline pull-left" role="form">
      <div class="form-group">
        <label class="sr-only" for="txt_name">经销商名称</label>
        <input type="text" class="form-control" id="txt_company" placeholder="请输入经销商名称">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">法人姓名</label>
        <input type="text" class="form-control" id="txt_name" placeholder="请输入法人姓名">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">法人手机</label>
        <input type="text" class="form-control" id="txt_tel" placeholder="请输入法人手机">
      </div>
      <button type="button"  onclick="select()" class="btn btn-primary btn-search" id="btn-submit"><i class="fa fa-search"></i> 搜索</button>
    </form>
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped">
    <thead>
    <tr>
      <th>经销商名称</th>
      <th>法人--电话</th>
      <th>业务联系人--电话</th>
      <th>订单数量</th>
      <th>是否复核</th>
      <th>审批时间</th>
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
<!--获取任务id-->
<input type="hidden" value=""  id="taskId" />
<!--获取任务名字-->
<input type="hidden" value=""  id="taskName" />
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
  var pageSize = 10;

  function init(){
    var param =variable(1,pageSize);
    onLoadDate(param);
  }
  function onLoadDate(param) {
//获取页面初始数据
    $.ajax({
      type: 'post',
      url: "/admin/merchant/customer",
      data: JSON.stringify(param),
      contentType:"application/json",
      dataType: "json",
      success: function(data){
        debugger;
        $("#noReviewDisplay").html(data.count.noReview);
        $("#passDisplay").html(data.count.pass);
        $("#noPassDisplay").html(data.count.noPass);
        $("#allDisplay").html(data.count.total);
        $("#total").html("共"+data.sum+"条记录");
        for(obj in data.count)
        {
          $("#"+obj).html(data.count[obj]);
        }
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
        var list="";
        var caozuo;
        var value;

        if(isOwnEmpty(data.workflowTasks)&&data.result.length>=0){
          for(var i = 0; i <data.result.length;i++){
            debugger;
            if(data.workflowTasks[data.result[i].id]&&data.workflowTasks[data.result[i].id].assignee.length!=0){
              caozuo="<td><a href='#' onclick='customerDetails(this)' taskId="+data.workflowTasks[data.result[i].id].taskid+" accountId="+data.result[i].   accountId+" applyId="+data.result[i].id+" taskName="+data.workflowTasks[data.result[i].id].task_def_key+">处理</a></td>"
            }else {
              caozuo="<td><a href='#' onclick='claim(this)' id="+data.workflowTasks[data.result[i].id].taskid+">签收</a></td>"
            }
            /*             if(data.result[i].reviewStatus==0){
             value="未审核";
             }else if(data.result[i].reviewStatus==1){
             value ="审核通过";
             }else if(data.result[i].reviewStatus==2){
             value ="审核未通过";
             }else {
             value="未审核";
             } */
            value=data.workflowTasks[data.result[i].id].name;
            list+=  "<tr>"
                    +"<td>"+data.result[i].merchantName+"</td>"
                    +"<td>"+data.result[i].legalEntityName+"--"+data.result[i].legalEntityMob+"</td>"
                    +"<td>"+data.result[i].businessContManager+"--"+data.result[i].businessContMob+"</td>"
                    +"<td><span class='badge red'>"+data.result[i].indentCount+"</span></td>"
                    +"<td>"+value+"</td>"
                    +"<td>"+data.result[i].uploadTime+"</td>"
                    +caozuo+"</tr>";
          }
        }
        $("#record").html(list);
        getOrderCount();
      },error:function(){
        layer.msg("系统错误！");
      }
    });
  }
  function assignment(obj,pageNum){
    isInit=0;
    debugger;
    $("#status_select").val($(obj).attr("data-key"));
    var param=variable(1,pageSize);
    onLoadDate(param);
  }
  function variable(pageNum,pageSize){
    var status = $("#status_select").val();
    var datarequest={};
    datarequest['pageNum'] = pageNum;
    datarequest['pageSize'] = pageSize;
    if(status==""||status==null){
      datarequest['merchantName']=$("#txt_company").val();
      datarequest['personName']=$("#txt_name").val();
      datarequest['phoneNumber']=$("#txt_tel").val();
      datarequest['reviewStatus']=$("#txt_review").val();
    }else{
      datarequest['merchantName']="";
      datarequest['personName']="";
      datarequest['phoneNumber']="";
      datarequest['reviewStatus']=status;
    }
    return datarequest;
  }
  function select() {
    //清空隐藏域的值
    $("#status_select").val("");
    isInit=0;
    var param =variable(1,pageSize);
    onLoadDate(param);
  }
  function customerDetails(obj){
    $("#accountId").val($(obj).attr("accountId"));
    $("#applyId").val($(obj).attr("applyId"));
    $("#taskId").val($(obj).attr("taskId"));
    $("#taskName").val($(obj).attr("taskName"));
    $("#merchant_modal").load("/admin/page/merchant/custom/"+$(obj).attr("taskName")+".html");
    opendiv("merchant_modal");
  }
  function pageselectCallback(page_index, jq){
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

  /*
   * 检测对象是否是空对象(不包含任何可读属性)。
   * 方法只既检测对象本身的属性，不检测从原型继承的属性。
   */
  function isOwnEmpty(obj){
    for(var name in obj){
      if(obj.hasOwnProperty(name)){
        return true;
      }
    }
    return false;
  };
  
  function getOrderCount() {
      $.ajax({
          type: 'get',
          url: "${basePath}/admin/order/getLoanOrderCount",
          success: function (data) {
              $(".badge").each(function (index, value) {
                  var data_key = $(this).attr("data-key");
                  $(this).html(data[data_key]);
              })

          }, error: function () {
              layer.msg(" 系统错误！");
          }
      });
  }
</script>
</html>
