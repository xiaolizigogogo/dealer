	var uuid;
	var strarray = new Array();
	var customer_id_hidden;
	var orderid;
	var taskId;
	var businesskey;
	var activityId;
	var repaymentUuid;
	var customerId;
	var assignee;
	var uploadsccuss = -1;
	//本期还款金额总额
	var totalrepayAmount = 0;
	//本期还款金额剩余部分
	var surplus_rpd_money = 0;
    //总还款期数
    var totalperiods = 0;
    //当前还款期数
    var currentperiod = 0;
	var repayWay_continueloan = "";
	//本期要还的除利息以外的及所有金额
	var totalInterest = 0;
	//剩余还款金额
	var surplusAmount = 0;
	function doNowRepayment(customer_id_hidden,repaymentAmount,repaymentUuid){
		 var load;
            $.ajax({
                type: 'POST',
                url: '/admin/loan/submitNowRepayment',
	            beforeSend: function () {
		            load = layer.load();
	            },
                data: {
                    "loanId": customer_id_hidden,
                    "repaymentAmount": repaymentAmount,
                    "repaymentUuid": repaymentUuid
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                    	layer.close(load);
                    	layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                    		 	$("#fade2").css("display","none");
	                            //parent.document.getElementById('fade1').style.display='none';
		                    $("#fade1").hide();
	                            if(window.location.href.indexOf("newtask")>0){
	                        		document.location.href = '/admin/loan/newtask.html';
	                        	}else if(window.location.href.indexOf("agency")>0){
	                        		document.location.href = '/admin/loan/agency.html';
	                        	}else{
	                        		document.location.href = '/admin/loan/loanAfterInfoList.html';
	                        	}
	                            return true;
                    	});
	                    
                    } else {
	                    layer.close(load);
	                    layer.alert("操作失败!可能原因：" + data, {icon: 2});
                        return false;
                    }
                }, error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                    return false;
                }
            })
	}
	/**
	 *  已拖车处理
	 */
	function CarDispose() {

		var saleMoney = $("#saleMoney").val();
		var repaymentMoney = $("#repaymentMoney").val();
		var repaymentMoney2 = $("#repaymentMoney2").val();
		var taskId = $("#taskid").val();
		var flag = $("#flag").val();
		var repaymentContent = $("#callRemark").val();




		if (flag == "saleRepayment") {
			if(saleMoney == ''){
				layer.msg("请输入卖出金额");
				return;
			}

			if(isNaN(saleMoney)){
				layer.msg("请输入正确的卖出金额");
				return;
			}



		} else if (flag == "detainedCarRepayment") {

			if(repaymentMoney == ''){
				layer.msg("请输入还款金额");
				return;
			}

			if(isNaN(repaymentMoney)){
				layer.msg("请输入正确的还款金额");
				return;
			}

		} else if(flag == "vehicleNoSaleRepayment"){

			if(repaymentMoney2 == ''){
				layer.msg("请输入还款金额");
				return;
			}

			if(isNaN(repaymentMoney2)){
				layer.msg("请输入正确的还款金额");
				return;
			}
			repaymentMoney = repaymentMoney2;
			var guranteeInfoId = 0;
			var guranteeInfoLoanId = 0;
		}

		$.ajax({
			type: 'POST',
			url: '/admin/loan/completeDetainedCarDispose',
			data: {
				"saleMoney": saleMoney,
				"guranteeInfoId": guranteeInfoId,
				"guranteeInfoLoanId": guranteeInfoLoanId,
				"repaymentMoney": repaymentMoney,
				"repaymentFlag": flag,
				"taskId": taskId,
				"remarkContent":repaymentContent
			},
			dataType: "text",
			success: function (data) {
				if (data == '0000') {
					layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						colsediv(0);
						document.location.href = '/admin/loan/loanAfterInfoList.html';
						return true;
					});
				} else {
					layer.msg("操作失败!可能原因：" + data);
					return false;
				}
			}, error: function () {
				layer.msg("未知错误!");
				return false;
			}
		})

	}
	function submitNowRepayment(){
		var repaymentAmount = $("#repaymentAmount1").val(); 
		if(repaymentAmount <= 0){
			layer.msg("本次还款金额不能小于等于0！");
			return;
		}else if (repaymentAmount > surplus_rpd_money)
		{
			layer.msg("本次还款金额不能大于本期剩余还款金额，请确认本次还款金额后重试！");
			return;
		}
		var dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
		alertMessage(dialogMsg,'doNowRepayment("'+customer_id_hidden+'","'+repaymentAmount+'","'+repaymentUuid+'")','qs_box1');
	}
	
	function loanController(activityId){
		$("#op_box_" + activityId).css("display","block");
		if(activityId == "repaymented"){  //还款评审
			$("#submitA").on("click",repaymentReview);
		}else if(activityId == "advancedRepaymented"){	//提前还款
			$("#op_box_repaymented").css("display","block");
			$("#submitA").on("click",repaymentReview);
		}else if(activityId == "urgeRepayment"){ //催收
			$("#submitA").attr("onclick","uregeRepaymentRepaymeted('repayment')");
		}else if(activityId == "repaymenting"){  //还款
			$("#submitA").attr("onclick","repaymenting('commonRepayment')");
		}else if(activityId == "detainCar"){
			$("#submitA").attr("onclick","detainCar('alreadyTowTruck')");
		}else if(activityId == "lateProcessed"){
			$("#submitA").attr("onclick","lateProcessed('countinueAdjust')");
		}else if(activityId == "lateProcessing"){
			$("#submitA").attr("onclick","lateProcessing('interestHandle')");
		}else if(activityId == "fineSet"){ //罚息
			$("#submitA").attr("onclick","completeUpdatefinFee('fineSet')");
		}else if(activityId == "detainedCarDispose"){
			$("#submitA").attr("onclick","detainedCarDispose('saleRepayment')");
		}else if(activityId == "continueRepayment"){
			$("#submitA").on("click",repaymentReviewToContinue);
		}else if(activityId == "continueUpload"){
			$("#submitA").on("click",submit);
		}else if(activityId == "continueLoan"){
			$("#submitA").on("click",submitContinueLoan);
		}else if(activityId == "badLoanApplication"){
			$("#submitA").attr("onclick","badLoanApplication('badLoanApplication')");
		}
	}
	
	
	function displayUpper(obj) {
        var repaymentAmount = $(obj).val();
	    if (!$.isNumeric(repaymentAmount)) {
		    $(obj).val('');
	    }
        if (repaymentAmount != null && repaymentAmount != '') {
            $("#upper").text(atoc(repaymentAmount));
        }
    }
    
    function doRepaymentReview(customer_id_hidden,repaymentAmount,activityId,taskId,reviewStatus,remark,repaymentUuid){
    	var load;
            $.ajax({
                type: 'POST',
                url: '/admin/loan/completeRepaymentReview.html',
	            beforeSend: function () {
		            load = layer.load();
	            },
                data: {
                    "loanId": customer_id_hidden,
                    "repaymentAmount": repaymentAmount,
                    "type": activityId,
                    "taskId": taskId,
                    "reviewStatus" : reviewStatus,
                    "remark": remark,
                    "repaymentUuid": repaymentUuid
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000' || data == '0001' ) {
                    	if(reviewStatus == "passed" && data == '0000'&& activityId!="continueRepayment"){
                    		layer.close(load);
	                    	$.ajax({
	                        	type: "POST",
	                        	url: "/admin/loan/runRepaymentBpm",
	                        	dataType: "text",
	                        	data: {
	                            	loanId: customer_id_hidden
	                        	},
	                        	success:function(data){
	                        	 	 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
	                        		 $("#fade2").css("display","none");
	                                 //parent.document.getElementById('fade1').style.display='none';
			                         $("#fade1").hide();
	                                 if(window.location.href.indexOf("newtask")>0){
	                             		document.location.href = '/admin/loan/newtask.html';
	                             	}else if(window.location.href.indexOf("agency")>0){
	                             		document.location.href = '/admin/loan/agency.html';
	                             	}else{
	                                 document.location.href = '/admin/loan/loanAfterInfoList.html';
	                             	}
	                                 return true;
	                             });
	                        	}
                    		});
                    	}else{
                    		 layer.close(load);
                    		 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                    		 	$("#fade2").css("display","none");
	                            //parent.document.getElementById('fade1').style.display='none';
			                     $("#fade1").hide();
			                     if(window.location.href.indexOf("newtask")>0){
	                        		document.location.href = '/admin/loan/newtask.html';
	                        	}else if(window.location.href.indexOf("agency")>0){
	                        		document.location.href = '/admin/loan/agency.html';
	                        	}else{
	                            document.location.href = '/admin/loan/loanAfterInfoList.html';
	                        	}
	                            return true;
                    		 });
                    	}
	                    
                    } else {
	                    layer.close(load);
	                    layer.alert("操作失败!可能原因：" + data, {icon: 2});
                        return false;
                    }
                }, error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                    return false;
                }
            });
    }
	
	function repaymentReview() {

        var reviewStatus = $("input[name='reviewStatus']:checked").val();
        var repaymentAmount = "";
        var remark = $("#repaymentReviewRemark").val();

        var dialogMsg = "凭证有误，驳回";
        if ("passed" === reviewStatus) {
            repaymentAmount = $("#repaymentAmount").val();
            if (repaymentAmount == null || repaymentAmount == '') {
                layer.msg("还款金额不能为空!");
                return;
            }
			var repaymentAmount = $("#repaymentAmount").val();
			if(parseInt(repaymentAmount) != parseInt(totalrepayAmount)){
				layer.msg("本期还款金额与本期应还金额必须相等！");
				return;
			}
            dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
        }
        if (remark === "") {
            layer.msg("审查备注不能为空!");
            return;
        }
        
        alertMessage(dialogMsg,'doRepaymentReview("'+customer_id_hidden+'","'+repaymentAmount+'","'+activityId+'","'+taskId+'","'+reviewStatus+'","'+remark+'","'+repaymentUuid+'")'
        		,'qs_box1');
    }
    
    function doRepaymentReviewToContinue(customer_id_hidden,repaymentAmount,activityId,taskId,reviewStatus,remark,repaymentUuid){
    	var load;
		        $.ajax({
		            type: 'POST',
		            url: '/admin/loan/completeRepaymentReview.html',
		            beforeSend: function () {
			            load = layer.load();
		            },
		            data: {
		                "loanId": customer_id_hidden,
		                "repaymentAmount": repaymentAmount,
		                "type": activityId,
		                "taskId": taskId,
		                "reviewStatus" : reviewStatus,
		                "remark": remark,
		                "repaymentUuid": repaymentUuid
		            },
		            dataType: "text",
		            success: function (data) {
		                if (data == '0000') {
		                	if("passed" == reviewStatus && activityId!="continueRepayment"){
		                		layer.close(load);
			                    $.ajax({
			                        type: "POST",
			                        url: "/admin/loan/runRepaymentBpm",
			                        dataType: "text",
			                        data: {
			                            loanId: customer_id_hidden
			                        },
			                        success:function(data){
			                        	$.ajax({
			    	                        type: "POST",
			    	                        url: "/admin/loan/runRepaymentBpm",
			    	                        dataType: "text",
			    	                        data: {
			    	                            loanId: customer_id_hidden
			    	                        },
			    	                        success:function(data){
			    	                        	 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
			    	                        		 $("#fade2").css("display","none");
			    	                                 //parent.document.getElementById('fade1').style.display='none';
						                             $("#fade1").hide();
						                             if(window.location.href.indexOf("newtask")>0){
			    	                             		document.location.href = '/admin/loan/newtask.html';
			    	                             	}else if(window.location.href.indexOf("agency")>0){
			    	                             		document.location.href = '/admin/loan/agency.html';
			    	                             	}else{
			    	                                 document.location.href = '/admin/loan/loanAfterInfoList.html';
			    	                             	}
			    	                                 return true;
			    	                             });
			    	                        }
			                        	});
			                        }
			                	});
		                	}else{
		                		 layer.close(load);
		                		 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
	                        		 $("#fade2").css("display","none");
	                                 //parent.document.getElementById('fade1').style.display='none';
					                 $("#fade1").hide();
	                                 if(window.location.href.indexOf("newtask")>0){
	                             		document.location.href = '/admin/loan/newtask.html';
	                             	}else if(window.location.href.indexOf("agency")>0){
	                             		document.location.href = '/admin/loan/agency.html';
	                             	}else{
	                                 document.location.href = '/admin/loan/loanAfterInfoList.html';
	                             	}
	                                 return true;
	                             });
		                	}
		                } else {
		                    layer.close(load);
		                    layer.alert("操作失败!可能原因：" + data, {icon: 2});
		                    return false;
		                }
		            }, error: function () {
			            layer.close(load);
			            layer.msg("系统错误!");
		                return false;
		            }
		        })
    }

	function repaymentReviewToContinue() {
		 var reviewStatus = $("input[name='continueRepaymentReviewStatus']:checked").val();
		 var repaymentAmount = "";
		 var remark = $("#continueRepaymentRemark").val();
		
		 var dialogMsg = "凭证有误，驳回";
		 if ("passed" === reviewStatus) {
		    repaymentAmount = $("#repaymentAmountContinue").val();
		 if (repaymentAmount == null || repaymentAmount == '') {
		    layer.msg("还款金额不能为空!");
		    return;
		 }
			 //部分还款必须小于本期剩余还款金额
			 if(parseFloat(repaymentAmount) > parseFloat(totalrepayAmount)){
				 layer.msg("续借金额不能大于剩余本金还款金额!");
				 return;
			 }
			 if(parseFloat(repaymentAmount) < parseFloat(totalInterest)){
				 layer.msg("续借还款金额不能小于本期还款利息总和！")
				 return;
			 }
		 	dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
		 }
		 if (remark === "") {
		    layer.msg("续借处理备注不能为空!");
		    return;
		 }
		 
		 alertMessage(dialogMsg,'doRepaymentReviewToContinue("'+customer_id_hidden+'","'+repaymentAmount+'","'+activityId+'","'+taskId+'","'+reviewStatus+'","'+remark+'","'+repaymentUuid+'")'
        		,'qs_box1');
}
	
	function doSubmit(customer_id_hidden,taskId){
		var load;
            $.ajax({
                type: 'POST',
                url: '/admin/loan/continueProceduresReview.html',
	            beforeSend: function () {
		            load = layer.load();
	            },
                data: {
                    "loanId": customer_id_hidden,
                    "taskId": taskId
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
	                    layer.close(load);
	                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
	                    	$("#fade2").css("display","none");
                            //parent.document.getElementById('fade1').style.display='none';
		                    $("#fade1").hide();
                            if(window.location.href.indexOf("newtask")>0){
                        		document.location.href = '/admin/loan/newtask.html';
                        	}else if(window.location.href.indexOf("agency")>0){
                        		document.location.href = '/admin/loan/agency.html';
                        	}else{
                            document.location.href = '/admin/loan/loanAfterInfoList.html';
                        	}
                            return true;
                        });
                    } else {
	                    layer.close(load);
	                    layer.alert("操作失败!可能原因：" + data, {icon: 2});
                        return false;
                    }
                }, error: function () {
		            layer.close(load);
		            layer.msg("系统错误!");
                    return false;
                }
            })
	}
	
	function submit() {
        var dialogMsg = "确定提交吗？";
		if (uploadsccuss != 1) {
			layer.msg("续借合同必须上传！");
			//变量状态复归
			uploadsccuss = -1;
			return false;
		}
		alertMessage(dialogMsg,'doSubmit("'+customer_id_hidden+'","'+taskId+'")','qs_box1');
    }
	 
	 function doSubmitContinueLoan(customer_id_hidden,taskId,reviewStatus,continueAmount,continueLimit,continueDate){
	 	 var load;
	            $.ajax({
	                type: 'POST',
	                url: '/admin/loan/continueLoanReview.html',
		            beforeSend: function () {
			            load = layer.load();
		            },
	                data: {
	                    "loanId": customer_id_hidden,
	                    "taskId": taskId,
	                    "reviewStatus": reviewStatus,
	                    "continueAmount": continueAmount,
	                    "continueLimit": continueLimit,
	                    "continueDate": continueDate
	                },
	                dataType: "text",
	                success: function (data) {
	                    if (data == '0000') {
		                    layer.close(load);
		                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
		                    	$("#fade2").css("display","none");
	                            //parent.document.getElementById('fade1').style.display='none';
			                    $("#fade1").hide();
	                            if(window.location.href.indexOf("newtask")>0){
	                        		document.location.href = '/admin/loan/newtask.html';
	                        	}else if(window.location.href.indexOf("agency")>0){
	                        		document.location.href = '/admin/loan/agency.html';
	                        	}else{
	                            document.location.href = '/admin/loan/loanAfterInfoList.html';
	                        	}
	                            return true;
	                        });
	                    } else {
		                    layer.close(load);
		                    layer.alert("操作失败!可能原因：" + data, {icon: 2});
	                        return false;
	                    }
	                }, error: function () {
			            layer.close(load);
			            layer.msg("系统错误!");
	                    return false;
	                }
	            })
	 }
	 
	 function submitContinueLoan() {

	        var reviewStatus = $("input[name='continueLoanRadio']:checked").val();
		 	//在service层需要对续借的金额做判断，因此追加判断处理
	        var continueAmount = $("#continueAmount").val();
		 	if(continueAmount == ""|| continueAmount == undefined){
				continueAmount = 0;
			}
	        var continueLimit = $("#continueLimit").val();
	        var continueDate = $("#continueDate").val();
	        var dialogMsg = "续借审核有误，退回调整续借手续?";
	        if (reviewStatus === "passed") {
	            dialogMsg = "续借" + continueAmount + "元， 续借" + continueLimit + "期，确定提交吗？";
				//如果是用户进行续借的情况下，针对数额进行判断，必须大于0.
				if(continueAmount<= 0){
					layer.msg("续借金额必须大于0，请确认后重试！");
					return false;
				}
				if((continueDate == null) ||
					(continueDate == undefined)||
					(continueDate=="")){
					layer.msg("续借开始日期必须填写！");
					return false;
				}
	        }
	        
	        alertMessage(dialogMsg,'doSubmitContinueLoan("'+customer_id_hidden+'","'+taskId+'","'+reviewStatus+'","'+continueAmount+'","'+continueLimit+'","'+continueDate+'")'
        		,'qs_box1');
	    }
	    
	    
	function doUregeRepaymentRepaymeted(repaymentContent,taskId,flag){
		 $.ajax({
                type: 'POST',
                url: '/admin/loan/completeUrgeRepayment',
                data: {
                    "remarkContent": repaymentContent,
                    "taskId": taskId,
                    "repaymentFlag": flag
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        	$("#fade2").css("display","none");
                            //parent.document.getElementById('fade1').style.display='none';
	                        $("#fade1").hide();
                            if(window.location.href.indexOf("newtask")>0){
                        		document.location.href = '/admin/loan/newtask.html';
                        	}else if(window.location.href.indexOf("agency")>0){
                        		document.location.href = '/admin/loan/agency.html';
                        	}else{
                            document.location.href = '/admin/loan/loanAfterInfoList.html';
                        	}
                            return true;
                        });
                    } else {
                        layer.msg("操作失败!可能原因：" + data);
                        return false;
                    }
                }, error: function () {
                    layer.msg("未知错误!");
                    return false;
                }
            })
	}
	
	function uregeRepaymentRepaymeted(flag) {

        var repaymentContent = $("#callRemark").val();
        
        if(repaymentContent == null || repaymentContent == ''){
             layer.msg("电话催收备注不能为空！");
             return false;
        }
       

        var reviewStatusStr = "";

        if (flag == "repayment") {
            reviewStatusStr = "进行还款"
        } else if (flag == "renew") {
            reviewStatusStr = "申请续借"
        } else if(flag == "continueRepaymenting"){
            reviewStatusStr = "完成本次催收"
        } else if(flag == "overdueHandle" ){
            reviewStatusStr = "申请逾期处理";
        }

        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";
        
        alertMessage(dialogMsg,'doUregeRepaymentRepaymeted("'+repaymentContent+'","'+taskId+'","'+flag+'")','qs_box1');

    }
	 
	 function doRepaymenting(repaymentContent,taskId,flag){
	 	$.ajax({
	            type: 'POST',
	            url: '/admin/loan/completeRepaymenting',
	            data: {
	                "remarkContent": repaymentContent,
	                "taskId": taskId,
	                "repaymentFlag": flag
	            },
	            dataType: "text",
	            success: function (data) {
	                if (data == '0000') {
	                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
	                    	$("#fade2").css("display","none");
                            //parent.document.getElementById('fade1').style.display='none';
		                    $("#fade1").hide();
                            if(window.location.href.indexOf("newtask")>0){
                        		document.location.href = '/admin/loan/newtask.html';
                        	}else if(window.location.href.indexOf("agency")>0){
                        		document.location.href = '/admin/loan/agency.html';
                        		document.location.href = '/admin/loan/querynewtaskpage.html';
                        	}else{
                            document.location.href = '/admin/loan/loanAfterInfoList.html';
                        	}
	                        return true;
	                    });
	                } else {
	                    layer.msg("操作失败!可能原因：" + data);
	                    return false;
	                }
	            }, error: function () {
	                layer.msg("未知错误!");
	                return false;
	            }
	        })
	 }
	 
	 function repaymenting(flag) {

	        var repaymentUploadProof = $("#repaymentUploadProof").val();// 上传附件

	        var repaymentContent = $("#repaymentingRemark").val();

	        var reviewStatusStr ="";

	        if(flag == "commonRepayment"){
			 reviewStatusStr = "正常还款";
             if (uploadsccuss != 1) {
                 layer.msg("还款凭证必须上传！");
                 return false;
             }
	        }else if(flag == "continueRepayment"){
	            reviewStatusStr = "续借还款"
	        }else if(flag == "advancedRepayment"){
			 reviewStatusStr = "提前还款";

	            if(uploadsccuss != 1){
	                layer.msg("还款凭证必须上传！");
	                return false;
	                }
		 } else if (flag == "abandonRepayment") {
			 reviewStatusStr = "放弃还款";
	            }

			 if (repaymentContent == '' || repaymentContent == null) {
				 layer.msg("还款备注信息不能为空！");
				 return false;
            }


	        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";
	        
	        alertMessage(dialogMsg,'doRepaymenting("'+repaymentContent+'","'+taskId+'","'+flag+'")','qs_box1');


	 }
	/**
     * 逾期处理
     */
     
    function doLateProcessing(repaymentContent,taskId,flag){
    	 $.ajax({
                type: 'POST',
                url: '/admin/loan/completeLateProcessing',
                data: {
                    "remarkContent": repaymentContent,
                    "taskId": taskId,
                    "repaymentFlag": flag
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        	//parent.document.getElementById('fade1').style.display='none';
	                        $("#fade1").hide();
                        	if(window.location.href.indexOf("newtask")>0){
                        		document.location.href = '/admin/loan/newtask.html';
                        	}else if(window.location.href.indexOf("agency")>0){
                        		document.location.href = '/admin/loan/agency.html';
                        	}else{
                            document.location.href = '/admin/loan/loanAfterInfoList.html';
                        	}
	                        return true;
                        });
                    } else {
                        layer.msg("操作失败!可能原因：" + data);
                        return false;
                    }
                }, error: function () {
                    layer.msg("未知错误!");
                    return false;
                }
            })
    }
     
    function lateProcessing(flag) {
           
        var repaymentContent = $("#lateProcessingRemark").val();

        var reviewStatusStr = "";

        if (flag == "noDispose") {
            reviewStatusStr = "暂不处理"
        } else if (flag == "interestHandle") {
            reviewStatusStr = "申请调整罚息"
        } else if(flag == "trackCarHandle"){
            reviewStatusStr = "拖车处理"
        }

        if(repaymentContent == null || repaymentContent==''){
            layer.msg("备注信息不能为空！");
            return;
        }

        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";
        alertMessage(dialogMsg,'doLateProcessing("'+repaymentContent+'","'+taskId+'","'+flag+'")','qs_box1');

    }
    
    function doDetainCar(repaymentContent,taskId,flag){
    	$.ajax({
                type: 'POST',
                url: '/admin/loan/completeDetainCar',
                data: {
                    "remarkContent": repaymentContent,
                    "taskId": taskId,
                    "repaymentFlag": flag
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        	//parent.document.getElementById('fade1').style.display='none';
	                        $("#fade1").hide();
                        	if(window.location.href.indexOf("newtask")>0){
                        		document.location.href = '/admin/loan/newtask.html';
                        	}else if(window.location.href.indexOf("agency")>0){
                        		document.location.href = '/admin/loan/agency.html';
                        	}else{
                            document.location.href = '/admin/loan/loanAfterInfoList.html';
                        	}
	                        return true;
                        });
                    } else {
                        layer.msg("操作失败!可能原因：" + data);
                        return false;
                    }
                }, error: function () {
                    layer.msg("未知错误!");
                    return false;
                }
            })
    }
    
    /**
     * 逾期处理
     */
    function detainCar(flag) {
        var repaymentContent = $("#detainCarRemark").val();

        var reviewStatusStr = "";

        if (flag == "alreadyTowTruck") {
            reviewStatusStr = "已拖车了"
        } else if (flag == "noTowTruck") {
            reviewStatusStr = "未能拖到车"
        }

        if(repaymentContent == '' || repaymentContent== null){
            layer.msg("拖车备注信息不能为空");
            return;
        }
        var dialogMsg = "你确定<font color='red'>" + reviewStatusStr + "</font>吗？";
        
		alertMessage(dialogMsg,'doDetainCar("'+repaymentContent+'","'+taskId+'","'+flag+'")','qs_box1');

    }
    
    function doLateProcessed(repaymentContent,taskId,flag){
    	$.ajax({
                type: 'POST',
                url: '/admin/loan/completeLateProcessed',
                data: {
                    "remarkContent": repaymentContent,
                    "taskId": taskId,
                    "repaymentFlag": flag
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                        layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        	//parent.document.getElementById('fade1').style.display='none';
	                        $("#fade1").hide();
                        	if(window.location.href.indexOf("newtask")>0){
                        		document.location.href = '/admin/loan/newtask.html';
                        	}else if(window.location.href.indexOf("agency")>0){
                        		document.location.href = '/admin/loan/agency.html';
                        	}else{
                            document.location.href = '/admin/loan/loanAfterInfoList.html';
                        	}
	                        return true;
                        });
                    } else {
                        layer.msg("操作失败!可能原因：" + data);
                        return false;
                    }
                }, error: function () {
                    layer.msg("未知错误!");
                    return false;
                }
            })
    }
    
    /**
     * 逾期处理
     */
    function lateProcessed(flag) {
        var repaymentContent = $("#lateProcessedRemark").val();

        var reviewStatusStr = "";

        if (flag == "countinueAdjust") {
            reviewStatusStr = "继续拖车"
        } else if (flag == "interestHandle") {
            reviewStatusStr = "申请调整罚息"
        } else if(flag == "tracked"){
            reviewStatusStr = "已拖车辆处理"
        } else if(flag == "loanApplyEnd"){
            reviewStatusStr = "申请坏账"
        } else if(flag == "countinueUrgeRepayment"){
            reviewStatusStr = "继续催收"
        }

        if(repaymentContent == "" || repaymentContent == null){
            layer.msg("备注信息不能为空！")
            return;
        }

        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";
        
        alertMessage(dialogMsg,'doLateProcessed("'+repaymentContent+'","'+taskId+'","'+flag+'")','qs_box1');

    }
    
    function doCompleteUpdatefinFee(finFee,repayPlanDetailId,repaymentContent){
    	//先调整罚息
                $.ajax({
                    type: 'POST',
                    url: '/admin/loan/updateFinFee',
                    data: {
                        "finFee": finFee,
                        "repayPlanDetailId": repayPlanDetailId
                    },
                    dataType: "text",
                    success: function (data) {
                        if (data == '0000') {
                        	$.ajax({
                                type: 'POST',
                                url: '/admin/loan/completeUpdatefinFee',
                                data: {
                                    "remarkContent": repaymentContent,
                                    "taskId": taskId,
                                    "repaymentFlag": "fineSet"
                                },
                                dataType: "text",
                                success: function (data) {
                                    if (data == '0000') {
                                    	$.ajax({
                	                        type: "POST",
                	                        url: "/admin/loan/runRepaymentBpm",
                	                        dataType: "text",
                	                        data: {
                	                            loanId: customer_id_hidden
                	                        },
                	                        success:function(data){
                	                        	 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                	                        		 //parent.document.getElementById('fade1').style.display='none';
			                                         $("#fade1").hide();
			                                         if(window.location.href.indexOf("newtask")>0){
                	                             		document.location.href = '/admin/loan/newtask.html';
                	                             	}else if(window.location.href.indexOf("agency")>0){
                	                             		document.location.href = '/admin/loan/agency.html';
                	                             	}else{
                	                                 document.location.href = '/admin/loan/loanAfterInfoList.html';
                	                             	}
                	     	                        return true;
                	                             });
                	                        }
                                    	});
                                    } else {
                                        layer.msg("操作失败!可能原因：" + data);
                                        return false;
                                    }
                                }, error: function () {
                                    layer.msg("未知错误!");
                                    return false;
                                }
                            })
                        } else {
                            layer.msg("操作失败!可能原因：" + data);
                            return false;
                        }
                    }, error: function () {
                        layer.msg("未知错误!");
                        return false;
                    }
                })
    }
    
    function completeUpdatefinFee(data) {
        var repaymentContent = $("#fineSetRemark").val();
    	var finFee = $("#updatefinFee").val();
        var repayPlanDetailId = $("#repayPlanDetailId").val()
        var reviewStatusStr = "";
        
        if (data == "fineSet") {
            reviewStatusStr = "完成罚息修改"
        }
        
        if(finFee == ''){
            layer.msg("请输入调整金额");
            return;
        }

        if(repaymentContent == null || repaymentContent == ''){
            layer.msg("罚息调整备注不能为空！");
            return;
        }

        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";
		
		alertMessage(dialogMsg,'doCompleteUpdatefinFee("'+finFee+'","'+repayPlanDetailId+'","'+repaymentContent+'")','qs_box1');

    }
    
    function detainedCarDispose(flag) {
		//记录taskid和flag作为参数传递
		$("#flag").val(flag);
		$("#taskid").val(taskId);
        $.ajax({
            type: 'POST',
            url: "/admin/loan/updateRepaymentStatus",
            data: {
                "taskId": taskId,
                "repaymentFlag": flag
            },
            dataType: "text",
            success: function (data) {
                if (data == '0000') {
                    if (flag == "saleRepayment") {
						opendiv("sta_modal_saleRepayment");
                    }else if(flag == "detainedCarRepayment"){
						opendiv("sta_modal_detainedCarRepayment");
                    }else if(flag == "vehicleNoSaleRepayment"){
						opendiv("sta_modal_vehicleNoSaleRepayment");
                    }
                    return true;
                } else {
                    layer.msg("操作失败!错误编码：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })
    }
    
    function doBadLoanApplication(repaymentContent,taskId,flag){
    	 $.ajax({
                type: 'POST',
                url: '/admin/loan/completeBadLoanApplication',
                data: {
                    "remarkContent": repaymentContent,
                    "taskId": taskId,
                    "repaymentFlag": flag
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000') {
                    	 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {58
                    		 $("#fade2").css("display","none");
                    		 //parent.document.getElementById('fade1').style.display='none';
		                     $("#fade1").hide();
                    		 if(window.location.href.indexOf("newtask")>0){
                         		document.location.href = '/admin/loan/newtask.html';
                         	}else if(window.location.href.indexOf("agency")>0){
                         		document.location.href = '/admin/loan/agency.html';
                         	}else{
                             document.location.href = '/admin/loan/loanAfterInfoList.html';
                         	}
 	                         return true;
                         });
                    } else {
                        layer.msg("操作失败!可能原因：" + data);
                        return false;
                    }
                }, error: function () {
                    layer.msg("未知错误!");
                    return false;
                }
            })
    }
    
    //坏账处理
    function badLoanApplication(flag) {

        var repaymentContent = $("#badLoanRemark").val();

        var reviewStatusStr = "";

        if (flag == "badLoanApplication") {
            reviewStatusStr = "坏账归档"
        }

        if(repaymentContent == null || repaymentContent ==''){
            layer.msg("备注信息不能为空！");
            return;
        }

        var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";
        
        alertMessage(dialogMsg,'doBadLoanApplication("'+repaymentContent+'","'+taskId+'","'+flag+'")','qs_box1');

    }
    
    function loanSubmitSms() {
        var smsContent = $("#smsContent").val();
        if(null == smsContent || "" == smsContent){
        	 layer.msg("短信内容不能为空");
        	 return;
        }
        $.ajax({
            type: 'POST',
            url: '/admin/loan/urgeRepaymentSubmitSms',
            data: {
                "customerId": customerId,
                "smsContent": smsContent
            },

            dataType: "text",
            success: function (data) {
                if (data == '0000') {
                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                        return true;
                    });
                } else if (data == '0001') {
                    layer.msg("今日已发送催收短信，请勿重复发送");
                    return false;
                } else {
                    layer.msg("操作失败!可能原因：" + data);
                    return false;
                }
            }, error: function () {
                layer.msg("未知错误!");
                return false;
            }
        })

    }
    
    //跳转至申请贷款
    function toAddLoan(){
    	//parent.document.getElementById('fade1').style.display='none';
    	$("#fade2").css("display","none");
    	window.location = "/admin/loan/goLoanApplyPage.html?customerId=" + customerId;
    }
    
    //累计还款信息表格
    function addUpPaymentInfo(paymentHistoryList){
    	var html = "";
    	$.each(paymentHistoryList,function(key,value){
    		  html += "<td>"+(key+1)+"</td><td>"+value.createTime+"</td><td>"+value.repaymentAmount+"</td><td>"+value.surplusAmount+"</td>";
    	});
    	return html;
    }
    
	//页面初始化
	$(function() {
		
		
		$("input[type='radio']").click(function(){
			$("input[type='radio']").removeAttr("checked");
			$(this).attr("checked","checked");
		});
		
		var customer_id_hiddenstr = $("#customer_id_hidden").val();
		strarray = customer_id_hiddenstr.split(":");
		customer_id_hidden = strarray[0];
		orderid = strarray[1];
		taskId = strarray[2];
		businesskey = strarray[3];
		activityId = strarray[4];
		//设置订单号
		$("#orderid").html("订单号:"+orderid);
		//if(activityId == 'advancedRepaymented'){
		//	activityId = 'repaymented';
		//}
		repaymentUuid = strarray[5];
		customerId = strarray[6];
		assignee = strarray[7]
		//流程画面控制
        if("null" != assignee && "" != assignee){
             loanController(activityId);
             $("#submitA").show();
        }else{
             $("#submitA").hide();
        }
		//初始化还款凭证图片地址
		$("#repaymentUploadProof").attr("data-url","/admin/file/upload/"+repaymentUuid+"/"+$(this).attr('id')+".html");;
		$('#repaymentUploadProof').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_WU_FILE_0'));
			}
		});
		//初始化续借合同图片地址
		$("#continueUpload").attr("data-url","/admin/file/upload/"+customer_id_hidden+"/continueUpload.html");;
		$('#continueUpload').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_continueUpload'));
			}
		});
		var doneProcess = function (data,obj) {
			$.each(data.result, function (index, file) {
				if (file.code == "0000") {
					layer.msg("上传成功！");
					$(obj).attr("src",file.showFilePath);
					uploadsccuss = 1;
				} else {
					if(file.code == "9999"){
						layer.msg("不支持此类型的文件！");
					}
				}
			});
		};
		$.ajax({
			url : "/admin/loan/repaymentedJson?taskId=" + taskId + "&activitiId=" + activityId + "&businessKey=" + businesskey + "&business=paymentCollection",
			type : "get",
			dataType : "json",
			success : function(data) {
				var leiji_repayment_html = "";
				var wangqi_repayment_html = "";
				
				//金额明细
				var advancerepay = 0;
				if(null != data.repayPlanDetail.advancerepay && "" != data.repayPlanDetail.advancerepay){
					advancerepay = data.repayPlanDetail.advancerepay;
				}
				
				
				$.each(data.rList,function(key,value){
					
					//累计还款信息
					var listn = "#list" + value.repayPlanDetail.repayPeriod;
					var listn1 = "list" + value.repayPlanDetail.repayPeriod;
					var addUpPaymentInfoHtml = addUpPaymentInfo(value.paymentHistoryList);
					leiji_repayment_html += "<tr>" +
					"<td>"+value.repayPlanDetail.repayPeriod+"</td>" +
					"<td style='width:30%;'>"+value.repayPlanDetail.repayTotal+"</td>" +
					"<td><a class=;='collapsed list_btn' role='button' data-toggle='collapse' href='"+listn+"' aria-expanded='false' aria-controls='"+listn1+"'>"+value.repaymentTransactions[0].actualRepaymentSum+"</a>"+
					"<div id='"+listn1+"' class='collapse'>"+
					"<table><tr><th>#</th><th>还款时间</th><th>还款金额</th><th>剩余金额</th></tr>" +
					addUpPaymentInfoHtml +
					"</table><div>" +
					"</td>" +
					"<td>"+(parseFloat(value.repayPlanDetail.repayTotal) - parseFloat(value.repaymentTransactions[0].actualRepaymentSum))+"</td>" +
					"</tr>";
                    //取得已经还款去期数的总和
                    currentperiod ++;
				});
				$("#leiji_repayment").html(leiji_repayment_html);
				
                //如果是最后一期,并且是先息后本的方式才有续借button设置成可见的
                if((parseInt(currentperiod) == parseInt(totalperiods))&&
					((repayWay_continueloan == "InterestRatesBefore")||
					(repayWay_continueloan == "intrestbeforePrincipaltransfer")||
					(repayWay_continueloan == "intrestbeforePrincipalrent"))){
                    $("#inlineRadio4").show();
                    $("#inlineRadio4_label").show();
                }else {
                    $("#inlineRadio4").hide();
                    $("#inlineRadio4_label").hide();
                }
				//Bug:397 start by wangyj  2016-07-12
				//更新还款评审的标题
				var repayTitle = "第"+currentperiod+"期还款评审";
				$("#review_name").html(repayTitle);
				//Bug:397 end by wangyj  2016-07-12
				//更新拖车标题
				var detainCarTitle = "第"+currentperiod+"期逾期处理";
				$("#review_detaincar").html(detainCarTitle);

				//本期还款信息
				$("#repaymentName").html(data.repayPlanDetail.remark);
				$("#repayTotal").html(data.repayPlanDetail.repayTotal);
				$("#repayDate").html(data.repayPlanDetail.repayDate);
				//首先判断日期的大小
				var now = new Date();
				var repaydatetime = Date.parse(data.repayPlanDetail.repayDate);
				var date;
				if(now > repaydatetime){
					//存在延期的情况
					date = (now - repaydatetime)/(24*60*60*1000);
					$("#overdueDay").html(date.toFixed(0));
				}else {
					//当前没有处于逾期的情况
					$("#overdueDay").html("0");
				}
				$("#rpd_money").html(data.repayPlanDetail.repayTotal); //本期还款计划金额
				//记录本期还款总额
				totalrepayAmount = data.repayPlanDetail.repayTotal;
				//记录本期还款利息总和
				totalInterest = data.repayPlanDetail.repayInterest;
				totalInterest += data.repayPlanDetail.manageFee;
				totalInterest += data.repayPlanDetail.gpsCost;
				totalInterest += data.repayPlanDetail.checkCost;
				totalInterest += data.repayPlanDetail.parkCost;
				totalInterest += data.repayPlanDetail.depreciationFee;
				totalInterest += data.repayPlanDetail.drunkDrive;
				totalInterest += data.repayPlanDetail.cashdepositFee;
				totalInterest += data.renzhengfei;
				$("#repayPlanDetailId").val(data.repayPlanDetail.id);
				$("#surplus_rpd_money").html(data.repayPlanDetail.surplusRepayTotal);  //本期剩余应还金额
				//记录本期还款剩余金额
				surplus_rpd_money = data.repayPlanDetail.surplusRepayTotal;
				var actualmoney = parseFloat(data.repayPlanDetail.repayTotal)-parseFloat(data.repayPlanDetail.surplusRepayTotal);
				var float_actualmoney = actualmoney.toFixed(2);
				$("#repaymentAmount").val(float_actualmoney); //还款实际金额
				$("#actualMoeny").html(float_actualmoney);
				$("#smsContent").html("您本月有还款未还截止日" + data.repayPlanDetail.repayDate + ",为免逾期罚息,请及时还款,如已还款请忽略.");
				
				var moneyDetailHtml = "<tr>" +
									  "<td>金额明细</td>" +
									  "<td>"+data.repayPlanDetail.repayCapital+"</td>" +
									  "<td>"+data.repayPlanDetail.repayInterest+"</td>" +
									  "<td>"+data.repayPlanDetail.manageFee+"</td>" +
									  "<td>"+data.repayPlanDetail.gpsCost+"</td>" +
									  "<td>"+data.repayPlanDetail.checkCost+"</td>" +
									  "<td>"+data.repayPlanDetail.parkCost+"</td>" +
									  "<td>"+data.repayPlanDetail.depreciationFee+"</td>" +
									  "<td>"+data.repayPlanDetail.drunkDrive+"</td>" +
									  "<td>"+data.repayPlanDetail.cashdepositFee+"</td>" +
									  "<td>"+data.renzhengfei+"</td>" +
						//"<td>"+advancerepay+"</td>" +
					"<td>"+data.repayPlanDetail.overdueFee+"</td>" +
									  "</tr>";
				$("#moneyDetail").append(moneyDetailHtml);
				
				
				var manyRepaymentHtml = "";
				var actualMoeny = 0;
				//本期多次还款
				$.each(data.paymentHistoryL,function(key,value){
					manyRepaymentHtml += "<tr>"
									+  "<td>"+(key+1)+"</td><td>"+value.createTime+"</td><td>"+value.repaymentAmount+"</td><td>"+value.surplusAmount+"</td>"
									+  "</tr>";
					actualMoeny += parseFloat(value.repaymentAmount);
					surplusAmount = value.surplusAmount;
				});
				$("#manyRepayment").html(manyRepaymentHtml);
				$("#repayPeriod").html(data.repayPlanDetail.remark);
				//$("#actualMoeny").html(actualMoeny);
								
				//剩余还款金额，从多次还款的历史中，取得最后一次还款的数据
				$("#continueAmount").val(surplusAmount)
			}
		});
		
		//还款方式
		$("input[name='repaymentingRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","repaymenting('"+v+"')");
			
			if(v == "commonRepayment" || v == "advancedRepayment"){
				$("#repaymenting_photoDiv").show();
			}else{
				$("#repaymenting_photoDiv").hide();
			}
			
		});
        //续借确认
        $("input[name='continueRepaymentReviewStatus']").click(function(){
            var v = $(this).attr("value");
            if(v == "passed"){
                $("#continueRepayAmountDiv").show();
            }
            else{
                $("#continueRepayAmountDiv").hide();
            }
        });
		//处理方式
		$("input[name='lateProcessingRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","lateProcessing('"+v+"')");
		});
		
		//催收
		$("input[name='urgeRepaymentRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","uregeRepaymentRepaymeted('"+v+"')");
		});
		
		//拖车
		$("input[name='detainCarRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","detainCar('"+v+"')");
		});
		//风控二次处理
		$("input[name='lateProcessedRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","lateProcessed('"+v+"')");
		});
		$("input[name='detainedCarDisposeRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","detainedCarDispose('"+v+"')");
		});
		
		
		//设置订单号
		$("#orderid").html("订单号:"+orderid);
		
		function getRoundDigital(digit, length) {
			length = length ? parseInt(length) : 0;
			if (length <= 0) return Math.round(digit);
			digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
			return digit;
		}
		//取得借款数据
		$.ajax({
			url : "/admin/loan/loanreqinfo?uuid=" + customer_id_hidden,
			type : "get",
			dataType : "json",
			success : function(data) {
				//申请金额处理
				var applymoney = data.loanInfo.applyMoney/10000;
				if(data.loanInfo.loanMoney == '0.00'){
					$("#reviewMoney").val(data.loanInfo.applyMoney);
				}else if(data.loanInfo.loanMoney != '0.00'){
					$("#reviewMoney").val(data.loanInfo.loanMoney);
				}
				var applaymoneyround = getRoundDigital(applymoney,2);
				var dispstr = "<b class=\"text-danger\">";
				dispstr = dispstr + applaymoneyround;
				dispstr = dispstr + "</b> 万元";
				$("#applyMoney").html(dispstr);
				//审批金额
				var approvemoney = data.loanInfo.loanMoney/10000;
				var approvemoneyround = getRoundDigital(approvemoney,2);
				dispstr = "<b class=\"text-danger\">";
				dispstr = dispstr + approvemoneyround;
				dispstr = dispstr + "</b> 万元";
				$("#approveMoney").html(dispstr);
				if(approvemoney == 0){
					approvemoney = data.loanInfo.applyMoney/10000;
					approvemoneyround = getRoundDigital(approvemoney,2);
					dispstr = "<b class=\"text-danger\">";
					dispstr = dispstr + approvemoneyround;
					dispstr = dispstr + "</b> 万元";
					$("#approveMoney1").html(dispstr);
				}else {
					$("#approveMoney1").html(dispstr);
				}
				//借款状态
				var record = data.loanInfo;
				if(record.loanStatus == "vehicleAssess"){
					loanstatus = "待车辆评估";
				}else if(record.loanStatus == "departLeadAduit"){
					loanstatus = "待初审";
				}else if(record.loanStatus == "departLeadAduit_rejected"){
					loanstatus = "初审不通过";
				}else if(record.loanStatus == "trialPhase"){
					loanstatus = "待总部面审";
				}else if(record.loanStatus == "trialPhase_rejected"){
					loanstatus = "总部面审不通过";
				}else if(record.loanStatus == "callBack"){
					loanstatus = "待总部电话回访";
				}else if(record.loanStatus == "visiteCheck"){
					loanstatus = "待线下上门核实";
				}else if(record.loanStatus == "judgment"){
					loanstatus = "待总部终审";
				}else if(record.loanStatus == "judgment_rejected"){
					loanstatus = "总部终审不通过";
				}else if(record.loanStatus == "signContract"){
					loanstatus = "待线下签订相关合同";
				}else if(record.loanStatus == "signContract_rejected"){
					loanstatus = "签订合同终止";
				}else if(record.loanStatus == "dataReview"){
					loanstatus = "资料复核";
				}else if(record.loanStatus == "reuploadInformatin"){
					loanstatus = "资料或相关合同重新上传";
				}else if(record.loanStatus == "lended"){
					loanstatus = "待出账";
				}else if(record.loanStatus == "repayment"){
					loanstatus = "还款中";
				}else if(record.loanStatus == "end"){
					loanstatus = "已完结";
				}
				if(record.loanStatus != "vehicleAssess"){
					$("#makeassessmsg").css("display","none")
				}

				$("#loanstatus").html(loanstatus);

				//Bug:367对应。根据贷款状态更新进度条的进度信息，由于贷后只有还款和已完结状态，因此只对应这两种状态即可。
				if(record.loanStatus == "repayment"){
					$("#repaymenting_li").attr("class","step-active");
					$("#ended_li").attr("class","step-end");
				}else if(record.loanStatus == "end"){
					$("#repaymenting_li").attr("class","step-done");
					$("#span1").html("√");
					$("#ended_li").attr("class","step-done step-end");
					$("#span3").html("√");
				}
				var pledgeType = data.loanInfo.pledgeType;
				var pledgeTypeStr = "";
        	    if(pledgeType == "drivePledge"){
					pledgeTypeStr = "押证";
        	    }else if(pledgeType == "vehiclePledge"){
					pledgeTypeStr = "押车";
				}
				$("#mortgageType").html(pledgeTypeStr);
				//订单号
				$("#loanorderid").html(orderid);
				//借款人
				$("#loanername").html(data.loanInfo.customerRegisterInfo.customerName);
				//申请时间
				$("#applytime").html(data.loanInfo.applyedAt);
				//还款来源
				$("#repaymentsrc").html(data.loanInfo.repaySource);
				//所属分公司
				$("#loancompany").html(data.loanInfo.company.name);
				//所属部门
				$("#loandept").html(data.loanInfo.dept.name);
				//客户经理
				$("#customermanager").html(data.loanInfo.responsibleBy.realname);
				//录入人
				$("#loanrecorder").html(data.loanInfo.createBy.realname);
				//录入时间
				$("#createtime").html(data.loanInfo.createdAt);
				//年利率
				var yearrate = data.loanInfo.loanRate;
				var yearratestr = getRoundDigital(yearrate,2);
				yearratestr += "%";
				$("#yearrate").html(yearratestr);
				$("#yearrate1").html(yearratestr);
				//月利率
				var monthrate = yearrate/12;
				var monthratestr = getRoundDigital(monthrate,2);
				monthratestr += "%";
				$("#monthrate").html(monthratestr);
				$("#monthrate1").html(monthratestr);
                //获得贷款总期数
                totalperiods = data.loanInfo.loanLimitTime;
				//贷款期限
				var periodstr = data.loanInfo.loanLimitTime;
				periodstr += "个月";
				$("#period").html(periodstr);
				$("#period1").html(periodstr);
				//开户名
				var accountname = data.accountInfo.accountName;
				$("#accountname").html(accountname);
				//开户行
				var accountbank = data.accountInfo.bankName;
				$("#accountbank").html(accountbank);
				//银行账号
				var accountnumber = data.accountInfo.accountNum;
				$("#accountnumber").html(accountnumber);

				//还款方式追加
				var repayway = record.repayWay;
				//记录还款方式用于进行贷款续借的时候进行使用。
				repayWay_continueloan = record.repayWay;
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
				$("#accountnumber").html(accountnumber);
				//更新续借中的还款方式
				$("#RepayWay_continue").html(repaywaystr);

			}
		});
		function getRoundDigital(digit, length) {
			length = length ? parseInt(length) : 0;
			if (length <= 0) return Math.round(digit);
			digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
			return digit;
		}
		$.ajax({
					url : "/admin/customer/loanerDetailInfo?uuid=" + customer_id_hidden,
					type : "get",
					dataType : "json",	
					success : function(data) {
						var education = data.customerRegisterInfo.education;
						var education1;
						var house = data.customerRegisterInfo.house;
						var house1;
						var maritalStatus = data.customerRegisterInfo.maritalStatus;
						var maritalStatus1;
						var enterpriseType = data.customerAdditionalInfo.enterpriseType;
						var enterpriseType1;
						var position = data.customerAdditionalInfo.position;
						var position1;
						var hasHouse = data.customerAdditionalInfo.hasHouse;
						var hasHouse1;
						var dateJoined1 = data.customerAdditionalInfo.dateJoined;
						var enterpriseIndustry=data.customerAdditionalInfo.enterpriseIndustry;
						var enterpriseIndustry1;
						
						uuid=data.customerRegisterInfo.uuid;
						
						if (education == "undergraduate") {
							education1 = "本科"
						} else if (education == "college") {
							education1 = "大专"
						} else if (education == "doctor") {
							education1 = "博士及以上"
						} else if (education == "master") {
							education1 = "硕士"
						} else if (education == "senior") {
							education1 = "高中及中专"
						} else {
							education1 = "初中及以下"
						}
						if (house == "commodity") {
							house1 = "商品房无按揭"
						} else if (house == "commodity_mortgage") {
							house1 = "商品房无按揭"
						} else if (house == "commodity_mortgage") {
							house1 = "商品房有按揭"
						} else if (house == "bought_public") {
							house1 = "已购公房"
						} else if (house == "self_build") {
							house1 = "自建房"
						} else if (house == "rent") {
							house1 = "租用"
						} else {
							house1 = "亲属住房"
						}
						if (maritalStatus == "WH") {
							maritalStatus1 = "未婚"
						} else if (maritalStatus == "YH") {
							maritalStatus1 = "已婚"
						} else if (maritalStatus == "LY") {
							maritalStatus1 = "离异"
						} else if (maritalStatus == "SR") {
							maritalStatus1 = "丧偶"
						} else {
							maritalStatus1 = "再婚"
						}
						if (enterpriseType == "institutions") {
							enterpriseType1 = "机关事业单位"
						} else if (enterpriseType == "government") {
							enterpriseType1 = "国有企业"
						} else if (enterpriseType == "three_funded") {
							enterpriseType1 = "三资企业"
						} else if (enterpriseType == "private") {
							enterpriseType1 = "私营"
						} else if (enterpriseType == "professional") {
							enterpriseType1 = "自由职业者"
						} else if (enterpriseType == "social_organization") {
							enterpriseType1 = "社会团体"
						} else {
							enterpriseType1 = "其他"
						}
						if (position == "chairman") {
							position1 = "董事长"
						} else if (position == "director") {
							position1 = "董事"
						} else if (position == "manager") {
							position1 = "总经理"
						} else if (position == "executives") {
							position1 = "单位高管"
						} else if (position == "department_manage") {
							position1 = "部门主管"
						} else {
							position1 = "普通职员"
						}
						if (hasHouse) {
							hasHouse1 = "有"
						} else {
							hasHouse1 = "无"
						}
						if(enterpriseIndustry=="1"){
							enterpriseIndustry1="计算机/互联网/通信/电子";
							}else if(enterpriseIndustry=="2"){
							enterpriseIndustry1="会计/金融/银行/保险";
							}else if(enterpriseIndustry=="3"){
							enterpriseIndustry1="贸易/消费/制造/营运";
							}else if(enterpriseIndustry=="4"){
							enterpriseIndustry1="制药/医疗";
							}else if(enterpriseIndustry=="5"){
							enterpriseIndustry1="广告/媒体";
							}else if(enterpriseIndustry=="6"){
							enterpriseIndustry1="房地产/建筑";
							}else if(enterpriseIndustry=="7"){
							enterpriseIndustry1="专业服务/教育/培训";
							}else if(enterpriseIndustry=="8"){
							enterpriseIndustry1="服务业";
							}else if(enterpriseIndustry=="9"){
							enterpriseIndustry1="物流/运输";
							}else if(enterpriseIndustry=="a"){
							enterpriseIndustry1="能源/原材料";
							}else if(enterpriseIndustry=="b"){
							enterpriseIndustry1="私营企业主";
							}else if(enterpriseIndustry=="c"){
							enterpriseIndustry1="政府/非赢利机构/其他";
							}
						
                        $("#uuid").html(uuid);
						$("#customerName1").html(
								data.customerRegisterInfo.customerName);
						$("#idCard").html(data.customerRegisterInfo.idCard);
						$("#Identityinformation").html(data.customerRegisterInfo.customerName+data.customerRegisterInfo.idCard);
						$("#mobile").html(data.customerRegisterInfo.mobile);
						$("#education").html(education1);
						$("#house").html(house1);
						$("#maritalStatus").html(maritalStatus1);
						$("#liveNumber1").html(
								data.customerRegisterInfo.liveNumber);
						
						$("#liveAddress").html(
								data.customerRegisterInfo.liveAddress);
						$("#enterpriseName").html(
								data.customerAdditionalInfo.enterpriseName);
						$("#enterpriseIndustry").html(
								enterpriseIndustry1);
						$("#enterpriseTel").html(
								data.customerAdditionalInfo.enterpriseTel);
						$("#enterpriseType").html(enterpriseType1);
						$("#position").html(position1);
						
						$("#enterpriseAddress").html(
								data.customerAdditionalInfo.enterpriseAddress);
						
						$("#hasHouse1").html(hasHouse1);
						$("#income").html(data.customerAdditionalInfo.income);
						$("#company-name").html(
								data.customerRegisterInfo.company.name);
						$("#dept-name").html(
								data.customerRegisterInfo.dept.name);
						$("#user-realname").html(
								data.customerRegisterInfo.user.realname);
						$("#creditCardNum").html(
								data.customerRegisterInfo.creditCardNum);
						$("#creditCardQuota").html(
								data.customerRegisterInfo.creditCardQuota);
						$("#creditCardBankName").html(
								data.customerRegisterInfo.creditCardBankName);
						$("#creditCard").html(
								data.customerRegisterInfo.creditCard);
						$("#remark").html(data.customerRegisterInfo.remark);

						$.get(
								"/admin/customer/queryContactsCusId.html?uuid="+uuid,
								function(result) {
									$(result).each(
											function(i) {
												if (result[i].relation == "配偶") {
													$("#spouse_id").val(result[i].id);
													$("#spouse_name").html(
															result[i].contactsName);
													$("#spouse_tel").html(
															result[i].contactsTel);
													$("#spouse_mobile").html(
															result[i].contactsMobile)
												}
												if (result[i].contactsTel == "直系亲属1") {
													$("#immediate_id1").val(
															result[i].id);
													$("#immediate_name1").html(
															result[i].contactsName);
													$("#immediate_relation1").html(
															result[i].relation);
													$("#immediate_Mobile1").html(
															result[i].contactsMobile);
												}
												if (result[i].contactsTel == "直系亲属2") {
													$("#immediate_id2").val(
															result[i].id);
													$("#immediate_name2").html(
															result[i].contactsName);
													$("#immediate_relation2").html(
															result[i].relation);
													$("#immediate_Mobile2").html(
															result[i].contactsMobile);
												}
												if (result[i].contactsTel == "其他联系人1") {
													$("#other_id1").val(result[i].id);
													$("#other_name1").html(
															result[i].contactsName);
													$("#other_relation1").html(
															result[i].relation);
													$("#other_mobile1").html(
															result[i].contactsMobile);
												}
												if (result[i].contactsTel == "其他联系人2") {
													$("#other_id2").val(result[i].id);
													$("#other_name2").html(
															result[i].contactsName);
													$("#other_relation2").html(
															result[i].relation);
													$("#other_mobile2").html(
															result[i].contactsMobile);
												}
											});
								})
					}
				});
		$.ajax({
			url : "/admin/customer/getCarInfo?uuid=" + customer_id_hidden,
			type : "get",
			dataType : "json",	
			success : function(data) {
				var details=data.guaranteeEvaluateInfo.indoor.split(",");
				var indoor="";
				var transmissionCase=data.guaranteeEvaluateInfo.indoor.split(",")[0];
				var structure=data.guaranteeEvaluateInfo.indoor.split(",")[1];
				$("#isExamined").html(data.guaranteeEvaluateInfo.isExamined);
				$("#isInsure").html(data.guaranteeEvaluateInfo.isInsure);
				$("#isProvince").html(data.guaranteeEvaluateInfo.isProvince);
				$("#vehicleBrand").html(data.guaranteeEvaluateInfo.vehicleBrand);
				$("#vehicleModels").html(data.guaranteeEvaluateInfo.vehicleModels);
				$("#vehicleNo").html(data.guaranteeEvaluateInfo.vehicleNo);
				$("#mileaged").html(data.guaranteeEvaluateInfo.mileaged+"km");
				$("#purchaseDate").html(data.guaranteeEvaluateInfo.purchaseDate);
				$("#vehicleIdentification").html(data.guaranteeEvaluateInfo.vehicleIdentification);
				$("#engineNo").html(data.guaranteeEvaluateInfo.engineNo);
				for(var i=2;i<details.length;i++){
				    indoor=indoor+" "+details[i];
				}
				if(""==indoor||null==indoor){
					indoor="无装置";
				}
				$("#indoor").html(indoor);
				$("#transmissionCase").html(transmissionCase);
				$("#configuration").html(data.guaranteeEvaluateInfo.configuration);
				$("#structure").html(structure);
				$("#color").html(data.guaranteeEvaluateInfo.color);
				$("#tire").html(data.guaranteeEvaluateInfo.tire);
				$("#displacement").html(data.guaranteeEvaluateInfo.displacement+"L");
				var darkLocks1=data.guaranteeEvaluateInfo.darkLocks;
				if(""==darkLocks1||null==darkLocks1){
					$("#darkLocks").html("无暗锁");
				}else{
					$("#darkLocks").html("有暗锁");
				}
				var carTool=data.guaranteeEvaluateInfo.tool;
				if(""==carTool||null==carTool){
				   carTool="无随车工具";
				}
				$("#carTool").html(carTool);
					$("#engine").html(data.guaranteeEvaluateInfo.engine);
				$("#price").html(data.guaranteeEvaluateInfo.price+"万元");
				$("#buyTheWay").html(data.guaranteeEvaluateInfo.buyTheWay);
				$("#evaluatePrice").html(data.guaranteeEvaluateInfo.evaluatePrice);
				$("#evaluateby").html(data.guaranteeEvaluateInfo.evaluateby);
				var evaluatePrice1=data.guaranteeEvaluateInfo.evaluatePrice+"万元";
				$("#evaluatePrice").html(evaluatePrice1);
				$("#evaluateConclusion").html(data.guaranteeEvaluateInfo.evaluateConclusion);
				
				
				
				
			}})
				$.ajax({
					url : "/admin/loan/getcollectionRecord/" + customer_id_hidden + ".html",
					type : "get",
					dataType : "json",	
					success : function(data) {
						var collection = "";
						var a;
						var count=data.loanReviewRecordSize;
						if(data.loanReviewRecord[count-1].reviewStatus=="repayment"){
							a="还款中";
						}else if(data.loanReviewRecord[count-1].reviewStatus=="end"){
							a="已完结";							
							}else if(data.loanReviewRecord[count-1].reviewStatus=="overdueHandle") {
							a = "坏账处理";
						}else{
							a = "贷前处理";
							}
                        
						var text="电话";
						for(var i=0;i<count;i++){
							var details =data.loanReviewRecord[i];
							var str="<tr>"
								   +"<td>"+(i+1)+"</td>"
							       +"<td>"+a+"</td>"
                                   +"<td>"+text+"</td>"
							       +"<td>"+details.createdAt+"</td>"
							       +"<td>"+details.reviewConclusion+"</td>"
							       +"</tr>"
                        collection=collection+str;
						}
//                        $("#collection tr:last").after(collection);
						$("#collection_tbody").append(collection);
						}});
		$.ajax({
			url : "/admin/loan/getLoanAfterReviewRecord/" + customer_id_hidden + ".html",
			type : "get",
			dataType : "json",
			success : function(data) {
				var count=data.loanReviewRecordSize;
				var collection1 = "";
				for(var i=0;i<count;i++){
					var details =data.loanReviewRecord[i];
					var reviewstatusstr;
					if(details.reviewStatus=="passed"){
						reviewstatusstr="通过";
					}
					else if(details.reviewStatus=="passed"){
						reviewstatusstr="不通过";
					}
					else if(details.reviewStatus=="repayment"){
						reviewstatusstr="进行还款";
					}else if(details.reviewStatus=="renew"){
						reviewstatusstr="申请续借";
					}else if(details.reviewStatus=="continueRepaymenting"){
						reviewstatusstr="完成本次催收";
					}if(details.reviewStatus=="overdueHandle"){
						reviewstatusstr="申请逾期处理";
					}if(details.reviewStatus=="commonRepayment"){
						reviewstatusstr="正常还款";
					}if(details.reviewStatus=="continueRepayment"){
						reviewstatusstr="续借还款";
					}if(details.reviewStatus=="advancedRepayment"){
						reviewstatusstr="提前还款";
					}if(details.reviewStatus=="abandonRepayment"){
						reviewstatusstr="放弃还款";
					}if(details.reviewStatus=="trackCarHandle"){
						reviewstatusstr="拖车处理";
					}if(details.reviewStatus=="noTowTruck"){
						reviewstatusstr="未拖车";
					}if(details.reviewStatus=="noTowTruck"){
						reviewstatusstr="未拖车";
					}if(details.reviewStatus=="loanApplyEnd"){
						reviewstatusstr="申请坏账";
					}if(details.reviewStatus=="loanApplyEnd"){
						reviewstatusstr="申请坏账";
					}if(details.reviewStatus=="badLoanApplication"){
						reviewstatusstr="坏账归档处理";
					}if(details.reviewStatus=="interestHandle"){
						reviewstatusstr="申请罚息调整";
					}if(details.reviewStatus=="fineSet"){
						reviewstatusstr="罚息处理";
					}if(details.reviewStatus=="tracked"){
						reviewstatusstr="已拖车处理";
					}
					//进行还款：repayment  申请续借：renew  完成本次催收：continueRepaymenting 申请逾期处理：overdueHandle
					//正常还款：commonRepayment  续借还款：continueRepayment  提前还款：advancedRepayment 放弃还款：abandonRepayment
					var str="<tr>"
						+"<td>"+details.reviewname+"</td>"
						+"<td>"+details.user.realname+"</td>"
						+"<td>"+reviewstatusstr+"</td>"
						+"<td>"+details.reviewConclusion+"</td>"
						+"<td>"+details.createdAt+"</td>"
						+"</tr>"
					collection1=collection1+str;
				}
//                        $("#collection tr:last").after(collection);
				$("#reviewresult").append(collection1);
			}});
				$.ajax({     
					url : "/admin/loan/review/recordnew/" + customer_id_hidden + ".html",
					type : "get",
					dataType : "json",	
					success : function(data) {	
						var count=data.loanReviewRecordSize;
						var repayPlanVocount=data.repayPlanVosize;
						var repayPlanVo="";
						var abc=data.sumCaptial;
						var info="";
						//附件显示
						var path="";
						var type="";
						for(var q=0;q<data.loanInfoAttachmentssize;q++){
							path=data.loanInfoAttachments[q];
							type=path.attachmentType;
							if(type=="idCardType"){
								$("#aidCardType").attr('href',path.attachmentPath);
								$("#idCardType").attr('src',path.attachmentPath);
							}
							else if(type=="vehicleLicense"){
								$("#avehicleLicense").attr('href',path.attachmentPath);
								$("#vehicleLicense").attr('src',path.attachmentPath);
							}
							else if(type=="registrationCertificate"){
								$("#aregistrationCertificate").attr('href',path.attachmentPath);
								$("#registrationCertificate").attr('src',path.attachmentPath);
							}
							else if(type=="businessInsurancePolicy"){
								$("#abusinessInsurancePolicy").attr('href',path.attachmentPath);
								$("#businessInsurancePolicy").attr('src',path.attachmentPath);
							}
							else if(type=="insurancePolicy"){
								$("#ainsurancePolicy").attr('href',path.attachmentPath);
								$("#insurancePolicy").attr('src',path.attachmentPath);
							}
							else if(type=="oneCarPhoto"){
								$("#aoneCarPhoto").attr('href',path.attachmentPath);
								$("#oneCarPhoto").attr('src',path.attachmentPath);
							}
							else if(type=="signContractReview"){
								$("#asignContractReview").attr('href',path.attachmentPath);
								$("#signContractReview").attr('src',path.attachmentPath);
								}
						}
                        for(var j=0;j<repayPlanVocount;j++){
							var	record=data.repayPlanVo.planList[j];
							var date = new Date(record.repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
							var html = "";
							html += "<tr>";
							html += "<td align='center'>" + record.repayPeriod + "</td>";
							html += "<td align='center'>" + record.repayCapital + "</td>";
							html += "<td align='center'>" + record.repayInterest + "</td>";
							html += "<td align='center'>" + record.manageFee + "</td>";
							html += "<td align='center'>" + record.gpsCost + "</td>";
							html += "<td align='center'>" + record.checkCost + "</td>";
							html += "<td align='center'>" + record.parkCost + "</td>";
							html += "<td align='center'>" + record.depreciationFee + "</td>";
							html += "<td align='center'>" + record.drunkDrive + "</td>";
							html += "<td align='center'>" + record.cashdepositFee + "</td>";
							html += "<td align='center'>" + record.certificateFee + "</td>";
							html += "<td align='center'>" + record.overdueFee + "</td>";
							html += "<td align='center'>" + record.repayTotal + "</td>";
							html += "<td align='center'>" + record.surplusCapital + "</td>";
							//html += "<td align='center'>" + record.advancerepay + "</td>";
							html += "<td align='center'>" + date + "</td>";
							html += "</tr>";
							repayPlanVo=repayPlanVo+html;
						}
						//计算合计金额
						var sum = accAdd(data.repayPlanVo.sumInvest, data.repayPlanVo.sumCaptial);
						sum = accAdd(sum,data.repayPlanVo.sumManageFee);
						sum = accAdd(sum,data.repayPlanVo.sumGpsFee);
						sum = accAdd(sum,data.repayPlanVo.sumCheckFee);
						sum = accAdd(sum,data.repayPlanVo.sumParkFee);
						sum = accAdd(sum,data.repayPlanVo.sumDepreciationFee);
						sum = accAdd(sum,data.repayPlanVo.sumdrunkDrugDrive);
						sum = accAdd(sum,data.repayPlanVo.sumcashdepositFee);
						sum = accAdd(sum,data.repayPlanVo.sumCertificateFee);
						sum = accAdd(sum,data.repayPlanVo.sumOverdueFee);
						repayPlanVo=repayPlanVo+
							"<tr>" + "<td align='center'>合计：</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumCaptial + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumInvest + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumManageFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumGpsFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumCheckFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumParkFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumDepreciationFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumdrunkDrugDrive + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumcashdepositFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumCertificateFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumOverdueFee + "</td>"
							+ "<td align='center'>" + sum.toFixed(2) + "</td>"
							+ "<td align='center'>----</td>"
							+ "<td align='center'>----</td>"
							+"</tr>";
                        $("#repayPlanVo tr:last").after(repayPlanVo);
						for(var i=0;i<count;i++){
							
							var record = data.loanReviewRecord[i];
							var reviewLevel = ""; 
                         	//对贷款状态进行转换      
							if(record.reviewLevel == "vehicleAssess"){                 
								reviewLevel = "车辆评估";                                   
							}else if(record.reviewLevel == "departLeadAduit"){         
								reviewLevel = "初审";                                     
							}else if(record.reviewLevel == "trialPhase"){
								reviewLevel = "总部面审";                                   
							}else if(record.reviewLevel == "callBack"){                
								reviewLevel = "总部电话回访";                                 
							}else if(record.reviewLevel == "visiteCheck"){             
								reviewLevel = "线下上门核实";                                 
							}else if(record.reviewLevel == "judgment"){                
								reviewLevel = "总部终审";                                   
							}else if(record.reviewLevel == "signContract"){            
								reviewLevel = "签订相关合同";                               
							}else if(record.reviewLevel == "dataReview"){              
								reviewLevel = "资料复核";                                 
							}else if(record.reviewLevel == "lended"){                  
								reviewLevel = "出账";                                     
							} 
							
                        var a="";
                        if(record.reviewLevel !="signContract"){
                        	if(record.reviewStatus=="passed"){
                        		a="通过";
                        	}
                        	else if(record.reviewStatus=="passed"){
                        		a="不通过";
                        	}
                        	else{
                        		a="合同调整";
                        	}
                        	
                        }
                          if(record.reviewLevel=="signContract"){
                        	  
                        	  if(record.reviewStatus=="passed"){
                        		  a="已家访";
                        	  }
                        	  else{
                        		  a="未家访";
                        		  
                        	  }
                        	  
                          }
                          
                         var reviewAmount=record.reviewAmount;
                            var reviewAmount1="";
                            if(record.reviewLevel=="judgment"||record.reviewLevel=="trialPhase"){
                            	var reviewAmount = new Number(reviewAmount);
                            	reviewAmount1=reviewAmount.toFixed(2)
                            }else{reviewAmount1="----"}
                            
							var str = "<tr>"
								+"<td>"+ record.user.realname + "</td>"
								+"<td>"+ reviewLevel + "</td>"
								+"<td>"+ a + "</td>"								
								+"<td>"+ reviewAmount1 + "</td>"
								+"<td>"+ record.reviewConclusion + "</td>"
								+"<td>"+ record.createdAt + "</td>"
								+"</tr>";
								
							info = info + str;
						}
						
						$("#examineinfo tr:last").after(info);
						
						
				
					}})
					
					
//			        $('#up_img_WU_FILE_0').click(function(){
//			        	new uploadPreview({UpBtn: "up_img_WU_FILE_0", ImgShow: "imgShow_WU_FILE_0"});
//			        })
//			        
//			        /** 身份证 */
//			        $('#up_img_WU_FILE_0').fileupload({
//			            dataType: 'json',
//			            done: function (e, data) {
//			                doneProcess(data, $('#idCardFileuploadSpan'));
//			            }
//			        });	
//					
//		        var doneProcess = function (data, obj) {
//		            $.each(data.result, function (index, file) {
//		                if (file.code == "0000") {
//		                    layer.msg("上传成功！");
//		                    /** 查询出借款附件 */
//		                    $("#loan_attachment_div").load("${basePath}/admin/loan/getUploadLoanAttachment.html?loanId=${loanInfo.uuid}")
//		                } else {
//		                	if(file.code == "9999"){
//		                		layer.msg("不支持此类型的文件！");
//		                	}
//		                }
//		            });
//		        };
									
				/*BUG323*/
				if(window.location.href.indexOf("loanAfterInfoList")==-1&&window.location.href.indexOf("agency")==-1
						&&window.location.href.indexOf("newtask")==-1)
				{   
					$("#submitA").css("display","none");
				}
				/*BUG323*/

					
	})
