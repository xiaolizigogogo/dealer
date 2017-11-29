<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"
  import="com.maiqianweng.common.utils.*"%>
<!DOCTYPE html>
<%
  String searchDate = request.getParameter("date");
%>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible"
  content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control" content="no-transform">
<title>e车贷管理系统—坏账统计</title>
<%@include file="../common/taglibs.jsp"%>
<link rel="stylesheet"
  href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script src="${basePath}/js/tableutils.js"></script>
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css" />
<script src="${basePath}/js/lightbox.js" ></script>
<script src="${basePath}/js/Map.js" ></script>
<link rel="stylesheet" type="text/css"
  href="${basePath}/css/dateRange.css" />
<script type="text/javascript" src="${basePath}/js/dateRange.js"></script>
<style type="text/css">
.table>tbody>tr>td.tr_back, .table-striped>tbody>tr:nth-child(odd)>td.tr_back,
  .table-striped>tbody>tr:nth-child(odd)>th.tr_back {
  background-color: #FCF8E3;
  !
  important;
}
</style>
</head>
<body>
  <input type="hidden" value="<%=searchDate%>" id="searchDate" />
  <input type="hidden" value="" id="edit_customer_id" />
  <input type="hidden" value="" id="statusnew">
  <input type="hidden" value="" id="customer_id_hidden">
  <input type="hidden" value="" id="taskId_hidden">
  <input type="hidden" value="" id="processDefinitionId_hidden">
  <div class="tools_bar col-lg-12">
    <div class="clearfix">
      <form class="form-inline pull-left" role="form">
        <div class="form-group">
          <div class="ta_date" id="div_date1">
            <span class="date_title" id="date1"></span> <a class="opt_sel"
              id="input_trigger1" href="#"> <i class="i_orderd"></i>
            </a>
          </div>
          <div id="datePicker1"></div>
        </div>
        <div class="form-group">
          <label class="sr-only" for="txt_number">期数</label> <input
            class="form-control" id="issue" placeholder="期数"
            style="width: 100px;" type="number">
        </div>
        坏账额度:
        <div class="form-group">
          <input type="text" class="form-control" id="minLoanMoney"
            placeholder="万元" style="width: 100px;">
        </div>
        -
        <div class="form-group">
          <input type="text" class="form-control" id="maxLoanMoney"
            placeholder="万元" style="width: 100px;">
        </div>
        <div class="form-group">
          <select id="loanProduct_select" class="form-control">
            <option value="">贷款产品</option>
            <c:forEach
              items="<%=EnumUtils.toEnumBaseList(com.maiqianweng.entity.enums.LoanProductEnum.class)%>"
              var="item">
              <option value="${item.value()}">${item.message()}</option>
            </c:forEach>
          </select>
        </div>

        <div class="form-group">
          <select id="repayWay_select" class="form-control">
            <option value="">还款方式</option>
            <c:forEach
              items="<%=EnumUtils.toEnumBaseList(com.maiqianweng.entity.enums.RepayWayEnum.class)%>"
              var="item">
              <option value="${item.name()}">${item.message()}</option>
            </c:forEach>
          </select>
        </div>
        <div class="form-group">
          <select id="pledgeType_select" class="form-control">
            <option value="">抵押方式</option>
            <c:forEach
              items="<%=EnumUtils.toEnumBaseList(com.maiqianweng.entity.enums.PledgeTypeEnum.class)%>"
              var="item">
              <option value="${item.name()}">${item.message()}</option>
            </c:forEach>
          </select>
        </div>
        <div class="form-group">
          <select id="company_select" class="form-control">
            <option value="">选择分公司</option>
          </select>
        </div>
        <div class="form-group">
          <select id="dept_select" class="form-control">
            <option value="">选择业务部门</option>
          </select>
        </div>
        <div class="form-group">
          <select id="user_select" class="form-control">
            <option value="">选择客户经理</option>
          </select>
        </div>
        <button type="button" class="btn btn-primary btn-search"
          onclick="select()" id="btn-submit">
          <i class="fa fa-search"></i> 搜索
        </button>
      </form>
    </div>
    <div id="info_div" class="tj_box clearfix" style="margin-top: 10px;">
    </div>
    <div class="list_btn">
      <ul class="list-inline">
        <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->

        <li><a class="btn btn-danger" href="javascript:void(0)"
          id="dc_tip" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件
        </a></li>
      </ul>
    </div>
  </div>
  <div class="list_box col-sm-12">
    <table data-toggle="table" class="table table-bordered table-striped">
      <thead>
        <tr>
          <th>客户经理</th>
          <th>订单号</th>
          <th>合同号</th>
          <th>客户姓名</th>
          <th>业务部门</th>
          <th>分公司</th>
          <th>贷款产品</th>
          <th>还款方式</th>
          <th>抵押方式</th>
          <th>坏账期数</th>
          <th>坏账日期</th>
          <th>贷款金额</th>
          <th>坏账金额</th>
          <th>已收金额</th>
        </tr>
      </thead>
      <tbody id="record">
      </tbody>
    </table>
  </div>
  <div id="r-page"></div>
  <div id="test1" class="modal fade in">
    <div class="modal-header">
      <a type="button" href="javascript:void(0)" onclick="colsediv(0)"
        class="close"><span aria-hidden="true">&times;</span></a>
      <h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">查看订单</h4>
    </div>
    <div class="modal-body">
      <div class="row" style="position: fixed;"></div>
    </div>
    <div class="modal-footer">
      <p class="text-center">
        <a class="text-center">
          <button class="btn btn-small" data-dismiss="modal"
            onclick="colsediv(0)" aria-hidden="true">保存</button>
        </a> <a class="text-center">
          <button class="btn btn-small" data-dismiss="modal"
            onclick="colsediv(0)" aria-hidden="true">返回</button>
        </a>
      </p>
    </div>
  </div>
  <div id="fade2" class="black_overlayx"></div>
  <div id="order_modal" class="modal fade in"></div>
  <iframe src="" style="display: none;" id="exportIframe"> </iframe>
</body>
<script type="text/javascript">
  var map = new Map();
  //1.初始化页面 init方法,第一次请求不需要设置参数，需要设置页面初始化数据
  $(function() {
    init();
  });
  //初始化方法,调用queryBadLoanList接口，将返回的一系列信息添加到下拉选择框中,并将查询到的数据绑定到页面，需要分页
  function init() {
    //获取页面下拉框中数据
    $.get("${basePath}/admin/company/queryCompanyList", function(data) {
      for (var i = 0; i < data.length; i++) {
        $("#company_select").append(
            "<option value="+data[i].id+">" + data[i].name
                + "</option>");
      }
    });
    //将查询结果集写入到页面
    onLoadDate(null)
  }
  //2.点击查询的查询方法
  function select() {
    onLoadDate(param());
  }

  var dateRange1 = new pickerDateRange('date1', {
    isTodayValid : true,
    startDate : '请选择坏账日期区间',
    endDate : '',
    autoSubmit : false,
    inputTrigger : 'input_trigger1',
    theme : 'ta',
    success : function(obj) {
      $("#dCon2").html(
          '开始时间 : ' + obj.startDate + '<br/>结束时间 : ' + obj.endDate);
      $("#startDate").val(obj.startDate);
      $("#endDate").val(obj.endDate);
    },
    clear : function() {

      $("#date1").html("请选择开始日期");
      $("#startDate").val(null);
      $("#endDate").val(null);

    }
  });

  function onLoadDate(param) {
    var money = 0;
    $("#info_div").empty().append(
        "<p>订单数<b class='text-danger'> " + 0
            + "单</b>，客户数 <b class='text-danger'>" + 0
            + "户</b>，贷款总金额 <b class='text-danger'>"
            + money.toFixed(2)
            + "万元</b>，已收总金额 <b class='text-danger'>"
            + money.toFixed(2)
            + "万元</b>，坏账总金额 <b class='text-danger'>-"
            + money.toFixed(2) + "万元</b></p>");
    var writetablefn = function(data) {
      $("#noloanorder").html(data.noloanorder);
      var context;
      $("#checkAll").prop("checked", false);
      var customerCount = data.customerCount;
      var isImportant = "";
      if (data.isImportant == "1") {
        isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
      }
  
      var loanDetails = {};
      loanDetails.uuid = data.uuid;
      loanDetails.orderId = data.orderId;
      loanDetails.taskId = data.taskId;
      loanDetails.activityId = data.activityId;
      loanDetails.assignee = data.assignee;
      loanDetails.loan_status = data.loan_status;
      loanDetails.customerId = data.customerId;
      
      context = "<tr id="
          + data.uuid
          + " onclick='setEditCustomer(this)'>"
          + "<td>"
          + data.realName
          + "</td>"
          + "<td>"
          + "<a id="
          + data.uuid
          + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
          + data.orderId
          + "</a>"
          + "</td>"
          + "<td>"
          + "<a id="
          + data.uuid
          + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
          + data.contractNum
          + "</a>"
          + "</td>"
          + "<td>"
          + isImportant
          + "<a id="
          + data.uuid
          + " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
          + data.customerName + "</a></td>" + "<td>" + data.deptName
          + "</td>" + "<td>" + data.companyName + "</td>" + "<td>"
          + data.loanProduct + "</td>" + "<td>" + data.pledgeType
          + "</td>" + "<td>" + data.repayWay+ "</td>" + "<td>"
          + data.restIssue + "</td>" + "<td>" + data.createdAt
          + "</td>" + "<td>" + data.loanMoney + "</td>" + "<td>"
          +   data.restMoney+ "</td>" + "<td>" + data.repayMoney
          + "</td>" + "</tr>";
          
          
      $("#info_div").empty().append(
          "<p>订单数<b class='text-danger'> " + data.orderCount
              + "单</b>，客户数 <b class='text-danger'>"
              + data.customerCount
              + "户</b>，贷款总金额 <b class='text-danger'>"
              + (data.loanMoneySum / 10000).toFixed(2)
              + "万元</b>，已收总金额 <b class='text-danger'>"
              + (data.repaySum / 10000).toFixed(2)
              + "万元</b>，坏账总金额 <b class='text-danger'>-"
              + (data.badLoanSum / 10000).toFixed(2)
              + "万元</b></p>");
      map.put(data.uuid.toString(),loanDetails);
      return context;
    };

    pageComm("${basePath}/admin/loan/queryBadLoanList", param == null ? {}
        : param, writetablefn, "record", 17);

  }

  function assignment(obj) {
    $("#statusnew").val($(obj).attr("id"));
    select();
  }
  function reset() {
    $("#mobile").val("");
    $("#customerName").val("");
  }

  function setCustomerIdHidden(obj) {
    $("#customer_id_hidden").val($(obj).attr("id"));
    $("#order_modal").load("/admin/loan/vieworderdetails.html");
    opendiv("order_modal");
  }
  function getlenderdetails(obj) {
    $("#customer_id_hidden").val($(obj).attr("id"));
    $("#order_modal").load("/admin/loan/lenderdetails.html");
    opendiv("order_modal");
  }

  function claim(obj) {
    var taskId = $(obj).attr("id");
    $.ajax({
      type : "POST",
      url : "/admin/todo?method=claim",
      dataType : "json",
      data : {
        taskId : taskId

      },
      success : function(data) {
        var data1 = eval(data);
        var code = data1.res;
        if (code) {
          layer.msg("操作成功!", {
            icon : 1,
            time : 1000
          }, function() {
            select();
            return true;
          });
        } else {
          {
            layer.msg("操作失败!");
            return false;
          }
        }
      },
      error : function() {
        layer.msg("未知错误!");
        return false;
      }

    });

  }
  //设为加急
  function addUrgent(oid) {

    if (commonToOpenDiv("edit_customer_id")) {
      commonSetHtml("alert_span", "确认将此订单设为加急么！");
      $("#confirm_a").attr("onclick", "confirmToBlackList()");
      opendiv('hmd_box');
    }

  }
  function confirmToBlackList() {
    $.ajax({
      url : "/admin/customer/addUrgent",
      data : "uuid=" + $("#edit_customer_id").val(),
      type : "post",
      dataType : "text",
      success : function(data) {
        if (data == 'success') {
          commonSetHtml("alert_span", "加急成功！");
          opendiv('hmd_box');
          $("#confirm_a").attr("onclick", "colsediv(0)");
        }
      }
    })
  }
  var param = function() {
    return {
      "dateRange" : $("#date1").text(),//时间范围
      "issue" : $("#issue").val(),//期数 
      "pledgeType" : $("#pledgeType_select").val(),//抵押方式
      "loanProduct" : $("#loanProduct_select").val(),//贷款产品
      "repayWay" : $("#repayWay_select").val(),//还款方式
      "minLoanMoney" : $("#minLoanMoney").val() * 10000,//最小金额
      "maxLoanMoney" : $("#maxLoanMoney").val() * 10000,//最大金额
      "company" : $("#company_select").val(),//分公司
      "dept" : $("#dept_select").val(),//部门
      "manager" : $("#user_select").val(),//客服经理
    };
  };

  function exportExcel() {
    var dateRange = $("#date1").text()
    {
      if (dateRange == '请选择坏账日期区间' || dateRange == '请选择开始日期') {
        dateStart = "";
        dateEnd = "";
      } else {
        var date = dateRange.split('至');
        dateStart = date[0];
        dateEnd = date[1];
      }
    }
    var src = "/admin/loan/exportBadLoanList?dateStart=" + dateStart
        + "&dateEnd=" + dateEnd + "&issue=" + $("#issue").val()
        + "&pledgeType=" + $("#pledgeType_select").val()
        + "&loanProduct=" + $("#loanProduct_select").val()
        + "&repayWay=" + $("#repayWay_select").val() + "&minLoanMoney="
        + $("#minLoanMoney").val() + "&maxLoanMoney="
        + $("#maxLoanMoney").val() + "&company="
        + $("#company_select").val() + "&dept="
        + $("#dept_select").val() + "&manager="
        + $("#user_select").val();
    $("#exportIframe").attr("src", src);
    $('#dc_tip').show();
  }
  //弹出框公共function
  function commonToOpenDiv(oid) {
    var edit_customer_id = $("#" + oid).val();
    if (null == edit_customer_id || "" == edit_customer_id) {
      commonSetHtml("alert_span", "请先选中一个客户！");
      opendiv('hmd_box');
      return false;
    } else {
      return true;
    }
  }
  function commonSetHtml(oid, html) {
    $("#" + oid).html(html);
  }
  //选择分公司绑定事件，获取部门信息
  $('#company_select').change(
      function(e) {
        $.post("/admin/dept/queryDeptComById", {
          companyId : this.value
        }, function(data) {
          $("#dept_select").empty().append(
              "<option value=''>选择业务部门</option>");
          for (var i = 0; i < data.length; i++) {
            $("#dept_select").append(
                "<option value="+data[i].id+">" + data[i].name
                    + "</option>");
          }
        }, "json")
      });
  $('#dept_select').change(
      function(e) {
        $.post("/admin/user/queryComIdDeptId", {
          companyId : $('#company_select').val(),
          deptId : this.value
        }, function(data) {
          $("#user_select").empty().append(
              "<option value=''>选择客户经理</option>");
          for (var i = 0; i < data.length; i++) {
            $("#user_select").append(
                "<option value="+data[i].uuid+">"
                    + data[i].realname + "</option>");
          }
        }, "json")
      });
</script>
</html>
