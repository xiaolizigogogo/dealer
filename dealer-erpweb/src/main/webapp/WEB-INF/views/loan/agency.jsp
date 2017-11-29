<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
<%
	String category = request.getParameter("category");
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible"
		  content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Cache-Control" content="no-transform">
	<title>e车贷管理系统-借款人基本信息</title>
	<%@include file="../common/taglibs.jsp"%>
	<script src="${basePath}/js/newtableutils.js"></script>
	<script src="${basePath }/js/loan/loanHelper.js"></script>
	<script src="${basePath }/js/Map.js"></script>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap/bootstrap.min.css"/>
	<link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css">
	<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
	<link rel="stylesheet" type="text/css" href="${basePath}/css/index.css"/>

</head>
<body>
<input type="hidden" value="<%=category %>"  id="category">
<input type="hidden" value=""  id="customer_id_hidden">
<input type="hidden" value=""  id="channel">
<div class="task_list"  id="loaninformation">
	<div class="row">
		<c:forEach items="${information}" var="infm">
			<div class="col-sm-4">
				<div class='tag'>
					<ul>
						<c:choose>
							<c:when test="${infm.state eq 'yes' && infm.isImportant eq '1'}">
								<ul class= 'list-inline tab_tip' ><li> 重点  </li>   <li class='tip_hot'>  加急   </li></ul></c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${infm.isImportant eq '1'}"><ul class= 'list-inline tab_tip' ><li> 重点</li></ul></c:when>
									<c:when test="${infm.state eq 'yes'}"><ul class= 'list-inline tab_tip' ><li class='tip_hot'>  加急   </li></ul></c:when>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</ul>
					<ul class='tag_con'>
						<li>
							<dl class='dl-horizontal'>
								<dt> 订单编号  </dt>
								<c:choose>
									<c:when test="${infm.loanStatus eq 'vehicleAssess'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'departLeadAduit'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'trialPhase'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'callBack'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes::>${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'visiteCheck'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'judgment'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'signContract'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'dataReview'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:when test="${infm.loanStatus eq 'lended'}">
										<dd><a  href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::yes:: >${infm.orderid}</a></dd>
									</c:when>
									<c:otherwise>
										<dd><a  href='#' onclick='setCustomerIdHidden(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.businesskey}:${infm.activityId}:${infm.repId}:${infm.customerId}: >${infm.orderid}</a></dd>
									</c:otherwise>
								</c:choose>
							</dl>
						</li>
						<li>
							<dl class='dl-horizontal'>
								<dt>客户名称</dt>
								<dd> ${infm.customerName}</dd>
							</dl>
						</li>
						<li>
							<dl class='dl-horizontal'>
								<dt>证件号</dt>
								<dd>${infm.idCard} </dd>
							</dl>
						</li>
						<li>
							<dl class='dl-horizontal'>
								<dt>客户经理</dt>
								<dd> ${infm.createBy}</dd>
							</dl>
						</li>
						<li>
							<dl class='dl-horizontal'>
								<dt>流程状态</dt>
								<dd>
									<c:if test="${infm.loanStatus=='vehicleAssess'}">待车辆评估</c:if>
									<c:if test="${infm.loanStatus=='departLeadAduit'}">待初审</c:if>
									<c:if test="${infm.loanStatus=='departLeadAduit_rejected'}">初审不通过</c:if>
									<c:if test="${infm.loanStatus=='trialPhase'}">待总部面审</c:if>
									<c:if test="${infm.loanStatus=='trialPhase_rejected'}">总部面审不通过</c:if>
									<c:if test="${infm.loanStatus=='callBack'}">待电话核实</c:if>
									<c:if test="${infm.loanStatus=='visiteCheck'}">待线下上门核实</c:if>
									<c:if test="${infm.loanStatus=='judgment'}">待总部终审</c:if>
									<c:if test="${infm.loanStatus=='judgment_rejected'}">总部终审不通过</c:if>
									<c:if test="${infm.loanStatus=='signContract'}">待线下签订相关合同</c:if>
									<c:if test="${infm.loanStatus=='signContract_rejected'}">签订合同终止</c:if>
									<c:if test="${infm.loanStatus=='dataReview'}">资料复核</c:if>
									<c:if test="${infm.loanStatus=='reuploadInformatin'}">资料或相关合同重新上传</c:if>
									<c:if test="${infm.loanStatus=='lended'}">待出账</c:if>
									<c:if test="${infm.loanStatus=='repayment'}">还款中</c:if>
									<c:if test="${infm.loanStatus=='end'}">已完结</c:if>
									<c:if test="${infm.loanStatus=='receivemoney'}">收款确认</c:if>
								</dd>
							</dl>
						</li>
					</ul>
					<div class='tag_bom clearfix'>
						借款金额:
						<b class="text-danger">${infm.applyMoney}</b>万
						<c:choose>
							<c:when test="${infm.assignee != '' && infm.assignee != null}">
								<c:choose>
									<c:when test="${infm.loanStatus eq 'vehicleAssess'}">
										<a class='pull-right' href='${basePath}/admin/todo?method=detail&taskId=${infm.taskId}'>处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'departLeadAduit'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'trialPhase'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus}>处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'callBack'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'visiteCheck'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'judgment'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'signContract'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'dataReview'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'lended'}">
										<a class='pull-right' href='#' onclick='loanAdministration(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:when test="${infm.loanStatus eq 'reuploadInformatin'}">
										<a class='pull-right' href='#' onclick='loanAdministrationEdit(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.activityId}:${infm.businesskey}::no:${infm.assignee}:${infm.loanStatus} >处理</a>
									</c:when>
									<c:otherwise>
										<a class='pull-right' href='#' onclick='setCustomerIdHidden(this)' id=${infm.uuid}:${infm.orderid}:${infm.taskId}:${infm.businesskey}:${infm.activityId}:${infm.repId}::${infm.assignee}>处理</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a class='pull-right' id=${infm.taskId} href='javascript:void(0);' onclick='claim(this)'>签收</a>
							</c:otherwise>
						</c:choose>

					</div>
				</div></div>
		</c:forEach></div>
</div>
<div id="r-page" class="col-sm-12"></div>
<div id="order_modal" class="modal fade in"></div>
<div id="qs_box1" class="modal modal_sml fade in">
	<div class="modal-header">
		<a type="button" href="javascript:void(0)" onclick="colsediv('qs_box1')"
		   class="close"><span aria-hidden="true">&times;</span></a>
		<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
	</div>
	<div class="modal-body">
		<p class="p_tip">
			<i class="fa fa-check-circle"></i>
				<span id="alert_message">

				</span>
		</p>
		<div class="btn_list clearfix">
			<a class="btn btn-danger btn-sm" href="javascript:void(0)"
			   onclick="colsediv('qs_box1')">取消</a>
			<a class="btn btn-default btn-sm"
			   href="javascript:void(0)" onclick="colsediv('qs_box1')" id="ok_button">确定</a>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="${basePath}/js/common.js"></script>
<script type="text/javascript">
	var map = new Map();
	$(function () {
		init();
	});
	function setCustomerIdHidden(obj,flag){
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		if(flag == "no"){
			loanDetailsTemp.channel = "no";
		}else{
			loanDetailsTemp.channel = "yes";
		}
		$("#channel").val(loanDetailsTemp.channel);
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/loanerDetail3.html");
		opendiv("order_modal");
	}
	function loanAdministration(obj,flag){
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		if(flag == "no"){
			loanDetailsTemp.channel = "yes";
		}else{
			loanDetailsTemp.channel = "no";
		}
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/loanerDetail2.html");
		opendiv("order_modal");
	}
	function loanAdministrationEdit(obj){
		var id = $(obj).attr("id");
		$("#customer_id_hidden").val(id);
		var loanDetailsTemp = map.get(id);
		loanDetailsTemp.channel = "no";
		map.put(id,loanDetailsTemp);
		$("#order_modal").load("/admin/loan/loanerDetailEditCYB.html");
		opendiv("order_modal");
	}
	function claim(obj) {
		var taskId = $(obj).attr("id");
		$.ajax({
			type: "POST",
			url: "/admin/todo?method=claim",
			dataType: "json",
			data: {
				taskId: taskId

			},
			success: function (data) {
				var data1 = eval(data);
				var code = data1.res;
				if (code) {
					layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
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
			error: function () {
				layer.msg("未知错误!");
				return false;
			}

		});

	}

	function init(){
		var category=$("#category").val();
		var mobile = $("#mobile").val();
		var name = $("#name").val();
		var idCard = $("#idCard").val();
		var customer_source = $("#customer_source").val();
		var latent = $("#latent").val();
		if ( ("" != category && null != category)) {
			var param = {
				category :category
			};
			onLoadDate(param);
		} else {
			onLoadDate(null);
		}
	}
	function select(){
		var category=$("#category").val();
		var param = {
			category :category
		};
		onLoadDate(param);
	}
	function onLoadDate(param) {
		var writetablefn = function (data)
		{
			var state="";
			var loanStatusStr="";
			//是否加急是否重点
			if(data.state=="yes" && data.is_important=="1"){
				state="<ul class= 'list-inline tab_tip' > <li> 重点  </li>   <li class='tip_hot'>  加急   </li>  </ul>"
			}else if(data.state=="yes"){
				state="<ul class= 'list-inline tab_tip' >  <li class='tip_hot'>  加急   </li>  </ul>"
			}else if(data.is_important=="1"){
				state="<ul class= 'list-inline tab_tip' > <li> 重点  </li> </ul>"
			}else{
				state=""
			}
			//贷前贷后
			var loanStatus = data.loan_status;
			var loanStatusStr = data.name;
			if('vehiclesLoans' == data.procKey){
				orderid="<a id="+data.uuid
						+ " onclick='loanAdministration(this,\"no\")' href='javascript:void(0);'>" + data.orderid + "</a>";
			}else{
				orderid="<a id="+data.uuid
						+ " onclick='setCustomerIdHidden(this,\"no\")' href='javascript:void(0);'>" + data.orderid + "</a>";
			}

			var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.orderId = data.orderid;
			loanDetails.taskId = data.taskId;
			loanDetails.assignee = data.assignee;
			loanDetails.activityId = data.activityId;
			loanDetails.repId = data.businessKey;
			loanDetails.customerId = data.customerId;

			var caozuo;
			if(data.assignee != null && data.assignee != ""){
				if((loanStatus == "vehicleAssess")||
						(loanStatus == "instock")){
					caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.loanMoney+"</b>"
							+ "<a class='pull-right' href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></div>";
				}else {
					if('vehiclesLoans' == data.procKey){
						if(loanStatus == "reuploadInformatin"){
							caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.loanMoney+"</b>"
							+"<a class='pull-right' href='#' onclick='loanAdministrationEdit(this)' id="+data.uuid+">处理</a></div>";
						}else{
							caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.loanMoney+"</b>"
							+"<a class='pull-right' href='#' onclick='loanAdministration(this,\"yes\")' id="+data.uuid+" >处理</a></div>";
						}
					}else{
						caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.loanMoney+"</b>"
								+ "<a class='pull-right' href='#' onclick='setCustomerIdHidden(this,\"yes\")' id="+data.uuid+">处理</a></div>";
					}
				}
			} else{
				caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\">"+data.loanMoney+"</b>"
						+ "<a class='pull-right' id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a> </div>";
			}

			var div=" <div class='col-sm-4' id="+data.uuid+"><div class='tag'>  "
					+ state + " <ul class='tag_con'>  <li> <dl class='dl-horizontal'> "
					+ "<dt> 订单编号  </dt> &nbsp; &nbsp; "+ orderid + "</a> </dl> </li>"
					+" <li> <dl class='dl-horizontal'> <dt>客户名称</dt> <dd> "+data.customer_name+"</dd> </dl> </li>"
					+" <li> <dl class='dl-horizontal'> <dt>证件号</dt> <dd> "+data.customerIdCard+"</dd> </dl> </li>"
					+" <li> <dl class='dl-horizontal'> <dt>客户经理</dt> <dd> "+data.create_by+"</dd> </dl> </li>"
					+" <li> <dl class='dl-horizontal'> <dt >流程状态</dt> <dd id=status_"+data.uuid+"> "+loanStatusStr+"</dd> </dl> </li>"
					+caozuo+" </ul></div></div> ";

			map.put(data.uuid.toString(),loanDetails);

			return div;
		};
		paging("${basePath}/admin/loan/queryworkspacelist", param == null ? {} : param, writetablefn, "loaninformation", 17);
	}

</script>
</html>


