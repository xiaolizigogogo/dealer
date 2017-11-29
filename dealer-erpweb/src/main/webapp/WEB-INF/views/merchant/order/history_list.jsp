<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <meta charset="utf-8">
  <title>订单列表</title>
      <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
  <link href="${basePath}/css/bootstrap/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${basePath}/css/bootstrap/bootstrap-table.css">
  <link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
  <link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
  <link rel="stylesheet" type="text/css" href="${basePath}/css/pagination.css"/>
  <script src="${basePath}/js/jquery.min.js" ></script>
  <script src="${basePath}/js/layer/layer.js"></script>
      <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/jquery.validate.js"></script>

    <link rel="stylesheet" href="${basePath}/js/completer/completer.min.css" />
    <script type="text/javascript" src="${basePath}/js/completer/completer.min.js"></script>
    <script type="text/javascript" src="${basePath}/js/distpicker/distpicker.data.js"></script>
    <script type="text/javascript" src="${basePath}/js/distpicker/distpicker.js"></script>
</head>

<body>
<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
      <div class="col-sm-3 " >
        <ul>
          <li><a href="#" class="loan-status" data-value="lended">待还款订单</a> <span class="badge red" data-key="lendedCount">5</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="repayment">还款中订单</a> <span class="badge" data-key="repaymentCount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="overdue">逾期订单</a> <span class="badge" data-key="overdueCount">15</span></li>
        </ul>
      </div>

      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_start">申请贷款</a> <span class="badge" data-key="startLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_first_trial">初审</a> <span class="badge" data-key="first_trialLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_evaluate_install_collateral">线下评估及安装押品</a> <span class="badge" data-key="evaluate_install_collateralLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_review_evaluate">风控审核车辆评估</a> <span class="badge" data-key="review_evaluateLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_review_install_collateral">风控审核押品押品监管</a> <span class="badge" data-key="review_install_collateralLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_judgment">终审</a> <span class="badge" data-key="judgmentLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_distribution_user_sign_contract">分配线下人员签订合同</a> <span class="badge" data-key="distribution_user_sign_contractLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_sign_contract">签订合同</a> <span class="badge" data-key="sign_contractLoancount">15</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="CarDealerLoan_lended">放款</a> <span class="badge" data-key="lendedLoancount">15</span></li>
        </ul>
      </div>

      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status status-active" data-value="all">全部</a> <span class="badge" data-key="totalIndent">20</span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#" class="loan-status" data-value="repayment_end">还款结束</a> <span class="badge" data-key="repaymentEndCount">0</span></li>
        </ul>
      </div>

  </div>
  <div class="form-inline  clearfix">
      <div class="form-group">
                开始时间:<label class="sr-only" for="txt_name"></label>
                <div id="dddd" class="input-group date form_date" data-date=""
                     data-date-format="yyyy-mm-dd" data-link-field="purchaseDate"
                     data-link-format="yyyy-mm-dd" style="width: 160px;">
                    <input id="startTime" class="form-control valid" value="" 
                           style="width: 100%;" type="text"> <span
                        class="input-group-addon"><span
                        class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            结束时间:<div class="form-group">
                <label class="sr-only" for="txt_name"></label>
                <div id="dddd" class="input-group date form_date" data-date=""
                     data-date-format="yyyy-mm-dd" data-link-field="purchaseDate"
                     data-link-format="yyyy-mm-dd" style="width: 160px;">

                    <input id="endTime" class="form-control valid" value="" 
                           style="width: 100%;" type="text"> <span
                        class="input-group-addon"><span
                        class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
             <div class="form-group">
        <label  for="txt_name" onclick="searchDay(7)">最近7天</label>
      </div>
         <div class="form-group">
         <label  for="txt_name" onclick="searchDay(15)">最近15天</label>
      </div> 
       <div class="form-group">
        <label class="sr-only" for="txt_name">订单号</label>
        <input type="text" class="form-control" id="txt_orderid" placeholder="请输入订单号">
      </div>
        <div class="form-group">
        <label class="sr-only" for="txt_name">车行名称</label>
        <input type="text" class="form-control" id="txt_merchantName" placeholder="请输入车行名称">
        </div>
        <div class="form-group">
        <label class="sr-only" for="txt_name">车牌号码</label>
        <input type="text" class="form-control" id="txt_plateNumber" placeholder="请输入车牌号码">
      </div>
         <div class="form-group">
        <label class="sr-only" for="txt_name">VIN码</label>
        <input type="text" class="form-control" id="txt_vin" placeholder="请输入VIN码">
      </div>
    
      <div class="form-group">
      <a class="btn btn-danger" href="javascript:method1('ta')"
                   id="dc_btn" > <i class="fa fa-download"></i>导出
            </a>
            </div>
        
        <button type="submit" class="btn btn-primary btn-search" onclick="search()"><i class="fa fa-search"></i> 搜索</button>
      

      
  </div>
</div>
<div class="list_box col-sm-12">
  <table  class="table table-bordered table-striped" id="ta">
    <thead>
    <tr>
      <th><input type="checkbox" name="checkboxAll" id="checkAll" onclick="selectAll()"></th>
      <th>订单号</th>
      <th>经销商</th>
      <th>车辆型号</th>
      <th>车牌号码</th>
      <th>VIN码</th>
      <th>订单状态</th>
      <th>终审金额</th>
      <th>借款期限</th>
      <th>放款日</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody id="table_list">
    <!-- <tr>
      <td onClick="orderModal();" ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)" title="加急">1245212512</a></td>
      <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  title="重点">辉程汽车销售有限公司</a></td>
      <td><span class="label label-info">正常还款</span></td>
      <td>25.00万</td>
      <td>25.00万</td>
      <td>2016-6-12</td>
      <td>2016-9-12</td>
    </tr>
    <tr>
      <td ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)"  onclick="opendiv('order_modal')" title="加急">1245212512</a></td>
      <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  onclick="opendiv('custom_modal')"  title="重点">辉程汽车销售有限公司</a></td>
      <td><span class="label label-warning">逾期还款</span></td>
      <td>25.00万</td>
      <td>26.00万</td>
      <td>2016-6-12</td><td>2016-9-12</td>
    </tr>
    <tr>
      <td ><i class="fa fa-bookmark text-success"></i><a href = "javascript:void(0)"  onclick="opendiv('order_modal')" title="加急">1245212512</a></td>
      <td><i class="fa fa-star text-danger" ></i><a  href = "javascript:void(0)"  onclick="opendiv('custom_modal')"  title="重点">辉程汽车销售有限公司</a></td>
      <td><span class="label label-danger">坏账处理</span></td>
      <td>25.00万</td>
      <td>-</td>
      <td>2016-6-12</td><td>-</td>
    </tr> -->
    </tbody>
  </table>
</div>
<!--用于传递订单的UUID-->
<input type="hidden" id="indent_uuid" />
<!--用于传递公司名称-->
<input type="hidden" id="merchantName" />
<!--用于传递车商的ID-->
<INPUT TYPE="hidden" id="merchant_id" />
<!--用于传递任务的ID-->
<input type="hidden" id="task_id" />
<!--用于传递用户选择状态-->
<input type="hidden" id="status_select" />
<!--用于传递订单流程状态 -->
<input type="hidden" id="flowStatus_select" />
<div id="order_modal" class="modal fade in"></div>
</body>
<div class="clearfix col-sm-12">
  <div id="total" class="pull-left"></div>
  <div id="Pagination" class="pagination pull-right"><!-- 这里显示分页 --></div>
</div>
<script src="${basePath}/js/other.js"></script>
<script src="${basePath}/js/bootstrap.js"></script>
<script src="${basePath}/js/jquery.pagination.js" ></script>
<script src="${basePath}/js/common.js"></script>
<script src="${basePath}/js/plugins/layer/layer.min.js" ></script>
<script>

  function orderModal(){
    var index = layer.open({
      type: 2,
      title:'<h4>订单信息 <small style="padding-left:20px; font-size:14px;" class="text-muted">订单号：5645454545456456</small></h4>',
      content: '../order/h_order_modal.html',
      area: ['320px', '195px']
    });
    layer.full(index);
  }
  $(function(){
	<!-- 如果是从车辆监管页面跳转的,解决Url中文参数乱码问题,并获取车辆名称参数,放入到车行名称输入框中,页面加载自动检索 -->
	var url = decodeURI(location.href);
	var tmp1 = url.split("?")[1];
	if(tmp1 != null){
		var tmp2 = tmp1.split("&")[0]; 
		var merchantName = tmp2.split("=")[1]; 
	}
	
	$("#txt_merchantName").val(merchantName);
    //进入画面时，请求第一页数据
    //用户记录当前的页码
    $(".loan-status").each(function(index,value){
      $(value).click(function(){

        $(".status-active").attr("class","loan-status");
        $(this).attr("class","loan-status status-active");
        current_page = 1;
        requestJsonData(1,pageSize,"");
      })
    })
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
    datarequest["startTime"]=$("#startTime").val();
    datarequest["endTime"]=$("#endTime").val();
    datarequest["vin"]=$("#txt_vin").val();
    datarequest["plateNumber"]=$("#txt_plateNumber").val();
    datarequest["merchantName"]=$("#txt_merchantName").val();
    console.debug(datarequest['representative'] );
    datarequest["listKind"]="review";
    console.debug(datarequest["loanStatus"]);
    datarequest["loanStatus"]=$(".status-active").attr("data-value");
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
    $("#order_modal").load("/admin/page/merchant/order/after_detail.html");
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

  function getOrderCount(){
    
	var data = '{"list":["start","first_trial","evaluate_install_collateral","review_evaluate","review_install_collateral","judgment","distribution_user_sign_contract","sign_contract","lended"]}';
    $.ajax({
      type: 'post',
      url: "${basePath}/admin/order/getAllOrderCount",
      data:	data,
      contentType: 'application/json',
      success: function(data){
        $(".badge").each(function(index,value){
          var data_key=$(this).attr("data-key");
          $(this).html(data[data_key]);
        })

      },error:function(){
        layer.msg(" 系统错误！");
      }
    });
  }

  function requestJsonData(pageNum) {
    var param = init_request(pageNum,pageSize);
    //通过Ajax向页面发送请求数据
    $.ajax({
      url: '/admin/order/getAllOrders',
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

      console.debug("sucess call ajax functiton.");

      //判断是否第一次请求
      if((isInit == 0)||(total != data.total)){
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
      //每次都更新总的list条数
      total = data.total;
      //针对表格进行刷新
      $("#table_list").html("");
      $("#total").html("共"+total+"条记录");
      var htmlstr = "";
      if ((data.list != undefined) && (data.list != null)) {
        for (var i = 0; i < data.list.length; i++) {
          htmlstr += "<tr>"
                    +"<td align='center'><input type='checkbox' onclick='paramClick(this)' name='checkbox1' value='"
                    + data.list[i].id+"' id='"
                    +data.list[i].id+"' ></td>";
          //订单号
          var str = data.list[i].indentnumber == undefined ? "" : data.list[i].indentnumber;
          if (str != null) {
            str = "<p href='javascript:void(0)' id=" + data.list[i].id + ">" + str + "</p>";
          }
          htmlstr += "<td>".concat(str).concat("</td>");

          //经销商
          str = data.list[i].merchantName == undefined ? "" : data.list[i].merchantName;

          htmlstr += "<td>".concat(str).concat("</td>");
          htmlstr +="<td>"+ data.list[i].carBrand+" "+data.list[i].carType+"</td>";
          htmlstr +="<td>"+ data.list[i].platenumber+"</td>";
          htmlstr +="<td>"+ data.list[i].vin+"</td>";
          //流程状态
          htmlstr += "<td>".concat(data.list[i].indentstate == undefined ? "" : data.list[i].indentstate).concat("</td>");
          //终审金额
          htmlstr += "<td>".concat((data.list[i].judgemoney == null||data.list[i].judgemoney == "") ? "-" : data.list[i].judgemoney.toString().concat(data.list[i].judgemoney == null ? "" : "万")).concat("</td>");
          //借款期限
          htmlstr += "<td>".concat(data.list[i].deadlinetime == undefined ? "" : data.list[i].deadlinetime.toString().concat(data.list[i].deadlinetime == undefined ? "" : "天")).concat("</td>");
          //放款日
          htmlstr += "<td>".concat((data.list[i].outAccountTime == null||data.list[i].outAccountTime=="") ? "-" : (new Date(data.list[i].outAccountTime)).Format("yyyy-MM-dd")).concat("</td>");
          //操作
          /*        if (data.list[i].assigee != null) {


           } else {
           str = "签收";
           str = "<a href='#' onclick='claim(this)' id=" + data.list[i].taskId + ">" + str + "</a>";
           }*/
           str = "查看  ";
           str = "<a href='#' onclick='setTaskParameter(this)' id=" + data.list[i].indentnumber + ":" + data.list[i].id + ":" + data.list[i].indentstate + ">" + str + "</a>";
           str2 = "  删除";
           str = str+"<a href='#' onclick='deleteOne(this)'  applyId="+data.list[i].id+">" + str2 + "</a>";
           htmlstr += "<td>".concat(str).concat("</td>");

          htmlstr += "</tr>"
        }
      }
      $("#table_list").html(htmlstr);
      getOrderCount();

    }

    /* function pageselectCallback(page_index, jq){

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
  function deleteOne(obj){
    var applyId=$(obj).attr("applyId");
    layer.confirm("删除后，消费贷订单也会随之删除，是否确认删除？", {icon: 3, title: '提示'}, function () {
    $.ajax({
        type: 'post',
        url: "${basePath}/admin/delete/order/"+applyId,
        dataType: "text",
        async:false,
        success: function(data){
          if(data=="-2"){
            layer.alert("没有权限");
            return;
          }
      if(data!="-1"){
         layer.confirm("操作成功!", {icon: 3, title: '提示'}, function () {
              window.location.reload();
         })
      return ;
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
    function selectAll() {
        var isChecked = $("#checkAll").prop("checked");
        if (isChecked) {
            $("[name='checkbox1'][disabled!='disabled']").prop("checked", true);//全选
            $("#table_list tr").addClass("export")
        } else {
            $("[name='checkbox1']").prop("checked", false);//取消全选
            $("#table_list tr").removeClass("export")
        }

    }
        function exportExcel() {
        var date = $("#date1").val().replace("-", "").substring(0,6);
        var src = "/admin/loan/exportRepaymentInfoList?dateRange=" + date
                + "&contractNum=" + $("#txt_contractNum").val() + "&repayStatus="
                + $("#repayStatus_select").val() + "&company="
                + $("#company_select").val() + "&dept="
                + $("#dept_select").val() + "&manager="
                + $("#user_select").val() + "&customerName="
                + encodeURIComponent(encodeURIComponent($("#txt_name").val()));
        $("#exportIframe").attr("src", src);
        $('#dc_tip').show();
    }
</script>

<script type="text/javascript" language="javascript">
        var idTmr;
        function  getExplorer() {
            var explorer = window.navigator.userAgent ;
            //ie 
            if (explorer.indexOf("MSIE") >= 0) {
                return 'ie';
            }
            //firefox 
            else if (explorer.indexOf("Firefox") >= 0) {
                return 'Firefox';
            }
            //Chrome
            else if(explorer.indexOf("Chrome") >= 0){
                return 'Chrome';
            }
            //Opera
            else if(explorer.indexOf("Opera") >= 0){
                return 'Opera';
            }
            //Safari
            else if(explorer.indexOf("Safari") >= 0){
                return 'Safari';
            }
        }
        function method1(tableid) {//整个表格拷贝到EXCEL中
          debugger;
            if(getExplorer()=='ie')
            {
                var curTbl = document.getElementById(tableid);
                var oXL = new ActiveXObject("Excel.Application");

                //创建AX对象excel 
                var oWB = oXL.Workbooks.Add();
                //获取workbook对象 
                var xlsheet = oWB.Worksheets(1);
                //激活当前sheet 
                var sel = document.body.createTextRange();
                sel.moveToElementText(curTbl);
                //把表格中的内容移到TextRange中 
                sel.select;
                //全选TextRange中内容 
                sel.execCommand("Copy");
                //复制TextRange中内容  
                xlsheet.Paste();
                //粘贴到活动的EXCEL中       
                oXL.Visible = true;
                //设置excel可见属性

                try {
                    var fname = oXL.Application.GetSaveAsFilename("Excel.xls", "Excel Spreadsheets (*.xls), *.xls");
                } catch (e) {
                    print("Nested catch caught " + e);
                } finally {
                    oWB.SaveAs(fname);

                    oWB.Close(savechanges = false);
                    //xls.visible = false;
                    oXL.Quit();
                    oXL = null;
                    //结束excel进程，退出完成
                    //window.setInterval("Cleanup();",1);
                    idTmr = window.setInterval("Cleanup();", 1);

                }

            }
            else
            {
                tableToExcel('ta')
            }
        }
        function Cleanup() {
            window.clearInterval(idTmr);
            CollectGarbage();
        }
        var tableToExcel = (function() {
              var uri = 'data:application/vnd.ms-excel;base64,',
              template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
                base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) },
                format = function(s, c) {
                    return s.replace(/{(\w+)}/g,
                    function(m, p) { return c[p]; }) }
                return function(table, name) {
                if (!table.nodeType) table = document.getElementById(table)
                var str="";
                var os=$(".export");
                  for(var o in os){
                    str+="<tr>"+os[o].innerHTML+"</tr>";
                  }
                 var t= table.tHead.innerHTML+str;

                var ctx = {worksheet: name || 'Worksheet', table: t.replace(new RegExp("操作","gm"),'').replace(new RegExp("查看","gm"),'').replace(new RegExp("删除","gm"),'')}
                window.location.href = uri + base64(format(template, ctx))
              }
            })()
           function paramClick(obj){
            debugger;
           var i= $(obj).parent().parent().attr("class");
           if(i=="export"){
              $(obj).parent().parent().attr("class","");
           }
           else{
            $(obj).parent().parent().addClass("export");
           }
           }
           function searchDay(day){
              var date=new Date(new Date()-day*3600*24*1000).Format("yyyy-MM-dd");
              $("#startTime").val(date);
              search();
           }
    Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
    function clear(){
    	$("#startTime").val("");
    	$("#endTime").val("");
    }
    </script>
</html>
