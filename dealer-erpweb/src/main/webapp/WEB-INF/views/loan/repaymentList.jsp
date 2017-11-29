<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>e车贷管理系统—还款管理</title>
    <%@include file="../common/taglibs.jsp"%>
    <link rel="stylesheet"
          href="${basePath}/css/bootstrap-datetimepicker.min.css">
    <%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <link rel="stylesheet" href="${basePath}/css/lightbox.min.css" >
    <script src="${basePath}/js/lightbox.js" ></script>
    <script src="${basePath}/js/loan/loanHelper.js" ></script>
    <script src="${basePath}/js/Map.js" ></script>

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
<div class="tools_bar col-lg-12">
    <div class="clearfix">
        <form class="form-inline pull-left" role="form">
            <input type="hidden" value="<%=searchDate%>" id="searchDate" /> <input
                type="hidden" id="status_hidden" />
            <input type="hidden" value="" id="edit_customer_id" />
            <input type="hidden" value="" id="statusnew">
            <input type="hidden" value=""  id="customer_id_hidden">
            <input type="hidden" value=""  id="taskId_hidden">
            <input type="hidden" value="" id="processDefinitionId_hidden">
            <!--默认本月-->
            <div class="form-group">
                <label class="sr-only" for="txt_name">年/月</label>
                <div id="dddd" class="input-group date form_date" data-date=""
                     data-date-format="yyyy-mm-dd" data-link-field="purchaseDate"
                     data-link-format="yyyy-mm-dd" style="width: 160px;">
                    <input id="date1" class="form-control valid" value="" readonly=""
                           style="width: 100%;" type="text"> <span
                        class="input-group-addon"><span
                        class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
            <div class="form-group">
                <label class="sr-only" for="txt_name">合同 号</label> <input
                    type="text" class="form-control" id="txt_contractNum"
                    placeholder="请输入合同号">
            </div>
            <div class="form-group">
                <label class="sr-only" for="txt_number">客户姓名</label> <input
                    type="text" class="form-control" id="txt_name" placeholder="客户姓名">
            </div>

            <div class="form-group">
                <select id="repayStatus_select" class="form-control">
                    <option value="">是否还款</option>
                    <option value="true">已还款</option>
                    <option value="false">未还款</option>
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
                    id="btn-submit" onclick="select()">
                <i class="fa fa-search"></i> 搜索
            </button>
        </form>
    </div>
    <div class="tj_box clearfix" style="margin-top: 10px;" id="info_div"></div>
    <div class="list_btn">
        <ul class="list-inline">
            <!-- <li><a class="btn btn-danger"   href = "javascript:void(0)"  onclick="opendiv(0)"> <i class="fa fa-plus"></i>新增</a></li>-->

            <li><a class="btn btn-danger" href="javascript:void(0)"
                   id="dc_btn" onclick="exportExcel();"> <i class="fa fa-download"></i>导出文件
            </a></li>
            <li><a class="btn btn-danger"   href = "#" onclick="BatchRepayment()"> <i class="fa fa-users"></i>批量处理</a></li>
        </ul>
    </div>
</div>
<div class="list_box col-sm-12">
    <table data-toggle="table" class="table table-bordered table-striped">
        <thead>
        <tr><th><input type="checkbox" name="checkboxAll" id="checkAll" onclick="selectAll()"></th>
            <th>客户经理</th>
            <th>订单号</th>
			<th>合同号</th>
            <th>客户姓名</th>
            <th>贷款期限</th>
            <th>还款日</th>
            <th>贷款金额</th>
            <th>贷款余额</th>
            <th>应还本金</th>
            <th>逾期滞纳金</th>
            <th>合计</th>
            <th>实还金额</th>
			<th>当前应还日期</th>
			<th>当前节点</th>
            <th>操作</th>
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
<div id="order_modal" class="modal fade in"></div>
<div id="qs_box1" class="modal modal_sml fade in">
    <div class="modal-header">
        <a type="button" href="javascript:void(0)"
           onclick="colsediv('qs_box1')" class="close"><span
                aria-hidden="true">&times;</span></a>
        <h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
    </div>
    <div class="modal-body">
        <p class="p_tip">
            <i class="fa fa-check-circle"></i> <span id="alert_message">

        </span>
        </p>
        <div class="btn_list clearfix">
            <a class="btn btn-danger btn-sm" href="javascript:void(0)"
               onclick="colsediv('qs_box1')">取消</a> <a
                class="btn btn-default btn-sm" href="javascript:void(0)"
                onclick="colsediv('qs_box1')" id="ok_button">确定</a>
        </div>
    </div>
</div>
<div id="fade2" class="black_overlayx"></div>
<iframe src="" style="display: none;" id="exportIframe"> </iframe>
</body>
<script type="text/javascript">
    var map = new Map();
    //1.初始化页面 init方法,第一次请求不需要设置参数，需要设置页面初始化数据
    $(function() {
		
        init();
		//alert($("#date1").val());
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
        $("#date1").val(new Date().Format("yyyy-MM-dd"));
		
        //将查询结果集写入到页面
        onLoadDate(null);
    }
    function onLoadDate(param) {
        var money = 0;
		
        $("#info_div").empty().append(
                "订单数<b class='text-danger'>" + 0
                + "单</b>，应该还款总额 <b class='text-danger'>"
                + money.toFixed(2)
                + "万元</b>，实际还款总额<b class='text-danger'>"
                + money.toFixed(2) + "万元</b>");
        var writetablefn = function(data) {
            $("#noloanorder").html(data.noloanorder);
            var context;
            $("#checkAll").prop("checked", false);
            var isImportant = "";
            if (data.isImportant == "1") {
                isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }
            var caozuo = '';
            //标记改订单是否可以操作，如果可以操作，则设置checkbox状态为enable
            //如果不可以操作，设置为disalbed属性。
            var canOperation = "disabled='disabled'";

            var loanDetailsAll = {};
            loanDetailsAll.uuid = data.uuid;
            loanDetailsAll.contractNum = data.contractNum;
            loanDetailsAll.activityId = data.activityId;
            loanDetailsAll.orderId = data.orderId;
            loanDetailsAll.customerId = data.customerId;
            loanDetailsAll.userId = data.userId;
			var yhsj = (new Date(data.lastRepayDate.substring(0,10))).getTime();
				var dates = $("#date1").val();
				var xzsj = new Date(dates).getTime(); 
				var cha = xzsj - yhsj;
            //当前订单状态对应的操作选项
            if ((data.repaymentStatus == 5||data.repaymentStatus==6
                    ||data.repaymentStatus==7||data.repaymentStatus==41||data.repaymentStatus==48||data.repaymentStatus==52
                        ||data.repaymentStatus==20||data.repaymentStatus==21||data.repaymentStatus==44)&&data.taskId!='') {
				
				
                if ((data.assignee == null || data.assignee == '')) {
                    caozuo = "<a id="
                            + data.taskId
                            + " href='javascript:void(0);' onclick='claim(this)'>签收</a>";
                    canOperation = "";
                } else {
                    if (data.userId == data.assignee){
                        caozuo = "<a href='#' onclick='setCustomerIdHidden(this,\"yes\")' id="+ data.uuid+">还款</a>"
                    }else {
                        caozuo = data.repayStatus
                    }
                    canOperation = "";
                }
            }
            else if(data.repayStatus != null || data.repayStatus != ''){
				
				//alert($("#date1").val().replace("-","")+"***"+(data.repayDate).replace("-","").substring(0,9));
					
				//var dd = parseInt($("#date1").val().substring(8,10));
				//alert(dd);
					
				//alert(cha);
				
					caozuo=data.repayStatus;
                
            }
            else
            {
                caozuo = "不能进行还款";
            }
            if(data.workName==null||data.workName==""){
				data.workName = "--";
			}
            context = "<tr id="
                    + data.uuid
                    + " onclick='setEditCustomer(this)'>"
                    +"<td align='center'><input type='checkbox' onclick='paramClick()' name='checkbox1' value='"
                    + data.repaymentId+"' id='"
                    +data.taskId+"' "+canOperation+"></td>"
                    + "<td>"
                    + data.managerName
                    + "</td>"
                    + "<td>"
                    + "<a id="
                    + data.uuid + " onclick='setCustomerIdHidden2(this,\"no\")' href='javascript:void(0);'>"
                    + data.orderId
                    + "</a>"
                    + "</td>"
					+ "<td>"
					+ "<a id="
                    + data.uuid + " onclick='setCustomerIdHidden2(this,\"no\")' href='javascript:void(0);'>"
					+ data.contractNum
					+ "</a>"
					+ "</td>"
                    + "<td>"
                    + isImportant
                    + "<a id="
                    + data.uuid + " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
                    + data.customerName + "</a></td>" + "<td>"
                    + data.gmtFirstRepayment + "-" + data.gmtRepaymentEnded
                    + "</td>" + "<td>" + data.gmtActualRepay + "</td>" + "<td>"
                    + data.loanMoney + "</td>" + "<td>" + data.restLoanMoney
                    + "</td>" + "<td>"
                    + data.repayCapital + "</td>"
                    + "<td>" + data.overdueFee + "</td>" + "<td>"
                    + data.sumMoney + "</td>" + "<td>"
                    + data.actualRepaymentSum + "</td>" 
					+ "<td>" + data.lastRepayDate.substring(0,10) +"</td>"
					+ "<td>" + data.workName +"</td>"
					+ "<td>" + caozuo +"</td>";

            $("#info_div").empty().append(
                    "订单数<b class='text-danger'>" + data.orderCount
                    + "单</b>，应该还款总额 <b class='text-danger'>"
                    + (data.repaySum / 10000).toFixed(2)
                    + "万元</b>，实际还款总额<b class='text-danger'>"
                    + (data.actualRepaymentSumSum / 10000).toFixed(2)
                    + "万元</b>");

            map.put(data.uuid.toString(),loanDetailsAll);
            return context;
        };

        pageComm("${basePath}/admin/loan/queryRepaymentInfoList",
                param == null ? {} : param, writetablefn, "record", 17);

    }

    var param = function() {
        var date = $("#date1").val();
		//alert(date);
        return {
            "dateRange" : date,//时间范围
            "contractNum" : $("#txt_contractNum").val(),//订单号
            "customerName" : $("#txt_name").val(),//客户姓名
            "repayStatus" : $("#repayStatus_select").val(),//是否还款
            "company" : $("#company_select").val(),//分公司
            "dept" : $("#dept_select").val(),//部门
            "manager" : $("#user_select").val(),//客服经理
        };
    }
    function assignment(obj) {
        $("#statusnew").val($(obj).attr("id"));
        select();
    }
    function select() {
        onLoadDate(param());
    }

    function reset() {
        $("#mobile").val("");
        $("#customerName").val("");
    }

    function setCustomerIdHidden(obj,flag) {
        var id = $(obj).attr("id");
        $("#customer_id_hidden").val(id);
        var loanDetailsTemp = map.get(id);
        if ("yes" == flag){
            loanDetailsTemp.channel = "yes";
        } else {
            loanDetailsTemp.channel = "no";
        }
        map.put("loanDetailsAll",loanDetailsTemp);
        $("#order_modal").load("/admin/loan/loanerDetail3.html");
        opendiv("order_modal");
    }
    function setCustomerIdHidden2(obj,flag) {
        var id = $(obj).attr("id");
        $("#customer_id_hidden").val(id);
        var loanDetailsTemp = map.get(id);
        if ("yes" == flag){
            loanDetailsTemp.channel = "yes";
        } else {
            loanDetailsTemp.channel = "no";
        }
        map.put("loanDetailsAll",loanDetailsTemp);
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
    /**
     * 全部选中或取消全选
     */
    function selectAll() {
        var isChecked = $("#checkAll").prop("checked");
        if (isChecked) {
            $("[name='checkbox1'][disabled!='disabled']").prop("checked", true);//全选
        } else {
            $("[name='checkbox1']").prop("checked", false);//取消全选
        }
    }
    /**
     * 判断子选则框是否有全部选中。如果没有则去将全选的checkbox置为false
     */
    function paramClick() {
        var boxLength = $("[name='checkbox1'][disabled!='disabled']").length;
        var checkLength = $("input[name='checkbox1'][disabled!='disabled']:checked").length;
        if (boxLength == checkLength && boxLength != 0) {
            $("#checkAll").prop("checked", true);
        } else {
            $("#checkAll").prop("checked", false);
        }
    }
    function BatchRepayment() {
        var checkbox = $('input[name="checkbox1"][disabled!="disabled"]:checked');
        var checkLength = checkbox.length;
        if (checkLength == 0) {
            layer.msg("请选择数据进行批量还款确认！");
            return;
        }
        var checkValues = [];
        var activitiList = [];
        var i = 0;
        checkbox.each(function () {
            checkValues[i] = this.value;
            activitiList[i] = this.id;
            i++;
        });
        var dialogMsg = "你确定要进行批量还款确认吗？";
        alertMessage(dialogMsg,'batchRepaymentNow("'+checkValues+'","'+activitiList+'")','qs_box1');

    }
    function batchRepaymentNow(checkvalue,activitiList){
        $.ajax({
            type: 'POST',
            url: '${basePath}/admin/loan/batchrepay.html',
            data:{
                "taskIdList":checkvalue,
                "activitiList":activitiList
            },
            dataType: "text",
            success: function (data) {
                if (data == '0000') {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        colsediv(0);
                        onLoadDate(null);
                        return true;
                    });
                } else {
                    colsediv(0);
                    layer.msg("操作失败!");
                    return false;
                }
            }, error: function () {
                colsediv(0);
                layer.msg("网络错误!");
                return false;
            }
        });
    }
</script>
</html>
