$(document).ready(function() {
	$(".fa-edit").click(function() {
		$(this).parent("dd").find("span").hide();
		$(this).parent("dd").find("input").show();
		$(this).parent("dd").find("select").show();
		$(this).parent("dd").find($(".unit_box")).show();
		$(this).parent("dd").find($(".form_date")).show();
	});
});

function loanController(taskId, processDefinitionId) {
	$("#op_box_" + processDefinitionId).css("display", "block");
}

function doReview(conclusion, loanId, reviewStatus, processDefinitionId,
		taskId, reviewMoney, lendDate) {
	$
			.ajax({
				type : 'POST',
				url : '/admin/loan/review.html',
				data : {
					"conclusion" : conclusion,
					"loanId" : loanId,
					"reviewStatus" : reviewStatus,
					"processDefinitionId" : processDefinitionId,
					"taskId" : taskId,
					"reviewMoney" : reviewMoney,
					"lendDate" : lendDate
				},
				dataType : "text",
				success : function(data) {
					if (data == '0000') {
						if (((processDefinitionId == "lended") && (reviewStatus == 'loandirect'))
								|| (processDefinitionId == "reloan_lended")
								|| (processDefinitionId == "helploan_lended")
								|| ((processDefinitionId == "helploanReview") && (reviewStatus == "rejected"))
								|| ((processDefinitionId == "helploanApprove") && (reviewStatus == "rejected"))) {
							$
									.ajax({
										type : "POST",
										url : "/admin/loan/runRepaymentBpm",
										dataType : "text",
										data : {
											loanId : loanId
										},
										success : function(data) {
											layer
													.msg(
															"操作成功!",
															{
																icon : 1,
																time : 1000
															},
															function() {
																$("#fade2")
																		.css(
																				"display",
																				"none");
																parent.document
																		.getElementById('fade1').style.display = 'none';
																if (window.location.href
																		.indexOf("category=0") > 0) {
																	document.location.href = '/admin/loan/agency.html?category=0';
																} else if (window.location.href
																		.indexOf("category=1") > 0) {
																	document.location.href = '/admin/loan/agency.html?category=1';
																} else if (window.location.href
																		.indexOf("lendedLoanInfoList") > 0) {
																	document.location.href = '/admin/loan/lendedLoanInfoList.html';
																} else {
																	document.location.href = '/admin/loan/loanInfoList.html';
																}
																return true;
															});
										}
									});
						} else {
							// 如果是再贷审批或者是助贷审批的情况下，在review的数据post成功后，需要需要进行贷款
							// 信息的保存。
							if (processDefinitionId == 'reloanApprove') {
								$
										.ajax({
											type : 'POST',
											url : '/admin/loan/savereloaninfo.html',
											data : {
												"reloan_rate" : $(
														"#reloan_rate").val(),
												"startDate_reloan" : $(
														"#startDate_reloan")
														.val(),
												"endDate_reloan" : $(
														"#endDate_reloan")
														.val(),
												"loanId" : loanId,
												"loankind" : "reloan"
											},
											dataType : "text",
											success : function(data) {
												if (data == '0000') {
													layer
															.msg(
																	"操作成功!",
																	{
																		icon : 1,
																		time : 1000
																	},
																	function() {
																		$(
																				"#fade2")
																				.css(
																						"display",
																						"none");
																		parent.document
																				.getElementById('fade1').style.display = 'none';
																		if (window.location.href
																				.indexOf("category=0") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=0';
																		} else if (window.location.href
																				.indexOf("category=1") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=1';
																		} else {
																			document.location.href = '/admin/loan/loanInfoList.html';
																		}
																		return true;
																	});
												} else {
													layer
															.msg(
																	"操作失败，请跟系统管理员联系!",
																	{
																		icon : 1,
																		time : 1000
																	},
																	function() {
																		$(
																				"#fade2")
																				.css(
																						"display",
																						"none");
																		parent.document
																				.getElementById('fade1').style.display = 'none';
																		if (window.location.href
																				.indexOf("category=0") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=0';
																		} else if (window.location.href
																				.indexOf("category=1") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=1';
																		} else {
																			document.location.href = '/admin/loan/loanInfoList.html';
																		}
																		return true;
																	});
												}
											},
											error : function() {
												layer.msg("系统错误!");
												return false;
											}
										});
							} else if (processDefinitionId == 'helploanApprove') {
								$
										.ajax({
											type : 'POST',
											url : '/admin/loan/savereloaninfo.html',
											data : {
												"reloan_rate" : $(
														"#helploan_rate").val(),
												"startDate_reloan" : $(
														"#startDate_helploan")
														.val(),
												"endDate_reloan" : $(
														"#endDate_helploan")
														.val(),
												"loanId" : loanId,
												"loankind" : "helploan"
											},
											dataType : "text",
											success : function(data) {
												if (data == '0000') {
													layer
															.msg(
																	"操作成功!",
																	{
																		icon : 1,
																		time : 1000
																	},
																	function() {
																		$(
																				"#fade2")
																				.css(
																						"display",
																						"none");
																		parent.document
																				.getElementById('fade1').style.display = 'none';
																		if (window.location.href
																				.indexOf("category=0") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=0';
																		} else if (window.location.href
																				.indexOf("category=1") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=1';
																		} else {
																			document.location.href = '/admin/loan/loanInfoList.html';
																		}
																		return true;
																	});
												} else {
													layer
															.msg(
																	"操作失败，请跟系统管理员联系!",
																	{
																		icon : 1,
																		time : 1000
																	},
																	function() {
																		$(
																				"#fade2")
																				.css(
																						"display",
																						"none");
																		parent.document
																				.getElementById('fade1').style.display = 'none';
																		if (window.location.href
																				.indexOf("category=0") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=0';
																		} else if (window.location.href
																				.indexOf("category=1") > 0) {
																			document.location.href = '/admin/loan/agency.html?category=1';
																		} else {
																			document.location.href = '/admin/loan/loanInfoList.html';
																		}
																		return true;
																	});
												}
											},
											error : function() {
												layer.msg("系统错误!");
												return false;
											}
										});
							}
							{
								layer
										.msg(
												"操作成功!",
												{
													icon : 1,
													time : 1000
												},
												function() {
													$("#fade2").css("display",
															"none");
													parent.document
															.getElementById('fade1').style.display = 'none';
													if (window.location.href
															.indexOf("category=0") > 0) {
														document.location.href = '/admin/loan/agency.html?category=0';
													} else if (window.location.href
															.indexOf("category=1") > 0) {
														document.location.href = '/admin/loan/agency.html?category=1';
													} else {
														document.location.href = '/admin/loan/loanInfoList.html';
													}
													return true;
												});
							}

						}

					} else {
						layer.msg("操作失败!可能原因：" + data);
						return false;
					}
				},
				error : function() {
					layer.msg("系统错误!");
					return false;
				}
			});
}
// 下载合同共通函数
function getLoanContractWord(loanId, type) {
	$.ajax({
		type : 'POST',
		url : '/admin/loan/' + type + '.html',
		data : {
			"loanId" : loanId
		},
		dataType : "text",
		success : function(data) {
			var url = "/loanAttachments/" + data;
			// window.open(url, '_blank');
			location.href = url;
		},
		error : function() {
			layer.msg("系统错误!");
			return false;
		}
	})
}

/** 提交评审 */
function submitReview() {
	var processDefinitionId = $("#processDefinitionId").val();
	var reviewStatus = $(
			'input[name="reviewStatus_' + processDefinitionId + '"]:checked')
			.val();
	var laonDetails = map.get($("#customer_id_hidden").val());
	var loanId = laonDetails.uuid;
	var processDefinitionId = loanDetailsAll;
	var taskId = $("#customer_id_hidden").val().split(":")[2];
	var conclusionObj = $("#conclusion");
	var conclusion = conclusionObj.val();
	var reviewStatusStr = "提交";
	var reviewMoney = 0;
	var lendDate = new Date();
	// 获取所有input
	var dialogMsg = "你确定<font color='red'>" + reviewStatusStr + "</font>吗？";

	alertMessage(dialogMsg, 'doReview("' + conclusion + '","' + loanId + '","'
			+ reviewStatus + '","' + processDefinitionId + '","' + taskId
			+ '","' + reviewMoney + '","' + lendDate + '")', 'qs_box1');
}
$(function() {
	/*var aaa = $("#customer_id_hidden").val();
	var loanId = $("#customer_id_hidden").val().split(":")[0];
	var taskid = $("#customer_id_hidden").val().split(":")[2];
	var state = $("#customer_id_hidden").val().split(":")[5];*/
	var id = $("#customer_id_hidden").val();
	var loanDetailsAll = map.get(id);
	var loanId = loanDetailsAll.uuid;
	var taskid = loanDetailsAll.taskId;
	$("#uuid").attr("value", loanId);
	$("#taskId").attr("value", taskid);
	$.extend($.validator.messages, {
		required : "图片不能为空"
	});
	$("#loanForm")
			.validate(
					{
						errorLaberContainer : "loanError",
						errorElement : "span",
						rules : {
							vehicleBrand : {
								required : true
							},
							vehicleNo : {
								required : true
							},
							mileaged : {
								required : true
							},
							vehicleIdentification : {
								required : true
							},
							engineNo : {
								required : true
							},
							displacement : {
								required : true
							},
							engine : {
								required : true
							},
							price : {
								required : true
							},
							evaluatePrice : {
								required : true
							},
							evaluateConclusion : {
								required : true
							},
							purchaseDate : {
								required : true
							},
							conclusion : {
								required : true
							}
						},
						messages : {
							vehicleBrand : {
								required : '车辆品牌不能为空！'
							},
							vehicleNo : {
								required : '车辆号码不能为空！'
							},
							mileaged : {
								required : '行驶里程不能为空!',
							},
							vehicleIdentification : {
								required : '车架号不能为空！'
							},
							engineNo : {
								required : '发动机号不能为空！'
							},
							displacement : {
								required : '排量不能为空！'
							},
							engine : {
								required : '发动机不能为空！'
							},
							price : {
								required : '发票价不能为空！'
							},
							evaluatePrice : {
								required : '评估价格不能为空！'
							},
							evaluateConclusion : {
								required : '评估意见不能为空！'
							},
							purchaseDate : {
								required : '购置日期不能为空！'
							},
							conclusion : {
								required : "意见不能为空"
							}
						/*
						 * enterpriseTel: { required: '单位电话不能为空！' },
						 * enterpriseAddress: { required: '单位地址不能为空！' }, income: {
						 * required: '月收入不能为空！' }, remark: { required: '备注不能为空！' },
						 * creditCardQuota: { required: '信用卡额度不能为空，没有请填写0！' },
						 * creditCardNum: { required: '信用卡张数不能为空，没有请填写0！' }
						 */
						},
						showErrors : function(errorMap, errorList) {
							this.defaultShowErrors();
							setTimeout("removeError()", 1000 * 6);
						},
						submitHandler : function(form) {
							var param = $("#loanForm").serialize();
							$
									.ajax({
										url : "/admin/loan/reloadLoanInfo",
										type : "post",
										dataType : "json",
										data : param,
										success : function(data) {
											if (data.result == '0000') {
												layer
														.msg(
																"操作成功!",
																{
																	icon : 1,
																	time : 1000
																},
																function() {
																	$("#fade2")
																			.css(
																					"display",
																					"none");
																	$("#fade1")
																	.css(
																			"display",
																			"none");
																	if (window.location.href
																			.indexOf("category=0") > 0) {
																		document.location.href = '/admin/loan/agency.html?category=0';
																	} else if (window.location.href
																			.indexOf("category=1") > 0) {
																		document.location.href = '/admin/loan/agency.html?category=1';
																	} else if (window.location.href
																			.indexOf("lendedLoanInfoList") > 0) {
																		document.location.href = '/admin/loan/lendedLoanInfoList.html';
																	} else {
																		document.location.href = '/admin/loan/loanInfoList.html';
																	}
																	return true;
																});
											}
										},
										error : function() {
											layer.msg("系统错误!");
											return false;
										}
									});
						},
						invalidHandler : function(form, validator) { // 不通过回调
							return false;
						}
					});
	var div = ""

	// alert(aaa);
	// alert(taskid);
	// alert(state);
	// 在页面详情中，删除现在去评估按钮，原因是保留的话，还需要进行是否
	// 签收的判断，因而考虑可以进行删除。
	// if(state == "vehicleAssess"){
	// //alert(0);
	// $("#processid").val(taskid);
	// div= " <div class='alert alert-danger' role='alert'> "
	// +" <i class='fa fa-exclamation-triangle' "
	// +" style='margin-right: 10px;'></i> 此订单还未进行车辆评估，<a href='#'
	// onclick='caozuo();' "
	// +" class='btn btn-sm btn-danger'>现在去评估</a> "
	// +" </div> ";
	// }
	$("#d1").html(div);
	// 初始化上传图片地址
	var inputs = $("input[type='file']");
	$.each(inputs, function(value) {
		$(this).attr(
				"data-url",
				"/admin/file/upload/" + loanId + "/" + $(this).attr('data-url')
						+ ".html");
	});
	var unique=$("input[unique=false]");
	if(unique.length>0){
		debugger;
	$.each(unique,function(key,val){
	
	
		var typeId=$("#"+$(val).attr("parent_type"));
		if(typeId.length>0){
			var add=$(typeId).find("a[class='btn btn-danger btn-xs']");
			if(add.length>0){
				$(add).show();
				var x=$(val).attr("parent_type");
				var type=$(val).attr("name");
				var title=$(val).attr("title");
				$(add).click(function() {
					debugger;
					var loanId = $("#customer_id_hidden").val().split(":")[0];
					var n = $("#"+x+" > li").length;
					var name = "img_WU_FILE_"+type+ n;
					$("#"+x)
							.append(
									"<li><div class='file_img' style='display: table-cell;'><p class='tools'><a href='javascript:void(0);' title='保存'><i class='fa  fa-save'></i></a><a href='javascript:void(0);'onclick='Edit(this)' class='btn-edit' title='修改'><i class='fa fa-edit'></i></a> <a href='javascript:void(0);'onclick='deleted(this)' class='btn-edit' title='删除'><i class='fa fa-trash-o'></i></a></p><a href='#' title='放大' id="
											+ name
											+ "> <input type='hidden' name='other' value=/><img class='example-image' src='' id=img_"
											+ name
											+ " /></a></div><section style='display: none;'><div class='clearfix'><a href='javascript:;' class='file pull-left'>选择文件<input id=up_"
											+ name
											+ " class='form-control' type='file' data-url=/admin/file/upload/"
											+ loanId
											+ "/"+type+".html></a><a class='btn btn-default reply_btn pull-right'><i class='fa fa-reply'></i></a></div><p class='file_img'><img></p></section><h4> "+title+"</h4></li>");
					$("#up_" + name).fileupload({
						dataType : 'json',
						done : function(e, data) {
							doneProcess(data, $("#img_" + name));
						}
					});
				});
					$(val).parent().parent().parent().remove()
			}
		}
		//初始化添加函数的
	});}
	
	
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
						|| file.fileName.indexOf(".ogg") > 0
						|| file.attachementType.indexOf("entrustVideo") > -1) {
					$("#recordings_" + file.attachementType).show();
					$("#recordingsIcon_" + file.attachementType).show();
					$("#recordings_" + file.attachementType)
							.html(file.fileName);
					$("#"+file.attachementType).children("input").attr("value",
							file.showFilePath);
					$("#video_" + file.attachementType).show();
					$("#video2_" + file.attachementType).hide();
				}
				$(obj).attr("src", file.showSmallFilePath).show();
				// 修改input框
				$(obj).prevAll().attr("value", file.showFilePath);
				$(obj).parents(".file_img").show();
				$(obj).parents("li").find("section").hide();
			} else {
				if (file.code == "9999") {
					layer.msg("不支持此类型的文件！");
				}
			}
		});
	};
	var uuid;
	var customer_id_hiddenstr = $("#customer_id_hidden").val();
	/*var strarray = new Array();
	strarray = customer_id_hiddenstr.split(":");
	var customer_id_hidden = strarray[0];
	var orderid = strarray[1];
	var taskId = strarray[2];
	var processDefinitionId = strarray[3];
	var assignee = strarray[4];
	var channel = strarray[6];*/
	var loanDetailsAll = map.get(loanId);
	var customer_id_hidden = loanDetailsAll.uuid;
	var orderid = loanDetailsAll.orderId;
	var taskId = loanDetailsAll.taskId;
	var processDefinitionId = loanDetailsAll.activityId;
	var assignee = loanDetailsAll.assignee;
	var channel = loanDetailsAll.channel;
	$("#processDefinitionId").val(processDefinitionId);
	$("#processDefinitionId").attr("value", processDefinitionId);
	// 如果是车辆评估节点，则不显示提交处理按钮
	if (processDefinitionId == "vehicleAssess") {
		$("#submitA").hide();
	} else {
		// 流程画面控制
		if ("null" != assignee && "" != assignee) {
			if ("yes" == channel) {
				$("#submitA").hide();
			} else {
				loanController(taskId, processDefinitionId);
				$("#submitA").show();
			}
		} else {
			$("#submitA").hide();
		}
	}
	/* BUG277 */

	// 设置订单号
	$("#orderid").html("订单号:" + orderid);
	// 取得借款数据
	$
			.ajax({
				url : "/admin/loan/loanreqinfo?uuid=" + customer_id_hidden,
				type : "get",
				dataType : "json",
				success : function(data) {
					// 申请金额处理
					var applymoney = data.loanInfo.applyMoney / 10000;
					if (data.loanInfo.loanMoney == '0.00') {
						$("#reviewMoney").val(applymoney);
						$("#judgmentMoney").val(applymoney);
					} else if (data.loanInfo.loanMoney != '0.00') {
						$("#reviewMoney").val(data.loanInfo.loanMoney / 10000);
						$("#judgmentMoney")
								.val(data.loanInfo.loanMoney / 10000);
					}
					var applaymoneyround = getRoundDigital(applymoney, 2);
					var dispstr = "<b class=\"text-danger\">";
					dispstr = dispstr + applaymoneyround;
					dispstr = dispstr + "</b> 万元";
					$("#applyMoney").html(dispstr);
					// 审批金额
					var approvemoney = data.loanInfo.loanMoney / 10000;
					var approvemoneyround = getRoundDigital(approvemoney, 2);
					dispstr = "<b class=\"text-danger\">";
					dispstr = dispstr + approvemoneyround;
					dispstr = dispstr + "</b> 万元";
					$("#approveMoney").html(dispstr);
					// 借款状态
					var record = data.loanInfo;
					if (record.loanStatus == "vehicleAssess") {
						loanstatus = "待车辆评估";
					} else if (record.loanStatus == "departLeadAduit") {
						loanstatus = "待初审";
					} else if (record.loanStatus == "departLeadAduit_rejected") {
						loanstatus = "初审不通过";
					} else if (record.loanStatus == "trialPhase") {
						loanstatus = "待总部面审";
					} else if (record.loanStatus == "trialPhase_rejected") {
						loanstatus = "总部面审不通过";
					} else if (record.loanStatus == "callBack") {
						loanstatus = "待电话核实";
					} else if (record.loanStatus == "visiteCheck") {
						loanstatus = "待线下上门核实";
					} else if (record.loanStatus == "judgment") {
						loanstatus = "待总部终审";
					} else if (record.loanStatus == "judgment_rejected") {
						loanstatus = "总部终审不通过";
					} else if (record.loanStatus == "signContract") {
						loanstatus = "待线下签订相关合同";
					} else if (record.loanStatus == "signContract_rejected") {
						loanstatus = "签订合同终止";
					} else if (record.loanStatus == "dataReview") {
						loanstatus = "资料复核";
					} else if (record.loanStatus == "reuploadInformatin") {
						loanstatus = "资料或相关合同重新上传";
					} else if (record.loanStatus == "lended") {
						loanstatus = "待出账";
					} else if (record.loanStatus == "repayment") {
						loanstatus = "还款中";
					} else if (record.loanStatus == "end") {
						loanstatus = "已完结";
					} else if (record.loanStatus == "mortgage") {
						loanstatus = "待办理抵押";
					} else if (record.loanStatus == "instock") {
						loanstatus = "待办理入库";
					} else if (record.loanStatus == "reloanReview") {
						loanstatus = "待再贷资料复核";
					} else if (record.loanStatus == "reloanApprove") {
						loanstatus = "待再贷审批";
					} else if (record.loanStatus == "reloanE_Contract") {
						loanstatus = "待再贷电子合同签订";
					} else if (record.loanStatus == "reloan_lended") {
						loanstatus = "待再贷放款";
					} else if (record.loanStatus == "helploanReview") {
						loanstatus = "待助贷资料复核";
					} else if (record.loanStatus == "helploanApprove") {
						loanstatus = "待助贷审批";
					} else if (record.loanStatus == "helploanE_Contract") {
						loanstatus = "待助贷电子合同签订";
					} else if (record.loanStatus == "helploan_lended") {
						loanstatus = "待助贷放款";
					}
					$("#loanstatus").html(loanstatus);
					// 订单号
					$("#loanorderid").html(orderid);
					// 借款人
					$("#loanername").html(
							data.loanInfo.customerRegisterInfo.customerName);

					var pledgeType = data.loanInfo.pledgeType;
					var pledgeTypeStr = "";
					if (pledgeType == "drivePledge") {
						pledgeTypeStr = "押证";
					} else if (pledgeType == "vehiclePledge") {
						pledgeTypeStr = "押车";
					}
					$("#mortgageType").html(pledgeTypeStr);
					// 申请时间
					$("#applytime").html(data.loanInfo.applyedAt);
					// 还款来源
					$("#repaymentsrc").html(data.loanInfo.repaySource);
					// 所属分公司
					$("#loancompany").html(data.loanInfo.company.name);
					// 所属部门
					$("#loandept").html(data.loanInfo.dept.name);
					// 客户经理
					$("#customermanager").html(
							data.loanInfo.responsibleBy.realname);
					// 录入人
					$("#loanrecorder").html(data.loanInfo.createBy.realname);
					// 录入时间
					$("#createtime").html(data.loanInfo.createdAt);
					// 年利率
					var yearrate = data.loanInfo.loanRate;
					var yearratestr = getRoundDigital(yearrate, 2);
					yearratestr += "%";
					$("#yearrate").html(yearratestr);
					// 月利率
					var monthrate = yearrate / 12;
					var monthratestr = getRoundDigital(monthrate, 2);
					monthratestr += "%";
					$("#monthrate").html(monthratestr);
					// 贷款期限
					var periodstr = data.loanInfo.loanLimitTime;
					periodstr += "个月";
					$("#period").html(periodstr);
					// 开户名
					var accountname = data.accountInfo.accountName;
					$("#accountname").html(accountname);
					// 开户行
					var accountbank = data.accountInfo.bankName;
					$("#accountbank").html(accountbank);
					// 银行账号
					var accountnumber = data.accountInfo.accountNum;
					$("#accountnumber").html(accountnumber);
					// 还款方式追加
					var repayway = record.repayWay;
					// 记录还款方式用于进行贷款续借的时候进行使用。
					var repaywaystr = "";
					if (repayway == "AverageCapitalPlusInterest") {
						repaywaystr = "等本等息";
					} else if (repayway == "InterestRatesBefore") {
						repaywaystr = "先息后本";
					} else if (repayway == "flexiblerepaymentv2") {
						repaywaystr = "灵活还款";
					} else if (repayway == "averagePrincipalreduceinterest") {
						repaywaystr = "等本减息";
					} else if (repayway == "averagePrincipalzerointerestrent") {
						repaywaystr = "等本零息(押证)";
					} else if (repayway == "intrestbeforePrincipalrent") {
						repaywaystr = "先息后本(押证)";
					} else if (repayway == "intrestbeforePrincipaltransfer") {
						repaywaystr = "先息后本(押车)";
					}
					$("#repayWay").html(repaywaystr);

					// 数据显示更新 by why 20160918
					$("#loanPurpose").html(data.loanInfo.loanPurpose);
					$("#hostOpinion").html(data.loanInfo.hostOpinion);
					$("#loan_remark").html(data.loanInfo.remark);
					var loan_product = "";
					switch (data.loanInfo.loan_product) {
					case "0":
						loan_product = "车抵贷";
						break;
					case "1":
						loan_product = "押车贷";
						break;
					case "2":
						loan_product = "车主贷";
						break;
					case "3":
						loan_product = "车商贷";
						break;
					case "4":
						loan_product = "首付贷";
						break;
					case "5":
						loan_product = "二手车分期";
						break;
					case "6":
						loan_product = "以租代购";
						break;
					}
					$("#loan_product").html(loan_product);

					$("#buy_car_method").html(
							data.loanInfo.buy_car_method == "0" ? "全款" : "按揭");

					$("#plantype").html(
							data.loanInfo.plantype == "0" ? "服务管理费按月收取"
									: "服务管理费一次性收取");

					$("#drunkDrive").html(data.loanInfo.drunkDrive + "%");

					$("#depreciationFee").html(
							data.loanInfo.depreciationFee + "%");

					$("#parkCost").html(
							(data.loanInfo.parkCost == "" ? "0"
									: data.loanInfo.parkCost)
									+ "元");
					// 数据显示更新 by why 20160918

					// 合同相关下载的相关信息取得
					var loaninfo = data.loanInfo;
					if ((loaninfo.loanStatus == 'signContract')
							|| (loaninfo.loanStatus == 'callBack')
							|| (loaninfo.loanStatus == 'signContract_rejected')
							|| (loaninfo.loanStatus == 'dataReview')
							|| (loaninfo.loanStatus == 'reuploadInformatin')
							|| (loaninfo.loanStatus == 'lended')) {
						$("#contact_div").css("display", "block");
						// 设置合同下载为可见状态
						var loanId = loaninfo.uuid;
						// 贷款合同
						$("#loan_contact").attr(
								"href",
								"javascript:getLoanContractWord(\'" + loanId
										+ "\', \'getLoanContractWord\')");
						// 融资服务协议
						$("#financing_services_agreement").attr(
								"href",
								"javascript:getLoanContractWord(\'" + loanId
										+ "\', \'getLoanServiceWord\')");
						// 抵押合同
						$("#mortgage_contract").attr(
								"href",
								"javascript:getLoanContractWord(\'" + loanId
										+ "\', \'getLoanPledgeContractWord\')");
						// 机动车质押合同
						$("#pledge_contract")
								.attr(
										"href",
										"javascript:getLoanContractWord(\'"
												+ loanId
												+ "\', \'getLoanPledgeGuaranteeContractWord\')");
						// 借款收据
						$("#loan_receipt").attr(
								"href",
								"javascript:getLoanContractWord(\'" + loanId
										+ "\', \'getloan_receiptWord\')");
						// 借款申请表loan_apply
						$("#loan_apply").attr(
								"href",
								"javascript:getLoanContractWord(\'" + loanId
										+ "\', \'loan_applyFormExcel\')");
						// 还款计划repay_plan
						$("#repay_plan").attr(
								"href",
								"javascript:getLoanContractWord(\'" + loanId
										+ "\', \'loan_applyFormExcel\')");
					} else {
						// 设置合同下载为不可见状态
						$("#contact_div").css("display", "none");
					}
					// 设置状态进度条
					var processDefinitionId = $("#processDefinitionId").val();
					// 如果当前节点是重新长传附件节点，表示为复核节点
					if (processDefinitionId == 'reuploadInformatin') {
						processDefinitionId = 'dataReview';
					}
					setStatusBar(processDefinitionId, pledgeType);

					// 追加显示合同编号 2016-12-09
					$("#contractNum").html(loaninfo.contractNum);
					$("#contractNum").next().children().attr("value",
							loaninfo.contractNum);
				}
			});
	function getRoundDigital(digit, length) {
		length = length ? parseInt(length) : 0;
		if (length <= 0)
			return Math.round(digit);
		digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
		return digit;
	}

	$
			.ajax({
				url : "/admin/customer/getCarInfo?uuid=" + customer_id_hidden,
				type : "get",
				dataType : "json",
				success : function(data) {
					var details = data.guaranteeEvaluateInfo.indoor.split(",");
					// 这里初始化内部设备,页面checkbox选中
					for ( var key in data.carIndoorEnum) {
						console.log("属性：" + key + ",值："
								+ data.carIndoorEnum[key]);
						if (data.guaranteeEvaluateInfo.indoor
								.indexOf(data.carIndoorEnum[key]) > -1) {
							// 设置为checked
							$('#' + key).attr("checked", true);
						}
					}
					var carTool = data.guaranteeEvaluateInfo.tool;
					// 这里初始化工具
					for ( var key in data.carToolEnum) {
						console
								.log("属性：" + key + ",值："
										+ data.carToolEnum[key]);
						if (carTool.indexOf(data.carToolEnum[key]) > -1) {
							// 设置为checked
							$('#' + key).attr("checked", true);
						}
					}
					// select框 颜色
					for ( var key in data.carColorEnum) {
						console.log("属性：" + key + ",值："
								+ data.carColorEnum[key]);
						if (data.guaranteeEvaluateInfo.color
								.indexOf(data.carColorEnum[key]) > -1) {
							// 设置为checked
							$('#' + key).attr("selected", true);
						}
					}
					// select框 车辆型号
					for ( var key in data.vehicleModelEnum) {
						console.log("属性：" + key + ",值："
								+ data.vehicleModelEnum[key]);
						if (data.guaranteeEvaluateInfo.vehicleModels
								.indexOf(data.vehicleModelEnum[key]) > -1) {
							// 设置为checked
							$('#' + key).attr("selected", true);
						}
					}
					for ( var key in data.carStructureEnum) {
						console.log("属性：" + key + ",值："
								+ data.carStructureEnum[key]);
						if (data.guaranteeEvaluateInfo.indoor.indexOf(key) > -1) {
							// 设置为checked
							$('#' + data.carStructureEnum[key]).attr(
									"selected", true);
						}
					}

					if ("" == carTool || null == carTool) {
						carTool = "无随车工具";
					}
					var indoor = "";
					var transmissionCase = data.guaranteeEvaluateInfo.indoor
							.split(",")[0];
					var structure = data.guaranteeEvaluateInfo.indoor
							.split(",")[1];
					$("#isExamined")
							.html(data.guaranteeEvaluateInfo.isExamined);
					if (data.guaranteeEvaluateInfo.isExamined == '是') {
						$("#isExamined1").attr("checked", true);
					} else {
						$("#isExamined2").attr("checked", true);
					}
					$("#isInsure").html(data.guaranteeEvaluateInfo.isInsure);
					if (data.guaranteeEvaluateInfo.isInsure == '是') {
						$("#isInsure1").attr("checked", true);
					} else {
						$("#isInsure2").attr("checked", true);
					}
					$("#isProvince")
							.html(data.guaranteeEvaluateInfo.isProvince);
					if (data.guaranteeEvaluateInfo.isProvince == '是') {
						$("#isProvince1").attr("checked", true);
					} else {
						$("#isProvince2").attr("checked", true);
					}
					$("#vehicleBrand").html(
							data.guaranteeEvaluateInfo.vehicleBrand);
					$("#vehicleBrand").next().attr("value",
							data.guaranteeEvaluateInfo.vehicleBrand);
					$("#vehicleModels").html(
							data.guaranteeEvaluateInfo.vehicleModels);
					// $("#vehicleModels").next().attr("value",data.guaranteeEvaluateInfo.vehicleModels);
					$("#vehicleNo").html(data.guaranteeEvaluateInfo.vehicleNo);
					$("#vehicleNo").next().attr("value",
							data.guaranteeEvaluateInfo.vehicleNo);
					$("#mileaged").html(
							data.guaranteeEvaluateInfo.mileaged + "km");
					$("#mileaged").next().children().attr("value",
							data.guaranteeEvaluateInfo.mileaged);
					$("#purchaseDate").html(
							data.guaranteeEvaluateInfo.purchaseDate.substring(
									0, 10));
					$("#date").attr(
							"value",
							data.guaranteeEvaluateInfo.purchaseDate.substring(
									0, 10));
					$("#vehicleIdentification").html(
							data.guaranteeEvaluateInfo.vehicleIdentification);
					$("#vehicleIdentification").next().attr("value",
							data.guaranteeEvaluateInfo.vehicleIdentification);
					$("#engineNo").html(data.guaranteeEvaluateInfo.engineNo);
					$("#engineNo").next("input").attr("value",
							data.guaranteeEvaluateInfo.engineNo);
					for (var i = 2; i < details.length; i++) {
						indoor = indoor + " " + details[i];
					}
					if ("" == indoor || null == indoor) {
						indoor = "无装置";
					}
					$("#indoor").html(indoor);
					$("#transmissionCase").html(transmissionCase);
					// 设置选中
					$("#" + transmissionCase).attr("selected", true);
					$("#configuration").html(
							data.guaranteeEvaluateInfo.configuration);
					$("#structure").html(structure);
					if (structure == '5门5座两厢') {
						$("#FIVE_FIVE_TWO").attr("selected", true);
					} else if (structure == '4门5座三厢') {
						$("#FOUR_FIVE_THREE").attr("selected", true);
					} else if (structure == '其他') {
						$("#OTHER").attr("selected", selected);
					}
					$("#color").html(data.guaranteeEvaluateInfo.color);
					$("#" + data.guaranteeEvaluateInfo.color).attr("selected",
							true);
					$("#tire").html(data.guaranteeEvaluateInfo.tire);
					$("#displacement").html(
							data.guaranteeEvaluateInfo.displacement + "L");
					$("#displacement").next().children().attr("value",
							data.guaranteeEvaluateInfo.displacement);
					var darkLocks1 = data.guaranteeEvaluateInfo.darkLocks;
					if ("" == darkLocks1 || null == darkLocks1) {
						$("#darkLocks").html("无暗锁");
					} else {
						$("#darkLocks").html("有暗锁");
					}

					$("#carTool").html(carTool);
					$("#engine").html(data.guaranteeEvaluateInfo.engine);
					$("#" + data.guaranteeEvaluateInfo.engine).attr("selected",
							true);
					$("#price").html(data.guaranteeEvaluateInfo.price + "万元");
					$("#price").next().children().attr("value",
							data.guaranteeEvaluateInfo.price);
					$("#buyTheWay").html(data.guaranteeEvaluateInfo.buyTheWay);
					$("#" + data.guaranteeEvaluateInfo.buyTheWay).attr(
							"selected", true);
					$("#evaluatePrice").html(
							data.guaranteeEvaluateInfo.evaluatePrice);
					$("#evaluateby")
							.html(data.guaranteeEvaluateInfo.evaluateby);
					var evaluatePrice1 = data.guaranteeEvaluateInfo.evaluatePrice
							+ "万元";
					$("#evaluatePrice").html(evaluatePrice1);
					$("#evaluateConclusion").html(
							data.guaranteeEvaluateInfo.evaluateConclusion);
					$("#vehicleRegisterCode").html(
							data.guaranteeEvaluateInfo.vehicleRegisterCode);
					$("#vehicleRegisterCode").next().children().attr("value",
							data.guaranteeEvaluateInfo.vehicleRegisterCode);
				}
			})

	// 加载所有附件
	$
			.ajax({
				url : "/admin/loan/review/recordnew/" + customer_id_hidden
						+ ".html",
				type : "get",
				dataType : "json",
				success : function(data) {
					// 附件显示
					var attachment = "";
					var type = "";
					var title = "";
					// 循环查找到的所有附件
					for (var q = 0; q < data.loanInfoAttachmentssize; q++) {
						attachment = data.loanInfoAttachments[q];
						type = attachment.attachmentType;
						if (type.indexOf("telephoneRecordings")>-1
								|| type.indexOf("entrustVideo")>-1) {
							// 如果是录音则将
							$("#recordings_" + type).show();
							$("#recordingsIcon_" + type).show();
							$("#recordings_" + type).html(
									attachment.attachmentTitle);
							$("#" + type).children("input").attr("value",
									attachment.attachmentPath);
							$("#" + type).prev().children(":first").attr(
									"onclick",
									"pictureDownload(" + attachment.id + ")");
						}

						else {
							// 这里对查询到的数据进行插入
							$("#" + type).empty().html(
									"<input type=hidden name=" + type
											+ " value="
											+ attachment.attachmentPath
											+ "><img class=example-image src="
											+ attachment.attachmentThumb
											+ " id=img_" + type + ">");
							// 设置修改放大，修改按钮，每次上传成功之后修改对应的img src属性
							$("#" + type).prev().children(":first").attr(
									"onclick",
									"pictureDownload(" + attachment.id + ")");
						}
					}
					// 循环其它集合
					var attachmentOthers = data.loanInfoAttachmentOthers;
					var otherAttachmentMap=data.otherAttachmentInfoMap;
					var attachmentother = "";
					var otherAttachmentInfo="";
					for (var q = 0; q < attachmentOthers.length; q++) {
						attachmentother = attachmentOthers[q];
						otherAttachmentInfo=otherAttachmentMap[attachmentother.attachmentType];
						//var loanId = $("#customer_id_hidden").val().split(":")[0];
						var loanId = loanDetailsAll.uuid;
						var n = $("#"+otherAttachmentInfo.attachmentParentId+" > li").length;
						var name = "img_WU_FILE_"+otherAttachmentInfo.attachmentCode+ n;
						$("#"+otherAttachmentInfo.attachmentParentId)
								.append(
										"<li><div class='file_img' style='display: table-cell;'><p class='tools'><a href='javascript:void(0);' title='保存'><i class='fa  fa-save'></i></a><a href='javascript:void(0);'onclick='Edit(this)' class='btn-edit' title='修改'><i class='fa fa-edit'></i></a> <a href='javascript:void(0);'onclick='deleted(this)' class='btn-edit' title='删除'><i class='fa fa-trash-o'></i></a></p><a href='#' title='放大' id="
												+ name
												+ "> <input type='hidden' name="+otherAttachmentInfo.attachmentCode+" value="
												+ attachmentother.attachmentPath
												+ " /><img class='example-image' src="
												+ attachmentother.attachmentThumb
												+ " id=img_"
												+ name
												+ " /></a></div><section style='display: none;'><div class='clearfix'><a href='javascript:;' class='file pull-left'>选择文件<input id=up_"
												+ name
												+ " class='form-control' type='file' data-url=/admin/file/upload/"
												+ loanId
												+ "/"+otherAttachmentInfo.attachmentCode+".html></a><a class='btn btn-default reply_btn pull-right'><i class='fa fa-reply'></i></a></div><p class='file_img'><img></p></section><h4>"+otherAttachmentInfo.attachmentName+"</h4></li>");
						$("#up_" + name).fileupload({
							dataType : 'json',
							done : function(e, data) {
								doneProcess(data, $("#img_" + name));
							}
						});
						// // 这里对查询到的数据进行插入
						// $("#" + type).empty().html(
						// "<input type=hidden name=" + type + " value="
						// + attachment.attachmentPath
						// + "/><img class=example-image src="
						// + attachment.attachmentPath + " id=img_"
						// + type + ">");
						// // 设置修改放大，修改按钮，每次上传成功之后修改对应的img src属性
						// $("#" +
						// type).prev().children(":first").attr("onclick",
						// "pictureDownload(" + attachment.id + ")");
					}
					var attachments = data.attachmentEnums;
					// 循环绑定事件
					for (var x = 0; x < attachments.length; x++) {
						var attachmentInfo = attachments[x];
						if (attachmentInfo.attachmentNum > 1) {
							for (var k = 1; k <= attachmentInfo.attachmentNum; k++) {
								var type = attachmentInfo.attachmentCode + k;
								(function(i) {
									$('#up_' + i)
											.fileupload(
													{
														dataType : 'json',
														progressall : function(
																e, data) {
															var progress = parseInt(
																	data.loaded
																			/ data.total
																			* 100,
																	10);
															$(
																	'#'
																			+ i
																			+ '_progress .bar')
																	.css(
																			'width',
																			progress
																					+ '%');
														},
														done : function(e, data) {
															// 这里将提交的input框进行控制
															doneProcess(
																	data,
																	$('#img_'
																			+ i));
															$(
																	'#'
																			+ i
																			+ '_progress .bar')
																	.css(
																			'width',
																			0);
														}
													});
									// 绑定清除事件
								})(type);
							}
						} else {
							var type = attachmentInfo.attachmentCode;
							(function(i) {
								$('#up_' + i)
										.fileupload(
												{
													dataType : 'json',
													progressall : function(e,
															data) {
														var progress = parseInt(
																data.loaded
																		/ data.total
																		* 100,
																10);
														$(
																'#'
																		+ i
																		+ '_progress .bar')
																.css(
																		'width',
																		progress
																				+ '%');
													},
													done : function(e, data) {
														// 这里将提交的input框进行控制
														doneProcess(data,
																$('#img_' + i));
														$(
																'#'
																		+ i
																		+ '_progress .bar')
																.css('width', 0);
													}
												});
								// 绑定清除事件
							})(type);
						}

					}
				}

			});
	// 设置直贷，再贷，助贷选择之后出账时间，还款凭证的表示与隐藏
	$("#loandirect").change(function() {
		$("#lenddate_div").css("display", "block");
		$("#lendedpic_div").css("display", "block");
	});
	$("#helploan").change(function() {
		$("#lenddate_div").css("display", "block");
		$("#lendedpic_div").css("display", "block");
	});
	$("#reloan").change(function() {
		$("#lenddate_div").css("display", "none");
		$("#lendedpic_div").css("display", "none");
	});
	// 设置再贷审批中的通过与放弃radio button压下后的处理
	$("#reloanApproveinlineRadio1").change(function() {
		// 选择通过的情况下，利率相关的设置为可见状态
		$("#reloan_rate_div").css("display", "block");
		$("#reloan_starttime_div").css("display", "block");
		$("#relaon_endtime_div").css("display", "block");
	});
	// 放弃的情况下，都设定为不可见状态
	$("#reloanApproveinlineRadio2").change(function() {
		// 选择放弃的情况下，利率相关的设置为可见状态
		$("#reloan_rate_div").css("display", "none");
		$("#reloan_starttime_div").css("display", "none");
		$("#relaon_endtime_div").css("display", "none");
	});
	// 设置再贷审批中的通过与放弃radio button压下后的处理
	$("#helploanApproveinlineRadio1").change(function() {
		// 选择通过的情况下，利率相关的设置为可见状态
		$("#helploan_rate_div").css("display", "block");
		$("#helploan_starttime_div").css("display", "block");
		$("#helplaon_endtime_div").css("display", "block");
	});
	// 放弃的情况下，都设定为不可见状态
	$("#helploanApproveinlineRadio2").change(function() {
		// 选择放弃的情况下，利率相关的设置为可见状态
		$("#helploan_rate_div").css("display", "none");
		$("#helploan_starttime_div").css("display", "none");
		$("#helplaon_endtime_div").css("display", "none");
	});
});

function closePage() {
	$("#lightboxOverlay").remove();
	$("#lightbox").remove();
	$("#order_modal").empty();
	colsediv(0);
}

function setStatusBar(processDefinitionId, pledge_type) {

	// 分别把两个控制条，设置为非可见的状态
	$("#ol_vehiclesLoans").attr("style", "display:none;");
	$("#ol_vehiclesLoans_group").attr("style", "display:none;");
	// 进行条件判断,首先使用最长的进行统计
	var li_arr_group = $("#ol_vehiclesLoans_group").find("span");
	var shortbar = 1; // 默认情况下是短的滚动条
	// 当前节点的index
	var currentindex = 0;

	$.each(li_arr_group, function(index, value) {
		if (($(this).attr("id") == ("ligroup_" + processDefinitionId))
				|| ($(this).attr("id") == ("ligroup_" + processDefinitionId
						.replace(/help/, "re")))
				|| ($(this).attr("id") == ("ligroup_" + processDefinitionId
						.replace(/instock/, "mortgage")))) {
			currentindex = index;
		}

	});
	currentindex = currentindex / 2;
	if (currentindex <= 10) {
		$("#ol_vehiclesLoans").attr("style", "display:block;");
		if (pledge_type == 'vehiclePledge') {
			$("#mortgage_stock").html("押品入库");
			if (processDefinitionId.indexOf("instock") >= 0) {
				processDefinitionId = "mortgage";
			}
		}
	}
	if (currentindex > 10) {
		$("#ol_vehiclesLoans_group").attr("style", "display:block;");
		if (pledge_type == 'vehiclePledge') {
			$("#mortgage_stock").html("押品入库");
			if (processDefinitionId.indexOf("instock") >= 0) {
				processDefinitionId = "mortgage";
			}
		}
		// 使用长状态条
		shortbar = 0;
		// 通过关键字re，help进行判断
		if (processDefinitionId.indexOf("help") >= 0) {
			processDefinitionId = processDefinitionId.replace(/help/, "re");
			// 更换助贷文字
			$("#loanReview_span").html("助贷资料复核");
			$("#laonApprove_span").html("助贷审批");
			$("#contract_span").html("助贷电子合同签订");
			$("#loan_lended_span").html("助贷放款");
		}
	}

	if (shortbar == 1) {
		// 进度条控制
		var li_arr = $("#ol_vehiclesLoans").find("li");
		$
				.each(
						li_arr,
						function(index, value) {
							if ($(this).find("span").eq(0).attr("id") == ("li_" + processDefinitionId)) {
								// 如果找到之后发现index>= 10,则说明已经到分公司放款之后的节点了，因此需要
								// 控制第二个使用第二个状态条进行表示
								if (index + 1 == li_arr.length) {
									$(this).attr("class", "step-end");
									$(this).find("span").eq(0).css(
											"background-color", "#d43f3a");
									$(this).find("span").eq(1).css("color",
											"#d43f3a");
								} else {
									$(this).attr("class", "step-active");
								}
								return false;
							} else {
								$(this).attr("class", "step-done");
								$(this).find("span").eq(0).html("√`");
							}
						});
	} else {
		var li_arr = $("#ol_vehiclesLoans_group").find("li");
		$
				.each(
						li_arr,
						function(index, value) {
							if ($(this).find("span").eq(0).attr("id") == ("ligroup_" + processDefinitionId)) {
								// 如果找到之后发现index>= 10,则说明已经到分公司放款之后的节点了，因此需要
								// 控制第二个使用第二个状态条进行表示
								if (index + 1 == li_arr.length) {
									$(this).attr("class", "step-end");
									$(this).find("span").eq(0).css(
											"background-color", "#d43f3a");
									$(this).find("span").eq(1).css("color",
											"#d43f3a");
								} else {
									$(this).attr("class", "step-active");
								}
								return false;
							} else {
								$(this).attr("class", "step-done");
								$(this).find("span").eq(0).html("√");
							}
						});
	}

}
function pictureDownload(oid) {
	$("#downloadIframe").attr("src", "/admin/loan/getroute?id=" + oid);
}
$("#file_more").click(function() {

	$(".nav-tabs").find("li").removeClass('active');
	$("#file_tab").addClass('active');
	$("#file_tab a").attr("aria-expanded", "true");
	location.hash = 'header';
});
function Edit(oid) {
	$(oid).parents(".file_img").hide();
	$(oid).parents("li").find("section").show();
	$(oid).parents("li").find("section").find($(".reply_btn")).click(
			function() {
				$(oid).parents(".file_img").show();
				$(oid).parents("li").find("section").hide();
			});
}
$("#add_file")
		.click(
				function() {
					var n = $("#contractInformation > li").length;
					$("#contractInformation")
							.append(
									'<li> <section style=""><div class="clearfix"><a href="javascript:;" class="file pull-left">选择文件<input id="up_img_WU_FILE_'
											+ n
											+ '" class="form-control" type="file"></a></div><p class="file_img"><img id="imgShow_WU_FILE_'
											+ n
											+ '"></p></section><input type="text" class="" placeholder="附件名称" /></li>');

					$("#up_img_WU_FILE_" + n).fileupload({
						dataType : 'json',
						done : function(e, data) {
							doneProcess(data, $("#imgShow_WU_FILE_" + n));
						}
					});
					n = n + 1;

				});
function removeError() {
	$(".error").hide();
}
// 清空方法
function deleted(oid) {
	if (!$(oid).parent().next().children("input").val() == null
			|| !$(oid).parent().next().children("input").val() == '') {
		// 查找后面的input 和img
		if (confirm("你确定删除数据吗？")) {
			if ($(oid).parent().parent().attr("class") == 'file_img file_mvo') {
				$("#recordings").hide();
				$("#recordingsIcon").hide();
				$(oid).parent().next().children("input").attr("value", "");
			} else {
				$(oid).parent().next().children("input").attr("value", "");
				$(oid).parent().next().children("img").removeAttr("src").hide();
			}
		}
	}

}