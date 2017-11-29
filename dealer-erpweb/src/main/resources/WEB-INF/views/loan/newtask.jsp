<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="basePath" value="<%= request.getContextPath() %>" />
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
<!-- <link rel="stylesheet" -->
<%-- 	href="${basePath}/css/bootstrap-datetimepicker.min.css"> --%>
<%-- <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script> --%>
<%-- <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script> --%>
<%-- <script src="${basePath}/js/datetimepicker.js"></script> --%>
<%-- <script src="${basePath}/js/jquery.validate.js"></script> --%>
<script src="${basePath}/js/newtableutils.js"></script>

<link rel="stylesheet" type="text/css" href="${basePath}/css/bootstrap/bootstrap.min.css"/>
<link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${basePath}/css/libs/font-awesome.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/css/index.css"/>


</head>
<body>
<input type="hidden" value=""  id="customer_id_hidden">
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
	</c:forEach>
    </div>
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
<%-- <script type="text/javascript" src="${basePath}/js/jquery.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/bootstrap.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/scripts.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/pace.min.js"></script> --%>
<%-- <script type="text/javascript" src="${basePath}/js/tab-control.js"></script> --%>
<script type="text/javascript">
	$(function () {
		init();
	});
	function setCustomerIdHidden(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/loanerDetail3.html");
		opendiv("order_modal");
	}
	function loanAdministration(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/loanerDetail2.html");
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
			onLoadDate(null);
		}
        function select(){
        onLoadDate(null);
        }
		function onLoadDate(param) {
        var writetablefn = function (data)
		{     
        	   var information=data.information;
			   var loaninformation="";
			   var state="";
			   var loanStatusStr="";
				    //是否加急是否重点
				    if(data.state=="yes" && data.isImportant=="1"){
				    	state="<ul class= 'list-inline tab_tip' > <li> 重点  </li>   <li class='tip_hot'>  加急   </li>  </ul>"
				    }else if(data.state=="yes"){
				    	state="<ul class= 'list-inline tab_tip' >  <li class='tip_hot'>  加急   </li>  </ul>"
				    }else if(data.isImportant=="1"){
				    	state="<ul class= 'list-inline tab_tip' > <li> 重点  </li> </ul>"
				    }else{
				    	state=""
				    	}
			 	//贷前贷后
				    var loanStatus = data.loanStatus;
					var loanStatusStr = "";
					if (loanStatus == "vehicleAssess") {
						loanStatusStr = "待车辆评估";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "departLeadAduit") {
						loanStatusStr = "待初审";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "departLeadAduit_rejected") {
						loanStatusStr = "初审不通过";
					} else if (loanStatus == "trialPhase") {
						loanStatusStr = "待总部面审";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "trialPhase_rejected") {
						loanStatusStr = "总部面审不通过";
					} else if (loanStatus == "callBack") {
						loanStatusStr = "待电话核实";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "visiteCheck") {
						loanStatusStr = "待线下上门核实";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "judgment") {
						loanStatusStr = "待总部终审";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "judgment_rejected") {
						loanStatusStr = "总部终审不通过";
					} else if (loanStatus == "signContract") {
						loanStatusStr = "待线下签订相关合同";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "signContract_rejected") {
						loanStatusStr = "签订合同终止";
					} else if (loanStatus == "dataReview") {
						loanStatusStr = "资料复核";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "reuploadInformatin") {
						loanStatusStr = "资料或相关合同重新上传";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "lended") {
						loanStatusStr = "待出账";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
		                        + " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "repayment") {
						loanStatusStr = "还款中";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.businesskey+":"+data.activityId+":"+data.repId+":"+data.customerId+":"
		                    + " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "end") {
						loanStatusStr = "已完结";
					} else if (loanStatus == "mortgage") {
						loanStatusStr = "待办理抵押";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "instock") {
						loanStatusStr = "待办理入库";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "reloanReview") {
						loanStatusStr = "待再贷资料复核";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "reloanApprove") {
						loanStatusStr = "待再贷审批";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "reloanE_Contract") {
						loanStatusStr = "待再贷电子合同签订";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "reloan_lended") {
						loanStatusStr = "待再贷放款";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "helploanReview") {
						loanStatusStr = "待助贷资料复核";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "helploanApprove") {
						loanStatusStr = "待助贷审批";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "helploanE_Contract") {
						loanStatusStr = "待助贷电子合同签订";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					} else if (loanStatus == "helploan_lended") {
						loanStatusStr = "待助贷放款";
						orderid="<a id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::yes::"
								+ " onclick='loanAdministration(this)' href='javascript:void(0);'>" + data.orderid + "</a>";
					}
					var caozuo;	    
						if(data.assignee != null && data.assignee != ""){
		            	if(loanStatus == "vehicleAssess"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        + "<a class='pull-right' href='${basePath}/admin/todo?method=detail&taskId="+data.taskId+"'>处理</a></div>";
		            	}else if(loanStatus == "departLeadAduit"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		            		        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "trialPhase"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "callBack"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		            		        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>" 
		            	}else if(loanStatus == "visiteCheck"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "judgment"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "signContract"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "dataReview"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "reuploadInformatin"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if(loanStatus == "lended"){
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
			                        +"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
		            	}else if((loanStatus == "mortgage")||
								(loanStatus == "instock")||
								(loanStatus == "reloanReview")||
								(loanStatus == "reloanApprove")||
								(loanStatus == "reloanE_Contract")||
								(loanStatus == "reloan_lended")||
								(loanStatus == "helploanReview")||
								(loanStatus == "helploanApprove")||
								(loanStatus == "helploanE_Contract")||
								(loanStatus == "helploan_lended"))
						{
							caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
									+"<a class='pull-right' href='#' onclick='loanAdministration(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.activityId+":"+data.businesskey+"::no:"+data.activityId+":"+data.loanStatus+" >处理</a></div>"
						} else{
		            		caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\"> "+data.applyMoney+"</b>万"
		                        + "<a class='pull-right' href='#' onclick='setCustomerIdHidden(this)' id="+data.uuid+":"+data.orderid+":"+data.taskId+":"+data.businesskey+":"+data.activityId+":"+data.repId +"::"+data.assignee+" >处理</a></div>";
		            	}
					}else{
						caozuo ="<div class='tag_bom clearfix'>借款金额:<b class=\"text-danger\">"+data.applyMoney+"</b>万"
	                        + "<a class='pull-right' id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a> </div>";
//	 					caozuo =  "<a id="+data.taskId+" href='javascript:void(0);' onclick='claim(this)'>签收</a>"; 
					}
					
					var div=" <div class='col-sm-4'><div class='tag'>  "
				            + state + " <ul class='tag_con'>  <li> <dl class='dl-horizontal'> "
				            + "<dt> 订单编号  </dt> &nbsp; &nbsp; "+ orderid + "</a> </dl> </li>"
				            +" <li> <dl class='dl-horizontal'> <dt>客户名称</dt> <dd> "+data.customerName+"</dd> </dl> </li>"
				            +" <li> <dl class='dl-horizontal'> <dt>证件号</dt> <dd> "+data.idCard+"</dd> </dl> </li>"
				            +" <li> <dl class='dl-horizontal'> <dt>客户经理</dt> <dd> "+data.createBy+"</dd> </dl> </li>"
				            +" <li> <dl class='dl-horizontal'> <dt>流程状态</dt> <dd> "+loanStatusStr+"</dd> </dl> </li>"
// 				            +" <li> <dl class='dl-horizontal'> <dt>借款金额</dt> <dd> "+data.applyMoney+"万 </dd> </dl> </li> "
				            +caozuo+" </ul></div></div> ";
			return div;	
		};
        paging("${basePath}/admin/loan/querynewtask", param == null ? {} : null, writetablefn, "loaninformation", 17);
	}
		
		
		
			</script> 
</html>

