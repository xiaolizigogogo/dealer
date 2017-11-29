<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=edge; chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Cache-Control" content="no-transform">
    <title>e车贷管理系统—还款修改</title>
    <%@include file="../common/taglibs.jsp" %>
    <link rel="stylesheet" href="${basePath}/css/bootstrap-datetimepicker.min.css">
<%--     <link rel="stylesheet" href="${ basePath }/css/bootstrap/bootstrap-table.css"> --%>
    <script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${basePath}/js/datetimepicker.js"></script>
    <script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
    <script src="${basePath}/js/tableutils.js"></script>
    <script src="${basePath}/js/common.js"></script>
    <script src="${basePath}/js/Map.js"></script>
	
    <style type="text/css">
    .table > tbody > tr > td.tr_back,.table-striped > tbody > tr:nth-child(odd) > td.tr_back, .table-striped > tbody > tr:nth-child(odd) > th.tr_back{background-color:#FCF8E3; !important;}
</style>
</head>
<body>
    <input type="hidden" value="" id="loanstatus" />
    <input type="hidden" value="" id="state"/>
    <input type="hidden" value="" id="edit_customer_id"/>
    <input type="hidden" value=""  id="statusnew">
	<input type="hidden" value=""  id="customer_id_hidden">
	<input type="hidden" value=""  id="taskId_hidden">
	<input type="hidden" value=""  id="processDefinitionId_hidden">
	<div class="tools_bar col-lg-12">
  <div class="tj_box clearfix">
    <div class="col-sm-12 row">
    <div class="col-sm-3">
        <ul>
          <li class="active"><a href="#"  onclick="queryAll(this)"  >全部订单</a> <span class="badge" id="count"></span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#"  onclick="assignment(this)" id="front" >贷前订单</a> <span class="badge" id="countFront"></span></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <ul>
          <li><a href="#"  onclick="assignment(this)" id="back" >贷后还款中订单</a> <span class="badge" id="countBack"></span></li>
        </ul>
      </div>
      <div class="col-sm-3">
       <ul>
          <li><a href="#"  onclick="querystate(this)" id="end" >已完成订单</a> <span class="badge" id="countEnd"></span></li>
        </ul>
      </div>
    </div>
  </div>
		<div class="clearfix">
			<form class="form-inline pull-left" role="form">
				<div class="form-group">
					<label class="sr-only" for="txt_name">订单号</label> <input
						type="text" class="form-control" id="orderNo" name="orderNo"
						placeholder="请输入订单号">
				</div>
				<div class="form-group">
					<label class="sr-only" for="txt_number">客户姓名</label> <input
						type="text" class="form-control" id="customerName"
						name="customerName" placeholder="客户姓名">
				</div>
<!-- 				<div class="form-group"> -->
<!-- 					<label class="sr-only" for="txt_tel">客户经理</label> <input -->
<!-- 						type="text" class="form-control" id="customerManage" -->
<!-- 						name="customerManage" placeholder="客户经理"> -->
<!-- 				</div> -->
				<div class="form-group">
					<div class="input-group date form_date" data-date=""
                                 data-date-format="yyyy-mm-dd"
                                 data-link-field="searchDate"
                                 data-link-format="yyyy-mm-dd" style="width:200px;">
                <input class="form-control" type="text" value="" readonly style="width:100%;"  id="time" >
                <span class="input-group-addon"><span
                                        class="glyphicon glyphicon-calendar"></span></span> </div>
              <input type="text" hidden="hidden" id="searchDate"
                                               name="searchDate" />
				</div>
				<button type="button" onclick="select()"
					class="btn btn-primary btn-search">
					<i class="fa fa-search"></i> 搜索
				</button>
			</form>
				
		</div>
	</div>
	<div id="hmd_box" class="modal modal_sml fade in">
		<div class="modal-header">
			<a type="button" href="javascript:void(0)" onclick="colsediv(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">提示</h4>
		</div>
		<div class="modal-body">
			<p class="p_tip">
				<i class="fa fa-question-circle"></i> <span id="alert_span"></span>
			</p>
			<div class="btn_list clearfix">
				<a class="btn btn-danger btn-sm" href="javascript:void(0);" id="confirm_a"
					onclick="colsediv(0)">确认</a><a class="btn btn-default btn-sm"
					href="javascript:void(0)" onclick="colsediv(0)">取消</a>
			</div>
		</div>
	</div>
	<div class="list_box col-sm-12">
		<table data-toggle="table" class="table table-bordered table-striped" id="list_countlist">
			<thead>
				<tr>
					<th>订单号</th>
					<th>客户姓名</th>
					<th>贷款金额</th>
					<th>抵押方式</th>
					<th>还款方式</th>
					<th>客户经理</th>
					<th>团队经理</th>
					<th>任务节点</th>
					<th>任务签收人</th>
					<th>生成时间</th>
					
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
		<ol class="ui-step ui-step-red ui-step-10">
			<li class="step-start step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">1</span> <span
						class="ui-step-cont-text">申请贷款</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">2</span> <span
						class="ui-step-cont-text">评估</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">3</span> <span
						class="ui-step-cont-text">初审</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">4</span> <span
						class="ui-step-cont-text">面审</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">5</span> <span
						class="ui-step-cont-text">电话核实</span>
				</div>
			</li>
			<li class="step-done">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">6</span> <span
						class="ui-step-cont-text">签订合同</span>
				</div>
			</li>
			<li class="step-active">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">7</span> <span
						class="ui-step-cont-text">家访</span>
				</div>
			</li>
			<li class="">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">8</span> <span
						class="ui-step-cont-text">终审</span>
				</div>
			</li>
			<li class="">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">9</span> <span
						class="ui-step-cont-text">复核</span>
				</div>
			</li>
			<li class="step-end">
				<div class="ui-step-line"></div>
				<div class="ui-step-cont">
					<span class="ui-step-cont-number">10</span> <span
						class="ui-step-cont-text">出账</span>
				</div>
			</li>

		</ol>
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
	<div id="user_modal" class="modal  fade in " style="width: 1200px; height: 800px;background: rgb(238, 238, 238);"></div>
	<iframe src="" style="display:none;" id="exportIframe">
	</iframe>
</body>
<script>
// 	function opendiv() {
// 		$(".modal").css("display", "block");
// 		$("#fade2").css("display", "block");
// 		//	    parent.document.getElementById('fade1').style.display='block';

// 	}
// 	//关闭模态框
// 	function colsediv() {
// 		$(".modal").css("display", "none");
// 		$("#fade2").css("display", "none");
// 		//	    parent.document.getElementById('fade1').style.display='none';
// 	}
</script>
<script type="text/javascript">



	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	var CountStatus = "count";
	var map = new Map();
    $(function () {
		init();
        $("#pledgeType").find('option[value="' + currentpledgeType + '"]').attr("selected", true);
        if(window.location.href.indexOf("type=1")>=0){
			//动态增加表头
			$("#list_countlist>thead>tr").append("<th>操作</th>")
        }
	});

	function init() {
		
		$.ajax({
			url:"${basePath}/admin/loan/queryStateCount",
			type:"get",
			datatype:"json",
			success:function(data){
			    $("#count").html(data.count);
				$("#countFront").html(data.countFront);
				$("#countBack").html(data.countBack);
				$("#countEnd").html(data.countEnd);
			}
		})

		var customerName = $("#customerName").val();
		var orderNo = $("#orderNo").val();
		var customerManage = $("#customerManage").val();
		var pledgeType = $("#pledgeType").val();
		var searchDate=$("#searchDate").val();
		var statusnew = $("#statusnew").val();
	    var state=$("#state").val();
	    var loanstatus=$("#loanstatus").val();

        if ( ("" != currentReviewLoanStatus && null != currentReviewLoanStatus)
                || ("" !== customerName && null !== customerName) ||  ("" !== orderNo && null !== orderNo)
                || ("" !== customerManage && null !== customerManage) || ("" !== pledgeType && null !== pledgeType)) {
			var param = {
			     
                "status": currentReviewLoanStatus,
                "customerName": customerName,
                "customerManage":customerManage,
                "pledgeType":pledgeType,
                "searchDate":searchDate,
                "orderNo":orderNo,
                "statusnew":statusnew,
                "state":state,
                "loanstatus":loanstatus
			};
			onLoadDate(param);
		} else {
			onLoadDate({
                "status": currentReviewLoanStatus
			});
		}
	}

	function onLoadDate(param) {
        var writetablefn = function (data)

		{
        	$("#noloanorder").html(data.noloanorder);
			var context;
			$("#checkAll").prop("checked", false);
			
			var loanStatus = data.loanStatus;
			
            var linkUrl = "${basePath}/admin/loan/queryLoanDetail/" + data.uuid + ".html";


			var edit = "";
            if(loanStatus == "vehicleAssess"){
				edit = "<a href='"+linkUrl+"' class='link-01'>编辑</a>";
            }else{
                edit="";
			}
            
			var pledgeType = data.pledge_type;
			var pledgeTypeStr = "";
            if(pledgeType == "drivePledge"){
				pledgeTypeStr = "押证";
            }else if(pledgeType == "vehiclePledge"){
				pledgeTypeStr = "押车";
			}

            var loanDetails = {};
			loanDetails.uuid = data.uuid;
			loanDetails.workflowName = data.workflowName;
			loanDetails.state = data.state;
			loanDetails.assigner = data.assigner;
			loanDetails.orderId = data.orderId;
			loanDetails.customerId = data.customerId;
			
          //还款方式追加
            var repayway = data.repayWay;
            //记录还款方式用于进行贷款续借的时候进行使用。
            var repaywaystr = "";
            if(repayway == "AverageCapitalPlusInterest"){
              repaywaystr = "等本等息";
            }else if(repayway == "InterestRatesBefore"){
              repaywaystr = "先息后本";
            }else if(repayway == "flexiblerepaymentv2"){
              repaywaystr = "灵活还款";
            }else if(repayway == "averagePrincipalreduceinterest"){
              repaywaystr = "等本减息";
            }else if(repayway == "averagePrincipalzerointerestrent"){
              repaywaystr = "等本零息(押证)";
            }else if(repayway == "intrestbeforePrincipalrent"){
              repaywaystr = "先息后本(押证)";
            }else if(repayway == "intrestbeforePrincipaltransfer"){
              repaywaystr = "先息后本(押车)";
            }
            $("#repayWay").html(repaywaystr);
            
			var jiaji = "";
            if(data.state == "yes"){
            	jiaji = "<i class='fa fa-bookmark text-success'></i>&nbsp;&nbsp;";
            }
            
            var isImportant = "";
            if(data.isImportant == "1"){
            	isImportant = "<i class='fa fa-star text-danger'></i>&nbsp;&nbsp;";
            }
			var result;
			//删除功能追加，删除键目前只用于删除调试时的数据来使用的
			$.ajax({
				type: "POST",
				url: "/admin/loan/queryDeleteFlag",
				dataType: "json",
				async:false,
				success: function (data) {
					result = data.flag;
					//alert(loanStatusStr);
				}
			});
			var caozuo;
			if(result == "y"){
				caozuo =  "<td><a id="+data.uuid+" href='javascript:void(0);' onclick='setCustomerIdHidden2(this)'>修改</a></td>";
			}
			
			var workflowName = '';
			var assigner = '';
			if((data.workflowName==null)||(data.workflowName==''))
			{
				workflowName='--';
			} else {
				workflowName = data.workflowName;
			}
			if((data.assigner==null)||(data.assigner==''))
			{
				assigner='未签收';
				if(workflowName == '--'){
					assigner = '--';
				}
			} else {
				assigner = data.assigner;
			}
			var teamLeader ="";
			if(data.isEnded){
				teamLeader=data.endLeader;
			}
			else{
				teamLeader=data.teamLeader;
			}
			if(window.location.href.indexOf("type=1")>=0){
				context = "<tr id="+data.uuid+" onclick='setEditCustomer(this)'>"
						+ "<td>" + jiaji + "<a id="+data.uuid
						+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderId + "</a>" + "</td>"
						+ "<td>" + isImportant +  "<a id="+data.uuid
						+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>" + data.customerName + "</a>"+"</td>"
						+ "<td>" + data.loanMoney + "</td>"
						+ "<td>" + pledgeTypeStr + "</td>"
						+ "<td>" + repaywaystr+ "</td>"
						+ "<td>" + data.managerName + "</td>"
						+ "<td>" + teamLeader + "</td>"
						+ "<td>" + workflowName + "</td>"
						+ "<td>" + assigner + "</td>"
						+ "<td>" + data.createdAt + "</td>"
						+ caozuo
						+ "</tr>";
						
			}else {
				context = "<tr id="+data.uuid+" onclick='setEditCustomer(this)'>"
						+ "<td>" + jiaji + "<a id="+data.uuid
						+ " onclick='setCustomerIdHidden(this)' href='javascript:void(0);'>" + data.orderId + "</a>" + "</td>"
						+ "<td>" + isImportant +  "<a id="+data.uuid
						+ " onclick='getlenderdetails(this)' href='javascript:void(0);'>" + data.customerName + "</a>"+"</td>"
						+ "<td>" + data.loanMoney + "</td>"
						+ "<td>" + pledgeTypeStr + "</td>"
						+ "<td>" + repaywaystr + "</td>"
						+ "<td>" + data.managerName + "</td>"
						+ "<td>" + teamLeader + "</td>"
						+ "<td>" + workflowName + "</td>"
						+ "<td>" + assigner + "</td>"
						+ "<td>" + data.createdAt + "</td>"
						+ "</tr>";
			}
			
			map.put(data.uuid.toString(),loanDetails);
			return context;
			
		};

        pageComm("${basePath}/admin/loan/queryWholeOrderInfoList", param == null ? {} : param, writetablefn, "record", 17);
        $("#time").val(null);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#searchDate").val(null);
        $("#statusnew").val(null);
        //changeHeight();
	}
	
    var param = function () {
		return {
        	"orderNo": $("#orderNo").val(),
            "customerName": $("#customerName").val(),
            "customerManage":$("#customerManage").val(),
            "pledgeType":$("#pledgeType").val(),
            "searchDate":$("#searchDate").val(),
            "statusnew":$("#statusnew").val(),
            "state":$("#state").val(),
            "loanstatus":$("#loanstatus").val()
		};
	};

    function queryAll(obj){
        $("#time").val(null);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#searchDate").val(null);
        $("#statusnew").val(null);  
        $(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	    $(obj).parents("li").addClass('active'); 
	    CountStatus = "count";
        select();
    }
	function select() {
		onLoadDate(param());
	}
	function selectteam(obj) {
	$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	$(obj).parents("li").addClass('active');
	selectMyTeam(param)
	}

    function assignment(obj){
        $("#time").val(null);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#searchDate").val(null);
    	$("#statusnew").val($(obj).attr("id"));
    	$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	    $(obj).parents("li").addClass('active');
	    if(obj.id == "front"){
	    	CountStatus = "front";
	    }else{
	    	CountStatus = "back";
	    }
    	onLoadDate(param());
    	}
    function querystate(obj){
        $("#time").val(null);
        $("#orderNo").val(null);
        $("#customerName").val(null);
        $("#searchDate").val(null);
    	$("#statusnew").val($(obj).attr("id"));
    	$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	    $(obj).parents("li").addClass('active');
	    CountStatus = "end";
    	onLoadDate(param());
    }

	function selectlist(obj) {
	$(obj).parents($(".col-sm-12")).find('li').removeClass('active');
	$(obj).parents("li").addClass('active');
	 onLoadDate(null);
	}
	function reset() {
		$("#mobile").val("");
		$("#customerName").val("");
	}

	function setCustomerIdHidden(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#order_modal").load("/admin/loan/vieworderdetails.html");
		opendiv("order_modal");
	}
	
	function setCustomerIdHidden2(obj){
		$("#customer_id_hidden").val($(obj).attr("id"));
		$("#user_modal").load("/admin/loan/repaymentUpdateNext.html");
		opendiv("user_modal");
	}
	function deleteloanwithworkflow(obj){
		var uuid = $(obj).attr("id");
		$.ajax({
			type: "POST",
			url: "/admin/loan/deleteloan",
			dataType: "text",
			data: {
				uuid: uuid

			},
			success: function (data) {
				if (data == "0000") {
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
		function getlenderdetails(obj){
			$("#customer_id_hidden").val($(obj).attr("id"));
			$("#order_modal").load("/admin/loan/lenderdetails.html");
			opendiv("order_modal");
		}
		//导出Excel
		 function exportExcel(type){
			debugger;
			   var src = "/admin/loan/exportorderCountList?searchDate=" + $("#searchDate").val() + "&orderNo=" + $("#orderNo").val()
					   + "&customerName=" + $("#customerName").val()+ "&CountStatus=" + CountStatus;
			   $("#exportIframe").attr("src",src);
			 $('#dc_tip').show();
		        setTimeout(function() {
		          	$('#dc_tip').hide();
		       },1500);
		}

</script>
</html>