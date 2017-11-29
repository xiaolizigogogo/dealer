//1.初始化页面 init方法,第一次请求不需要设置参数，需要设置页面初始化数据
$(function() {
	init();
});
// 初始化方法,调用queryBadLoanList接口，将返回的一系列信息添加到下拉选择框中,并将查询到的数据绑定到页面，需要分页
function init() {
	// 获取页面下拉框中数据
	$.get("/admin/company/queryCompanyList", function(data) {
		for (var i = 0; i < data.length; i++) {
			$("#company_select").append(
					"<option value=" + data[i].id + ">" + data[i].name
							+ "</option>");
		}
	});
	// 将查询结果集写入到页面
	onLoadDate(null)
}
function onLoadDate(param) {
	var money = 0;
	$("#info_div").empty().append(
			"订单数<b class='text-danger'>" + 0
					+ "单</b>，应该还款总额 <b class='text-danger'>" + money.toFixed(2)
					+ "万元</b>，实际还款总额<b class='text-danger'>" + money.toFixed(2)
					+ "万元</b>");
	var writetablefn = function(data) {
		$("#noloanorder").html(data.noloanorder);
		var context;
		$("#checkAll").prop("checked", false);
		var isImportant = "";
		if (data.isImportant == "1") {
			isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
		}
		context = "<tr id="
				+ data.uuid
				+ " onclick='setEditCustomer(this)'>"
				+ "<td>"
				+ data.managerName
				+ "</td>"
				+ "<td>"
				+ "<a id="
				+ data.uuid
				+ ":"
				+ data.orderId
				+ ":"
				+ data.taskId
				+ ":"
				+ data.activityId
				+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>"
				+ data.orderId
				+ "</a>"
				+ "</td>"
				+ "<td>"
				+ isImportant
				+ "<a id="
				+ data.uuid
				+ ":"
				+ data.orderId
				+ ":"
				+ data.taskId
				+ ":"
				+ data.activityId
				+ ":"
				+ data.repId
				+ ":"
				+ ":"
				+ data.customerId
				+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>"
				+ data.customerName + "</a></td>" + "<td>" + data.loanMoney
				+ "</td>" + "<td>" + data.gmtFirstRepayment + "-"
				+ data.gmtRepaymentEnded + "</td>" + "<td>"
				+ data.restLoanMoney + "</td>" + "<td>"
				+ data.repayCapital.add(data.repayInterest) + "</td>" + "<td>"
				+ data.overdueFee + "</td>" + "<td>" + data.sumMoney + "</td>"
				+ "<td>" + data.actualRepaymentSum + "</td>" + "<td>"
				+ data.gmtActualRepay + "</td>";

		$("#info_div").empty().append(
				"订单数<b class='text-danger'>" + data.orderCount
						+ "单</b>，应该还款总额 <b class='text-danger'>"
						+ (data.repaySum / 10000).toFixed(2)
						+ "万元</b>，实际还款总额<b class='text-danger'>"
						+ (data.actualRepaymentSumSum / 10000).toFixed(2)
						+ "万元</b>");
		return context;
	};

	pageComm("/admin/loan/queryRepaymentInfoList", param == null ? {} : param,
			writetablefn, "record", 17);

}

var param = function() {
	var date = $("#date1").val().replace("-", "");
	return {
		"dateRange" : date,// 时间范围
		"orderId" : $("#txt_orderid").val(),// 订单号
		"customerName" : $("#txt_name").val(),// 客户姓名
		"repayStatus" : $("#repayStatus_select").val(),// 是否还款
		"company" : $("#company_select").val(),// 分公司
		"dept" : $("#dept_select").val(),// 部门
		"manager" : $("#user_select").val(),// 客服经理
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
// 设为加急
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

// 弹出框公共function
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
// 选择分公司绑定事件，获取部门信息
$('#company_select').change(
		function(e) {
			$.post("/admin/dept/DeptComById", {
				companyId : this.value
			}, function(data) {
				$("#dept_select").empty().append(
						"<option value=''>选择业务部门</option>");
				for (var i = 0; i < data.length; i++) {
					$("#dept_select").append(
							"<option value=" + data[i].id + ">" + data[i].name
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
							"<option value=" + data[i].uuid + ">"
									+ data[i].realname + "</option>");
				}
			}, "json")
		});

function exportExcel() {
	var date = $("#date1").val().replace("-", "");
	var src = "/admin/loan/exportRepaymentInfoList?dateRange=" + date
			+ "&orderId=" + $("#txt_orderid").val() + "&repayStatus="
			+ $("#repayStatus_select").val() + "&company="
			+ $("#company_select").val() + "&dept=" + $("#dept_select").val()
			+ "&manager=" + $("#user_select").val() + "&customerName="
			+ encodeURIComponent(encodeURIComponent($("#txt_name").val()));
	$("#exportIframe").attr("src", src);
	$('#dc_tip').show();

}
var dateRange1 = new pickerDateRange(
		'date1', {
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