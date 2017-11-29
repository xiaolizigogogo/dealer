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
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-4">
        <ul>
          <li><a href="#" class="loan-status status-active" data-key="all" >全部贷前订单</a> <span class="badge"  id="total_all">0</span></li>
        </ul>
      </div>
    </div>
    <div class="col-sm-12 row">
        <ul>
            <li class="col-sm-2"><a class="loan-status" href="#"  data-key="first_trial" id="0">初审</a> <span class="badge" data-key="first_trial">0</span></li>
            <li class="col-sm-2"><a class="loan-status" href="#"  data-key="review_evaluate" id="1">审核车辆评估</a> <span class="badge" data-key="review_evaluate">0</span></li>
            <li class="col-sm-2"><a class="loan-status" href="#"  data-key="review_install_collateral" id="2">审核押品</a> <span class="badge" data-key="review_install_collateral">0</span></li>
            <li class="col-sm-2"><a class="loan-status" href="#"  data-key="judgment" id="3">终审</a> <span class="badge" data-key="judgment">0</span></li>
            <li class="col-sm-2"><a class="loan-status" href="#"  data-key="lended" id="4">放款</a> <span class="badge" data-key="lended">0</span></li>
        </ul>
      
    </div>
  </div>
  <div  class="form-inline  clearfix">
      <div class="form-group">
        <label class="sr-only" for="txt_orderid">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_name">经销商名称</label>
        <input type="text" class="form-control" id="txt_name" placeholder="经销商名称">
      </div>
      <div class="form-group">
        <label class="sr-only" for="txt_manager">法人姓名</label>
        <input type="text" class="form-control" id="txt_manager" placeholder="法人姓名">
      </div>
      <audio id="bgMusic">
          <source  src="http://192.168.1.143/mp3/14.mp3" type="audio/mp3"/>
      </audio>
      <button type="submit" class="btn btn-primary btn-search" id="btn-submit" onclick="search()"><i class="fa fa-search"></i> 搜索</button>
  </div>
  
</div>
<div class="list_box col-sm-12">
  
  <table  class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>订单号</th>
        <th>经销商</th>
        <th>申请金额</th>
        <th>终审金额</th>
        <th>流程状态</th>
        <th>生成时间</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody id="table_list">
    </tbody>
  </table>
  <!--<div class="loading"></div>-->
</div>
<div id="order_modal" class="modal fade in"></div>
<div class="clearfix col-sm-12">
  <div id="total" class="pull-left"></div>
  <div id="Pagination" class="pagination pull-right"><!-- 这里显示分页 --></div>
</div>
<!--分页及总条数内容-->

<!--用于传递订单的UUID-->
<input type="hidden" id="indent_uuid" />
<!--用于传递公司名称-->
<input type="hidden" id="merchantName" />
<!--用于传递车商的ID-->
<INPUT TYPE="hidden" id="merchant_id" />
<!--用于传递任务的ID-->
<input type="hidden" id="task_id" />
<!--用于传递用户选择状态-->
<input type="hidden" id="status_select"/>
<!--用于传递订单流程状态 -->
<input type="hidden" id="flowStatus_select" />
</body>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/other.js"></script>
<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/js/jquery.min.js" ></script>
<script src="${basePath}/js/jquery.pagination.js" ></script>
<script src="${basePath}/js/layer/layer.js"></script>

<script>

$(".toDo").click( function(){
    var index = layer.open({
  type: 2,
  title:'<h4>订单信息 <small style="padding-left:20px; font-size:14px;" class="text-muted">订单号：5645454545456456</small></h4>',
  content: '../order/order_modal.html',
  area: ['320px', '195px']
});
layer.full(index);
    })
$(function(){
    $(".loan-status").each(function (index, value) {
        $(value).click(function () {

            $(".status-active").attr("class", "loan-status");
            $(this).attr("class", "loan-status status-active");
            //清除掉其他的状态
            $("#txt_orderid").val("");
            $("#txt_name").val("");
            $("#txt_manager").val("");
            //清除状态选择
            $(obj).parents($(".col-sm-12")).find('li').removeClass('active');
            $(obj).parents("li").addClass('active');
            //取得选择状态
            $("#status_select").val($(obj).attr("id"));
            console.debug("sucess call assignment functiton.");
            current_page = 1;
            requestJsonData(1);
        })
    })
    
    //进入画面时，请求第一页数据
    //用户记录当前的页码
    current_page = 1;
    requestJsonData(1,pageSize,"");
});
var isInit = 0;
var pageSize = 10;
var total = 0;
var current_page = 0;
var flowStatusList={
        "初审并分配评估师":"first_trial",
        "评估及安装押品":"evaluate_install_collateral",
        "风控审核车辆评估":"review_evaluate",
        "风控审核押品":"review_install_collateral",
        "平台总部终审":"judgment",
        "签订借款合同":"sign_contract",
        "平台财务放款":"lended"
        };
function init_request(pageNum,pageSize) {
    console.debug("init_request called.");
    var datarequest={};
    datarequest['pageNum'] = pageNum;
    datarequest['pageSize'] = pageSize;
    console.debug(pageSize);
    datarequest['orderNumber'] = $("#txt_orderid").val();
    console.debug(datarequest['orderNumber']);
    datarequest["merchantName"] = $("#txt_name").val();
    console.debug(datarequest['merchantName'] );
    datarequest["representative"]=$("#txt_manager").val();
    console.debug(datarequest['representative'] );
    datarequest["listKind"]=$(".status-active").attr("data-key");
    console.debug(datarequest["loanStatus"]);
    return datarequest
}
function setIndentParameter (obj) {
    $("#indent_uuid").val($(obj).attr("id"))
}
function setMerchantParameter(obj) {
    $("#merchant_id").val($(obj).attr("id"));
}
function setTaskParameter(obj) {
    var id = $(obj).attr("id").split(":");
    //$("#task_id").val($(obj).attr("id"));
    //给隐藏域task_id、indent_uuid、indentStatus_select赋值
     getDifferentId(id);
     $("#order_modal").load("/admin/page/merchant/order/"+id[2]+".html");
     opendiv("order_modal");
}
function getDifferentId(id){
     $("#task_id").val(id[0]);
     $("#indent_uuid").val(id[1]);
     $("#flowStatus_select").val(id[2]);
}
function claim(obj) {
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
                    requestJsonData(current_page,pageSize,"");;
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
//用户操作产生的Handler
function search () {
    //用户压下搜索button，都默认显示第一页数据
    current_page = 1;
    requestJsonData(1);
}
function refreshpage () {
    requestJsonData(current_page);
}
function assignment(obj) {
    //清除掉其他的状态
    $("#txt_orderid").val("");
    $("#txt_name").val("");
    $("#txt_manager").val("");
    //清除状态选择
    $(obj).parents($(".col-sm-12")).find('li').removeClass('active');
    $(obj).parents("li").addClass('active');
    //取得选择状态
    $("#status_select").val($(obj).attr("id"));
    console.debug("sucess call assignment functiton.");
    current_page = 1;
    requestJsonData(1);
}

function requestJsonData(pageNum) {
    var param = init_request(pageNum,pageSize);
    //通过Ajax向页面发送请求数据
    $.ajax({
        url: '/admin/order/reviewphase',
        type: 'POST',
        contentType:"application/json",
        dataType:"json",
        cache: false,
        data:JSON.stringify(param),
        error: erryFunction,  //错误执行方法
        success: succFunction //成功执行方法
    });
    function erryFunction(XMLHttpRequest, textStatus, errorThrown) {
        alert(XMLHttpRequest.status);
        alert(XMLHttpRequest.readyState);
        alert(textStatus);
    }
    function succFunction(data) {
        debugger;
        console.debug("sucess call ajax functiton.");

        //判断是否第一次请求
        if((isInit == 0)||(total != data.countMap.total_all)){
            isInit = 1;
            $("#total").html("共"+total+"条记录");
            initPagination = function() {
                console.debug("sucess call initPagination int functiton.");
                // 创建分页
                if(data != null) {
                    $("#Pagination").pagination(data.total, {
                        num_edge_entries: 1, //边缘页数
                        num_display_entries: 6, //主体页数
                        callback: pageselectCallback,
                        items_per_page: pageSize //每页显示1项
                    });
                }
            }();
            //只有第一次更新上部数据
            //更新状态筛选数据
            for(obj in data.countMap){
                $("#"+obj).html(data.countMap[obj]);
            }
        }
        //更新个状态下的数目
        var countArray = data.countMap;
        for(var key in countArray){
            $("#id_"+key+"_span").html(countArray[key]);
        }
        $("#total_all").html(data.countMap.total_all);
        //每次都更新总的list条数
        total = data.countMap.total_all;
        //针对表格进行刷新
        $("#table_list").html("");
        $("#total").html("共"+total+"条记录");
        var htmlstr = "";
        if ((data.list != undefined) && (data.list != null)) {
            for (var i = 0; i < data.list.length; i++) {
                console.debug("data.list.length:" + data.list.length);
                console.debug("data.list.i:" + i);
                htmlstr += "<tr>";
                //订单号
                var str = data.list[i].indentNumber == undefined ? "" : data.list[i].indentNumber;
                if (str != null) {
                    str = "<p href='javascript:void(0)' id=" +
                        data.list[i].id +
                        ">" +
                        str +
                        "</p>";
                }
                htmlstr += "<td>".concat(str).concat("</td>");

                //经销商
                str = data.list[i].merchantName == undefined ? "" : data.list[i].merchantName;
                if (str != "") {
                    str = "<p href='javascript:void(0)' onclick='setMerchantParameter(this)' id=" +
                        data.list[i].merchantId +
                        ">" +
                        str +
                        "</p>";
                }

                htmlstr += "<td <td "+str+"</td>";
                //申请金额
                if (data.list[i].applyMoney == 0) {
                    htmlstr += "<td>".concat(data.list[i].applyMoney == undefined ? "" :"最高贷款额").concat("</td>");
                }else {
                    htmlstr += "<td>".concat(data.list[i].applyMoney == undefined ? "" : data.list[i].applyMoney.toString().concat(data.list[i].applyMoney == undefined ? "" : "万")).concat("</td>");
                }
                //终审金额
                htmlstr += "<td>".concat(data.list[i].judgeMoney == undefined ? "" : data.list[i].judgeMoney.toString().concat(data.list[i].judgeMoney == undefined ? "" : "万")).concat("</td>");
                //流程状态
                htmlstr += "<td>".concat(data.list[i].indentStatus == undefined ? "" : data.list[i].indentStatus).concat("</td>");
                //生成时间
                htmlstr += "<td>".concat(data.list[i].createdTime == undefined ? "" : (new Date(data.list[i].createdTime)).Format("yyyy-MM-dd")).concat("</td>");
                //操作
                if (data.list[i].assigee != null) {
                    str = "处理";
                    str = "<a href='#' onclick='setTaskParameter(this)' id=" +
                        data.list[i].taskId + ":" + data.list[i].id + ":" + data.list[i].taskName +
                        ">" +
                        str +
                        "</a>";
                } else {
                    str = "签收";
                    str = "<a href='#' onclick='claim(this)' id=" +
                        data.list[i].taskId +
                        ">" +
                        str +
                        "</a>";
                }

                htmlstr += "<td>".concat(str).concat("</td>");
                htmlstr += "</tr>"
            }
        }
        $("#table_list").html(htmlstr);
        $("#total_all").html(data.countMap.total_all);
        getOrderCount();

    }

   /*  function pageselectCallback(page_index, jq){
        debugger;
        console.debug("pageselectCallback called. pageindex="+page_index);
        current_page = page_index;
        requestJsonData(page_index+1,pageSize,"");
        return true;
    } */
    
    
    var is_Init_Callback = 0;
    function pageselectCallback(page_index, jq) {

        if(is_Init_Callback == 0){
            is_Init_Callback =1;
        }else {
            console.debug("pageselectCallback called. pageindex=" + page_index);
            current_page = page_index+1;
            requestJsonData(current_page, pageSize, "");
        }
        
        return true;
    }
    
}
</script>
<script>

    function myrefresh()
    {
        window.location.reload();
    }
    function orderModal(id,indentNumber,merchantName){
        $("#indent_uuid").val(id);
        debugger;
        var index = layer.open({
            type: 2,
            title:'<h4>订单信息 <small style="padding-left:20px; font-size:14px;" class="text-muted">订单号：'+ indentNumber+'</small></h4>',
            content: '../order/h_order_modal.jsp',
            area: ['320px', '195px']
        });
        layer.full(index);
    }
    function companyModal(id,indentNumber,merchantName){
        $("#indent_uuid").val(id);
        $("#merchantName").val(merchantName);
        debugger;
        var index = layer.open({
            type: 2,
            title:'<h4>公司信息 <small style="padding-left:20px; font-size:14px;" class="text-muted">公司名称：'+ merchantName+'</small></h4>',
            content: '../order/h_company_modal.jsp',
            area: ['320px', '195px']
        });
        layer.full(index);
    }
   //window.setInterval('selectOrderForm()',3000); //60秒之后调用一次
    function selectOrderForm() {
        $.ajax({
            type: 'post',
            url: "${basePath}/admin/order/orderForm",
            data: {"indent_uuid":parent.$("#indent_uuid").val()},
            dataType: "json",
            success: function(data){
                debugger;
                if (data=="1"){
                    var audio = document.getElementById("bgMusic");
                 //播放(继续播放)
                    audio.play();
                    setTimeout('myrefresh()',1000); //指定1秒刷新一次
                }
            },error:function(){
                layer.msg(" 系统错误！");
            }
        });
    }
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
