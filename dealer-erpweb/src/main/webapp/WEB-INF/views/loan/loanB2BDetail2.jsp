<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<link type="text/css" rel="stylesheet"
	href="${basePath}/css/dropZone.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/css/jquery.fileupload-ui.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/css/jquery.fileupload.css" />
<link type="text/css" rel="stylesheet"
	href="${basePath}/js/completer/completer.min.css" />
<link rel="stylesheet"
	href="${basePath}/css/bootstrap/bootstrap-table.css">
<link rel="stylesheet" href="${basePath}/css/lightbox.min.css" />
<script src="${basePath}/js/lightbox.js"></script>
<script type="text/javascript" src="${basePath}/js/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath}/js/jquery/jquery.ui.widget.js"></script>
<script type="text/javascript"
	src="${basePath}/js/jquery/jquery.iframe-transport.js"></script>
<script type="text/javascript"
	src="${basePath}/js/jquery/jquery.fileupload.js"></script>
<script type="text/javascript" src="${basePath}/js/other.js"></script>
<script type="text/javascript" src="${basePath}/js/my.js"></script>
<script src="${basePath}/js/uploadPreview.js" type="text/javascript"></script>
<script type="text/javascript" src="${basePath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${basePath}/js/layer/layer.js"></script>
<script type="text/javascript"
	src="${basePath}/js/completer/completer.min.js"></script>
<link rel="stylesheet"
	href="${basePath}/css/bootstrap-datetimepicker.min.css">
<script src="${basePath}/js/bootstrap-datetimepicker.min.js"></script>
<script src="${basePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${basePath}/js/datetimepicker.js"></script>
<script src="${basePath}/js/jquery.validate.js"></script>
<style>
.bar {
    height: 18px;
    background: green;
}
</style>
</head>
<body>
	<div id="loan_attachment_div">
		<input type="hidden" value="" id="loanstatus" /> <input type="hidden"
			value="" id="state" /> <input type="hidden" value=""
			id="edit_customer_id" /> <input type="hidden" value=""
			id="statusnew"> <input type="hidden" value=""
			id="customer_id_hidden"> <input type="hidden" value=""
			id="taskId_hidden"> <input type="hidden" value=""
			id="processDefinitionId_hidden"> <input type="hidden"
			value="" id="loanId" />
		<div class="modal-header" id="header">
			<a type="button" href="javascript:void(0)" onclick="closePage(0)"
				class="close"><span aria-hidden="true">&times;</span></a>
			<h4 class="modal-title" id="myModalLabel" style="font-size: 16px;">
				总公司还款 <small style="padding-left: 20px; font-size: 14px;"
					class="text-danger" id="orderid">订单号:ECD01012016091813420900031</small>
				<input type="hidden" value="" id="repayPlanId" />
			</h4>
		</div>
		<div class="modal-body">
			<div class="fk_modal_con ">
				<div class="row">
					<div class="col-sm-7">
						<dl class="dl-horizontal">
							<dt style="padding-top: 6px;">
								<i class="text-danger">*</i> 还款金额
							</dt>
							<dd>
								<div class="input_group pull-left" style="max-width: 120px;">
									<input class="form-control" name="applyMoney" id="applyMoney"
										onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
										onpaste="return false" maxlength="12" value="0"
										style="width: 100%;" type="text"> <span class="danwei">元</span>
								</div>
								<p class="help-block pull-left" style="padding-left: 10px;">
									本次还款金额是<span class="text-danger" id="repayMoneySpan">12000.00元</span>
								</p>
								<input name="repayMoney" type="hidden" id="repayMoney"
									value="12000" />
							</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt style="padding-top: 6px;">罚息金额</dt>
							<dd>
								<div class="input_group" style="max-width: 120px;">
									<input class="form-control" name="overdueMoney"
										id="overdueMoney"
										onkeyup="this.value= this.value.match(/\d+(\.\d{0,2})?/) ? this.value.match(/\d+(\.\d{0,2})?/)[0] : ''"
										onpaste="return false" maxlength="5" value=""
										style="width: 100%;" type="text"> <span class="danwei">元</span>
								</div>
							</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt style="padding-top: 6px;">还款日期</dt>
							<dd>
								<div class="input-group date form_date" data-date=""
									data-date-format="yyyy-mm-dd" data-link-field="repaymentDate"
									data-link-format="yyyy-mm-dd" style="width: 200px;">
									<input class="form-control" type="text" value="" readonly=""
										style="width: 100%;" id="repaymentDate" name="repaymentDate">
									<span class="input-group-addon"><span
										class="glyphicon glyphicon-calendar"></span></span>
								</div>
							</dd>
						</dl>
						<dl class="dl-horizontal">
							<dt>备注</dt>
							<dd>
								<textarea rows="3" placeholder="请输入备注信息" class="form-control"
									name="remark" id="remark"></textarea>
							</dd>
						</dl>
					</div>
					<div class="col-sm-5">
						<dl class="dl-horizontal" id="image">
							<dt style="padding-top: 6px;"><font color="red">*</font>还款凭证</dt>
							<dd>
								<div id="repaymentImg">
									<a href="javascript:;" class="file">选择文件 <input
										id="repaymentFile" name="files[]" data-url="" type="file">
									</a>
									<p class="file_img">
										<img id="imgShow_WU_FILE_1" src="">
									</p>
									<div id="_progress" style="width:120px"><div class="bar" style='width: 0%;'></div></div>
								</div>
							</dd>
						</dl>

					</div>
				</div>
			</div>
		</div>
		<div class="modal-footer" style="text-align: left;">
			<a type="submit" class="btn btn-default"
				style="margin-left: 130px; width: 120px;" onclick="closePage();">
				关闭 </a>
			<button id="submit" type="submit" class="btn btn-danger"
				style="width: 120px;" onclick="submit()">提交</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	var currentReviewLoanStatus = "${map.status}"; // 根据不同的状态进行查询,参数由IndexController封装为map
	var currentpledgeType = "${map.pledgeType}";
	var loanId = $("#customer_id_hidden").val().split(":")[0];
	var orderid = $("#customer_id_hidden").val().split(":")[1];
	
	$(function() {
		init();
		$("#repaymentFile").attr("data-url","/admin/file/upload/" + loanId + "/company_repaymentUploadProof.html");
		$("#repaymentFile").fileupload({
			dataType : 'json',
			done : function(e, data) {
				doneProcess(data, $("#imgShow_WU_FILE_1"));
				$('#_progress .bar').css('width', 0);
			},
			progressall : function(e, data) {
							var progress = parseInt(data.loaded / data.total
									* 100, 10);
							$('#_progress .bar').css('width',
									progress + '%');
						}
		});
		var doneProcess = function(data, obj) {
			$.each(data.result, function(index, file) {
				if (file.code == "0000") {
					layer.msg("上传成功！");
					if (file.fileName.indexOf(".mp3") > 0
							|| file.fileName.indexOf(".aac") > 0
							|| file.fileName.indexOf(".ape") > 0
							|| file.fileName.indexOf(".wma") > 0
							|| file.fileName.indexOf(".ac3") > 0
							|| file.fileName.indexOf(".amr") > 0
							|| file.fileName.indexOf(".flac") > 0
							|| file.fileName.indexOf(".m4r") > 0
							|| file.fileName.indexOf(".mmf") > 0
							|| file.fileName.indexOf(".mp2") > 0
							|| file.fileName.indexOf(".wav") > 0
							|| file.fileName.indexOf(".wv") > 0
							|| file.fileName.indexOf(".ogg") > 0) {
						$("#recordings").show();
						$("#recordingsIcon").show();
						$("#recordings").html(file.fileName);

					}
					$(obj).attr("src", file.showFilePath);
				} else {
					if (file.code == "9999") {
						layer.msg("不支持此类型的文件！");
					}
				}
			});
		};
	});
	function init() {
		var loanId = $("#customer_id_hidden").val().split(":")[0];
		var orderid = $("#customer_id_hidden").val().split(":")[1];
		//初始化页面
		$.ajax({
			type : "POST",
			url : "/admin/lastRepayPlanInfo",
			dataType : "json",
			data : {
				loanId : $("#customer_id_hidden").val().split(":")[0]
			//$("#customer_id_hidden").val().split(":")[0]
			},
			success : function(data) {
				$("#loanId").val(data.result.loanid);
				$("#repayPlanId").val(data.result.id);
				$("#repayMoney").val(data.result.total);
				$("#repayMoneySpan").text(data.result.total + "元");
				$("#applyMoney").val(data.result.total);
				//$("#orderid").val()$("#customer_id_hidden").val().split(":")[0]

			},
		});
		//初始化绑定图片上传事件

		$("#orderid")
				.html("订单号" + $("#customer_id_hidden").val().split(":")[1]);

	}

	function submit() {

		debugger;
		//判定
		var applyMoney = $("#applyMoney").val();
		var repayMoney = $("#repayMoney").val();
		var remark = $("#remark").val();
		if (applyMoney == null) {
			layer.msg("请输入还款金额");
		}
		if ($("#imgShow_WU_FILE_1").attr("src").length == 0) {
			layer.msg("请输入上传凭证");
			return;
		}
		if ($("#repaymentDate").val().length <= 0){
			layer.msg("请选择还款日期");
			return;
		}
		if (applyMoney != repayMoney) {
			layer.msg("还款金额必须等于应还金额");
			return;
		} else {
			$
					.ajax({
						type : "POST",
						url : "/admin/companyRepay",
						dataType : "json",
						data : {
							loanId : $("#loanId").val(),
							repayPlanId : $("#repayPlanId").val(),
							repaymentMoney : $("#applyMoney").val(),
							overdueMoney : $("#overdueMoney").val(),
							remark : $("#remark").val(),
							repaymentDate : $("#repaymentDate").val(),
							"imageUpLoad": "1",
							"company_repaymentUploadProof": $("#imgShow_WU_FILE_1").attr("src")

						},
						success : function(data) {
							layer.msg("操作成功!",{icon : 1,time : 1000},
											function() {
												$("#fade2").css("display","none");
                                                window.location.reload();
												parent.document.getElementById('fade1').style.display = 'none';
												document.location.href = '/admin/loan/loanB2BDetail.html';
												return true;
											});
						}
					});
		}
	}
	function closePage(){
//		$("#order_modal").empty();
		$("#lightboxOverlay").remove();
		$("#lightbox").remove();
		$("#order_modal").empty();
		colsediv(0);
	}
	

</script>
</html>
