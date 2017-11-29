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
	var channel;
	var uploadsccuss = -1;
	//针对提前还款增加的6个变量
	var advance_Interest = 0;
	var advance_depreciationFee = 0;
	var advance_surplusmoney = 0;
	var advance_drunkDrive = 0;
	var advance_data = "";
	var TotalMoney = 0;
	//本期还款金额总额
	var totalrepayAmount = 0;
	//本期还款金额剩余部分
	var surplus_rpd_money = 0;
    //总还款期数
    var totalperiods = 0;
    //当前还款期数
    var currentperiod = 0;
    //当前期数还款计划时间
    var CurrentPeriodData = "";
	var repayWay_continueloan = "";
	//本期要还的除利息以外的及所有金额
	var totalInterest = 0;
	//剩余还款金额
	var surplusAmount = 0;
	//续借金额
	var continueAmount = 0;
	//续借前部分还款金额
	var repaymentAmountContinue = 0;
	function doNowRepayment(uuid,repaymentAmount,repaymentUuid){
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
                    		 	$("#order_modal").css("display","none");
                    		 	$("#qs_box1").hide();
	                            //parent.document.getElementById('fade1').style.display='none';
		                        $("#fade1").hide();
	                            loanAfterSingleHelper();
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
		var reloanAmount = $("#reloanAmount").val();
		var reviewStatus = $("input[name='reviewStatus']:checked").val();

		if(repaymentAmount != ""){
			if(repaymentAmount <= 0 ){
				layer.msg("本次还款金额不能小于等于0！")
				return;
			}
		}else if(reloanAmount != ""){
			if(reloanAmount <= 0 ){
				layer.msg("本次还款金额不能小于等于0！")
				return;
			}
		}
		else if(activityId=="advancedRepaymented")
		{
			repaymentAmount =parseFloat($("#repaymentAmount").val()) + parseFloat($("#overdueFee").val());
			if(parseFloat(repaymentAmount) < parseFloat(surplus_rpd_money)) {
				layer.msg("提前还款金额应大于剩余本金，请确认本次还款金额！");
				return;
			}
		}
		else if (parseFloat(repaymentAmount) > parseFloat(surplus_rpd_money))
		{
			layer.msg("本次还款金额不能大于本期剩余还款金额，请确认本次还款金额后重试！");
			return;
		}
		if(repaymentAmount != ""){
			var dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
			alertMessage(dialogMsg,'doNowRepayment("'+customer_id_hidden+'","'+repaymentAmount+'","'+repaymentUuid+'")','qs_box1');
		}else if(reloanAmount != ""){
			var dialogMsg = "还款金额为:<font color='red'>" + reloanAmount + "(" + atoc(reloanAmount) + ")</font>是否确认？";
			alertMessage(dialogMsg,'doNowRepayment("'+customer_id_hidden+'","'+reloanAmount+'","'+repaymentUuid+'")','qs_box1');
		}

	}
	//简易还款流程中，分为多次还款单独做成 一个函数。
	//原因：画面上id的不同，后续可以抽象出来，使用一个函数来完成。
	function submitNowRepayment_smpl(){
		var repaymentAmount = $("#repaymentAmount1_receivemoney").val();
		var radioAmount = $("#radioAmount").val();
		if(repaymentAmount <= 0){
			layer.msg("本次还款金额不能小于等于0！");
			return;
		}
		else if(activityId=="advancedRepaymented")
		{
			repaymentAmount =parseFloat($("#repaymentAmount_revmoney").val()) + parseFloat($("#penalty_revmoney").val());
			if(parseFloat(repaymentAmount) < parseFloat(surplus_rpd_money)) {
				layer.msg("提前还款金额应大于剩余本金，请确认本次还款金额！");
				return;
			}
		}
		else if (parseFloat(repaymentAmount) > parseFloat(surplus_rpd_money))
		{
			//根据车易宝要求，当期还款金额可以比当期总还款金额多，作为服务费。因此此处判断消除。
			//layer.msg("本次还款金额不能大于本期剩余还款金额，请确认本次还款金额后重试！");
			//return;
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
			$("#submitA").attr("onclick","repaymenting('"+$('input:radio[name=repaymentingRadio]:checked').val()+"')");
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
		}else if(activityId == "continueRenew"){
			$("#submitA").on("click",repaymentReviewToContinue);
		}else if(activityId == "continueUpload"){
			$("#submitA").on("click",submit);
		}else if(activityId == "continueLoan"){
			$("#submitA").on("click",submitContinueLoan);
		}else if(activityId == "badLoanApplication"){
			$("#submitA").attr("onclick","badLoanApplication('badLoanApplication')");
		}else if(activityId == "continueRepayment"){
			$("#submitA").on("click",repaymentReview);
		}else if(activityId == "receivemoney"){
			$("#submitA").attr("onclick","repaymenting_simple()");
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
	//还款本金
	function refund_Fee(obj) {
        var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//综合服务费
	function refund_Service(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//还款利息
	function refund_Rate(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//办理费
	function refund_Manage(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//GPS流量费
	function refund_Gps(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(sum);		
	}
	//停车费
	function refund_Park(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(sum);		
	}
	//风险保证金
	function refund_Risk(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//违约金
	function refund_Penalty(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//催收费
	function refund_Urgent(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundOverdueFee']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
	}
	//逾期罚息
	function refund_OverdueFee(obj) {
		var value = $(obj).val();
	    if (!$.isNumeric(value)) {
		    $(obj).val('0');
	    }
        if (value != null && value != '') {
            $("#upper").text(atoc(value));
        }
		var sum = accAdd(value,$("[name='refundFee']").val());
			sum = accAdd(sum,$("[name='refundService']").val());
			sum = accAdd(sum,$("[name='refundManage']").val());
			sum = accAdd(sum,$("[name='refundGps']").val());
			sum = accAdd(sum,$("[name='refundPark']").val());
			sum = accAdd(sum,$("[name='refundRisk']").val());
			sum = accAdd(sum,$("[name='refundPenalty']").val());
			sum = accAdd(sum,$("[name='refundRate']").val());
			sum = accAdd(sum,$("[name='refundUrgent']").val());
		$("[name='advanceRefundFee']").val(Math.round(sum));		
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
                    "repaymentUuid": repaymentUuid,
                    "imageUpLoad":"yes",
                    "reviewUpload":$("#img_reviewUpload").val(),
                },
                dataType: "text",
                success: function (data) {
                    if (data == '0000' || data == '0001' ) {
                    	if(reviewStatus == "passed" && data == '0000' && activityId!="continueRepayment"
		                    && activityId!="advancedRepaymented"){
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
	                        		 $("#order_modal").css("display","none");
	                        		 $("#qs_box1").hide();
	                                 //parent.document.getElementById('fade1').style.display='none';
			                         $("#fade1").hide();
	                                 loanAfterSingleHelper();
	                                 return true;
	                             });
	                        	}
                    		});
                    	}else{
	                		//这里将repayment改为3
	                		if(activityId!="continueRepayment"){
	                			$.ajax({
	                			 type: "POST",
	    	                        url: "/admin/loan/doRejectRepayment",
	    	                        dataType: "text",
	    	                        data: {
	    	                            repaymentUuid: repaymentUuid
	    	                        },
	                		});
	                		}
                    		 layer.close(load);
                    		 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
                    		 	$("#fade2").css("display","none");
                    		 	$("#order_modal").css("display","none");
                    		 	$("#qs_box1").hide();
	                            //parent.document.getElementById('fade1').style.display='none';
			                    $("#fade1").hide();
	                            loanAfterSingleHelper();
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

        if(activityId != "continueRepayment"){
            var reviewStatus = $("input[name='reviewStatus']:checked").val();
            var repaymentAmount = "";
            var remark = $("#repaymentReviewRemark").val();
        }else{
            var reloanStatus = $("input[name='reloanStatus']:checked").val();
            var reloanAmountActual = "";
            var reloanRemark = $("#repaymentReloanRemark").val();
        }

        var dialogMsg = "凭证有误，驳回";
        if ("passed" === reviewStatus || "passed" === reloanStatus) {
            if(activityId != "continueRepayment"){
                repaymentAmount = $("#repaymentAmount").val();
                if (repaymentAmount == null || repaymentAmount == '') {
                    layer.msg("还款金额不能为空!");
                    return;
                }
                var repaymentAmount = $("#repaymentAmount").val();
            }else{
                reloanAmountActual = $("#reloanAmountActual").val();
                if (reloanAmountActual == null && reloanAmountActual == '') {
                    layer.msg("还款金额不能为空!");
                    return;
                }
				var repayMoney = $("#repayMoney").html();
	            if (reloanAmountActual != repayMoney){
					layer.msg("本次实际还款金额必须等于续借前部分还款金额");
		            return;
	            }
            }

			if(activityId=="advancedRepaymented") {
				if($("#overdueFee").val()=="")
				{
					layer.msg("请输入违约金!");
					return;
				}
				repaymentAmount =parseFloat($("#repaymentAmount").val()) + parseFloat($("#overdueFee").val());
				if(parseInt(repaymentAmount) < parseInt(surplus_rpd_money)) {
					layer.msg("提前还款金额应大于剩余本金！");
					return;
				}
			}else if("continueRenew" == activityId &&"passed" == reviewStatus && parseInt(currentperiod) == parseInt(totalperiods)
					&&(repayWay_continueloan == "InterestRatesBefore")||(repayWay_continueloan == "intrestbeforePrincipaltransfer")
					||(repayWay_continueloan == "intrestbeforePrincipalrent")){
					if(parseFloat(continueAmount) > parseFloat(repaymentAmount)){
						layer.msg("本次还款金额不能小于本期剩余还款金额与续借金额只和，请确认本次还款金额后重试！");
						return;
					}
			}else if("continueRepayment" != activityId){
				if(parseInt(repaymentAmount) != parseInt(totalrepayAmount)){
					layer.msg("本期还款金额与本期应还金额必须相等！");
					return;
				}
			}
            if(activityId != "continueRepayment"){
                dialogMsg = "还款金额为:<font color='red'>" + repaymentAmount + "(" + atoc(repaymentAmount) + ")</font>是否确认？";
            }else{
                dialogMsg = "还款金额为:<font color='red'>" + reloanAmountActual + "(" + atoc(reloanAmountActual) + ")</font>是否确认？";
            }
        }
        if(activityId != "continueRepayment"){
            if (remark === "") {
                layer.msg("审查备注不能为空!");
                return;
            }
        }else{
            if (reloanRemark === "") {
                layer.msg("审查备注不能为空!");
                return;
            }
        }

        if(activityId != "continueRepayment"){
            alertMessage(dialogMsg,'doRepaymentReview("'+customer_id_hidden+'","'+repaymentAmount+'","'+activityId+'","'+taskId+'","'+reviewStatus+'","'+remark+'","'+repaymentUuid+'")'
                ,'qs_box1');
        }else{
            alertMessage(dialogMsg,'doRepaymentReview("'+customer_id_hidden+'","'+reloanAmountActual+'","'+activityId+'","'+taskId+'","'+reloanStatus+'","'+reloanRemark+'","'+repaymentUuid+'")'
                ,'qs_box1');
        }
    }

    function doRepaymentReviewToContinue(customer_id_hidden,repaymentAmountContinue,activityId,taskId,reviewStatus,remark,repaymentUuid){
    	var load;
		        $.ajax({
		            type: 'POST',
		            url: '/admin/loan/completeRepaymentReview.html',
		            beforeSend: function () {
			            load = layer.load();
		            },
		            data: {
		                "loanId": customer_id_hidden,
		                "repaymentAmount": repaymentAmountContinue,
		                "type": activityId,
		                "taskId": taskId,
		                "reviewStatus" : reviewStatus,
		                "remark": remark,
		                "repaymentUuid": repaymentUuid
		            },
		            dataType: "text",
		            success: function (data) {
		                if (data == '0000') {
		                	//if("passed" == reviewStatus && activityId!="continueRenew" ||
		                		if("rejected" == reviewStatus && activityId == "continueRenew"){
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
			    	                        		 $("#order_modal").css("display","none");
			    	                        		 $("#qs_box1").hide();
			    	                                 //parent.document.getElementById('fade1').style.display='none';
						                             $("#fade1").hide();
						                             loanAfterSingleHelper();
			    	                                 return true;
			    	                             });
			    	                        }
			                        	});
		                	}else{
		                		 layer.close(load);
		                		 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
	                        		 $("#fade2").css("display","none");
	                        		 $("#order_modal").css("display","none");
	                        		 $("#qs_box1").hide();
	                                 //parent.document.getElementById('fade1').style.display='none';
					                 $("#fade1").hide();
					                 loanAfterSingleHelper();
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
		 var remark = $("#continueRepaymentRemark").val();
		 var dialogMsg = "凭证有误，驳回";
		 if ("passed" === reviewStatus) {
			repaymentAmountContinue = $("#repaymentAmountContinue").val();
		 if (repaymentAmountContinue == null || repaymentAmountContinue == '') {
		    layer.msg("还款金额不能为空!");
		    return;
		 }

			 //部分还款必须小于本期剩余还款金额
			 if(parseFloat(repaymentAmountContinue) > parseFloat(totalrepayAmount)){
				 layer.msg("续借金额不能大于剩余本金还款金额!");
				 return;
			 }
			 if(parseFloat(repaymentAmountContinue) < parseFloat(totalInterest)){
				 layer.msg("续借还款金额需大于或等于本期还款利息与其他费用的总和！")
				 return;
			 }
		 	dialogMsg = "还款金额为:<font color='red'>" + repaymentAmountContinue + "(" + atoc(repaymentAmountContinue) + ")</font>是否确认？";
		 }
		 if (remark === "") {
		    layer.msg("续借处理备注不能为空!");
		    return;
		 }

		 alertMessage(dialogMsg,'doRepaymentReviewToContinue("'+customer_id_hidden+'","'+repaymentAmountContinue+'","'+activityId+'","'+taskId+'","'+reviewStatus+'","'+remark+'","'+repaymentUuid+'")'
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
	                    	$("#order_modal").css("display","none");
	                    	$("#qs_box1").hide();
                            //parent.document.getElementById('fade1').style.display='none';
		                    $("#fade1").hide();
                            loanAfterSingleHelper();
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
							if(reviewStatus=="passed") {
								$.ajax({
									type: "POST",
									url: "/admin/loan/runRepaymentBpm",
									dataType: "text",
									data: {
										loanId: customer_id_hidden
									},
									success: function (data) {
									}
								});
							}

							layer.close(load);
							layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
								$("#fade2").css("display","none");
								$("#order_modal").css("display","none");
								$("#qs_box1").hide();
	                            //parent.document.getElementById('fade1').style.display='none';
								$("#fade1").hide();
	                            loanAfterSingleHelper();
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
				/*if((continueDate == null) ||
					(continueDate == undefined)||
					(continueDate=="")){
					layer.msg("续借开始日期必须填写！");
					return false;
				}*/
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
                        	$("#order_modal").css("display","none");
                        	$("#qs_box1").hide();
                            //parent.document.getElementById('fade1').style.display='none';
	                        $("#fade1").hide();
                            loanAfterSingleHelper();
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

			var repayD = $("#repayDate").html();
			if(new Date(repayD)-Date.now()>0)
			{
				reviewStatusStr+="(此订单并未超过还款日期)"
			}
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
					if(flag == "abandonRepayment"){
						$.ajax({
							type: "POST",
							url: "/admin/loan/runRepaymentBpm",
							dataType: "text",
							data: {
								loanId: customer_id_hidden},
							success:function(data){
								layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
									//parent.document.getElementById('fade1').style.display='none';
									$("#fade1").hide();
									$("#fade2").css("display","none");
									$("#order_modal").css("display","none");
									$("#qs_box1").hide();
									//parent.document.getElementById('fade1').style.display='none';
									$("#fade1").hide();
									loanAfterSingleHelper();
									return true;
								});
							}
						});
					}else{
						layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
							//parent.document.getElementById('fade1').style.display='none';
							$("#fade1").hide();
							$("#fade2").css("display","none");$("#order_modal").css("display","none");$("#qs_box1").hide();
							//parent.document.getElementById('fade1').style.display='none';
							$("#fade1").hide();
							loanAfterSingleHelper();
							return true;
						});
					}
				}  else {
					layer.msg("操作失败!可能原因：" + data);
					return false;
				}
			}, error: function () {
				layer.msg("未知错误!");
				return false;
			}
		})
	}
	function doRepaymentConfirm(flag){
		debugger;
		var customer_id_hiddenstr = $("#customer_id_hidden").val();
		/*strarray = customer_id_hiddenstr.split(":");
		customer_id_hidden = strarray[0];
		orderid = strarray[1];
		taskId = strarray[2];
		businesskey = strarray[3];
		activityId = strarray[4];*/
		var loanDetailsAll = map.get(customer_id_hiddenstr);
		customer_id_hidden = loanDetailsAll.uuid;
		orderid = loanDetailsAll.orderId;
		taskId = loanDetailsAll.taskId;
		businesskey = loanDetailsAll.repId;
		activityId = loanDetailsAll.activityId;
		repaymentUuid = loanDetailsAll.repId;
		//设置订单号
		$("#orderid").html("订单号:"+orderid);
		//repaymentUuid = strarray[5];
		$.ajax({
			type: 'POST',
			url: "/admin/loan/completeRepaymentConfirm?loanId=" + customer_id_hidden + "&taskId=" + taskId + "&type="+activityId + "&repaymentUuid=" + repaymentUuid,
			data: 
			$("#op_box_receivemoney").find("form").serializeArray(),
			dataType: "text",
			success: function (data) {
				//如果是续借的情况下，则不重新启动工作流
				if(flag != "continueRepayment" && data != "0001"){
					if(data == "0000"){
					$.ajax({
						type: "POST",
						url: "/admin/loan/runRepaymentBpm",
						dataType: "text",
						data: {
							loanId: customer_id_hidden},
						success:function(data){
							layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
								//parent.document.getElementById('fade1').style.display='none';
								$("#fade1").hide();
								$("#fade2").css("display","none");
								$("#order_modal").css("display","none");
								$("#qs_box1").hide();
								//parent.document.getElementById('fade1').style.display='none';
								$("#fade1").hide();
								loanAfterSingleHelper();
								return true;
							});
						}
					});
					}
				}else {
					//还款续借的情况下
					layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
						//parent.document.getElementById('fade1').style.display = 'none';
						$("#fade1").hide();
						$("#fade2").css("display", "none");
						$("#order_modal").css("display", "none");
						$("#qs_box1").hide();
						//parent.document.getElementById('fade1').style.display = 'none';
						$("#fade1").hide();
						loanAfterSingleHelper();
						return true;
					});
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

	        if("commonRepayment" == flag){
			 reviewStatusStr = "正常还款";
//             if (uploadsccuss != 1) {
//                 layer.msg("还款凭证必须上传！");
//                 return false;
//             }
	        }else if("continueRepayment" == flag){
	            reviewStatusStr = "续借还款"
	        }else if("advancedRepayment" == flag){
			 reviewStatusStr = "提前还款";
//	            if(uploadsccuss != 1){
//	                layer.msg("还款凭证必须上传！");
//	                return false;
//	                }
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
	 * 简易还款流程
	 */
	function repaymenting_simple() {
		var flag = $('input:radio[name=repaymentingRadio_revmoney]:checked').val();
		var radioAmount = $("#radioAmount").val();
		//对还款金额进行判断
		var repaymentAmount = $("#repaymentAmount_revmoney").val();
		//逾期罚息金额，此处判断财务人工输入的逾期罚息费用是否合理。
		//还款金额应该大于等于逾期罚息费用[财务录入]+应还金额
		// 针对罚息调整的金额因为已经放入还款计划中，因而不需要进判断。
		var overdue_predict = 0;
		if($("#overdue_revmoney").css("display")=="block"){
			overdue_predict = $("#overdueFee_revmoney").val();
		}
		if(flag=="commonRepayment"){
			if(parseInt(repaymentAmount) <(parseInt(totalrepayAmount)+parseInt(overdue_predict))){
				var overduemsg = '';
				if (overdue_predict!=0)overduemsg='+本次罚息金额';
				//根据车易宝财务周总的要求，针对每次还款可以大于等于本期应还金额
				layer.msg("本期还款金额应大于等于本期计划还款金额"+overduemsg+"!");
				return;
			}
		}
		//取得评论的内容
		var repaymentContent = $("#repaymentReviewRemark_revmoney").val();
		if (repaymentContent == '' || repaymentContent == null) {
			layer.msg("还款备注信息不能为空！");
			return false;
		}
		
		var date_15 = CurrentPeriodData.substring(0,7) + "-15";
		var date_17 = CurrentPeriodData.substring(0,7) + "-17";
		var advanceRefundDate = $("[name='advanceRefundDate']").val();
		if(flag=="advancedRepayment" && radioAmount=="还款部分"){
			if(Date.parse(advanceRefundDate)< Date.parse(date_15) || Date.parse(advanceRefundDate) > Date.parse(date_17) ){
				layer.msg("部分还款仅在本月 15、16、17日进行！");
				return false;
			}
		}
		var reviewStatusStr ="";
		//根据用户选择提示用户信息
		if(flag == "commonRepayment"){
			reviewStatusStr = "正常还款";
		}else if(flag == "continueRepayment"){
			reviewStatusStr = "续借还款"
		}else if(flag == "advancedRepayment" && radioAmount == "还款全部"){
			reviewStatusStr = "提前还款全部金额";
		}else if(flag == "advancedRepayment" && radioAmount == "还款部分"){
			reviewStatusStr = "提前还款部分金额";
		}else if(flag == "nopass"){
			reviewStatusStr = "把该订单设置为逾期";
		}
		var dialogMsg = "你确定要<font color='red'>" + reviewStatusStr + "</font>吗？";

		alertMessage(dialogMsg,'doRepaymentConfirm("'+flag+'")','qs_box1');
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
                        	 $("#fade2").css("display","none");
                    		 $("#order_modal").css("display","none");
                    		 $("#qs_box1").hide();
                        	loanAfterSingleHelper();
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

        var dialogMsg = "你确定<font color='red'>" + reviewStatusStr + "</font>吗？";
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
                        	 $("#fade2").css("display","none");
                    		 $("#order_modal").css("display","none");
                    		 $("#qs_box1").hide();
                        	loanAfterSingleHelper();
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
	                    if ("countinueUrgeRepayment" == flag) {
		                    $.ajax({
			                    type: "POST",
			                    url: "/admin/loan/runRepaymentBpm",
			                    dataType: "text",
			                    data: {
				                    loanId: customer_id_hidden
			                    },
			                    success: function (data) {
				                    layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
					                    //parent.document.getElementById('fade1').style.display = 'none';
					                    $("#fade1").hide();
					                    $("#fade2").css("display", "none");
					                    $("#order_modal").css("display", "none");
					                    $("#qs_box1").hide();
					                    //parent.document.getElementById('fade1').style.display = 'none';
					                    $("#fade1").hide();
					                    loanAfterSingleHelper();
					                    return true;
				                    });
			                    }
		                    });
	                    }else{
			                 layer.msg("操作成功!", {icon: 1, time: 1000}, function () {
				                 //parent.document.getElementById('fade1').style.display = 'none';
				                 $("#fade1").hide();
				                 $("#fade2").css("display", "none");
				                 $("#order_modal").css("display", "none");
				                 $("#qs_box1").hide();
				                 //parent.document.getElementById('fade1').style.display = 'none';
				                 $("#fade1").hide();
				                 loanAfterSingleHelper();
				                 return true;
			                 });
		                    }
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
                                    "repaymentFlag": "fineSet",
                                    "finFee": finFee
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
			                                         $("#fade2").css("display","none");
                    		 						$("#order_modal").css("display","none");
                    		 						$("#qs_box1").hide();
                	                        		 loanAfterSingleHelper();
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
                    		 $("#order_modal").css("display","none");
                    		 $("#qs_box1").hide();
                    		 //parent.document.getElementById('fade1').style.display='none';
		                     $("#fade1").hide();
                    		 loanAfterSingleHelper();
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
        var customerId = $("#customerId").val();
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
    		  html += "<tr>"+"<td>"+(key+1)+"</td><td>"+value.createTime+"</td><td>"+value.repaymentAmount+"</td><td>"+value.surplusAmount+"</td>"+"</tr>";
    	});
    	return html;
    }
	//页面初始化
	$(function() {

		$("input[type='radio']").click(function(){
			$("input[type='radio']").removeAttr("checked");
			$(this).attr("checked","checked");
		});
		//简易贷后流程，续借申请时，隐藏还款内容。
		$("input[name='repaymentingRadio_revmoney']").change(function(){
			//判断选中的radiobutton
			if($("input[name='repaymentingRadio_revmoney'][checked]").val()=='continueRepayment'){
				$("#multiRepay_receivemoney").css("display","none");
				$("#repayAmountDiv").css("display","none");
				$("#img_receivemoney").css("display","none");
			}else if($("input[name='repaymentingRadio_revmoney'][checked]").val()=='advancedRepayment'){
				$("#multiRepay_receivemoney").css("display","none");
			}
			else{
				$("#multiRepay_receivemoney").css("display","block");
				$("#repayAmountDiv").css("display","block");
				$("#img_receivemoney").css("display","block");
			}
		});
		uuid = $("#customer_id_hidden").val();
		customer_id_hidden = uuid;
		loanId = uuid;
		/*strarray = customer_id_hiddenstr.split(":");
		customer_id_hidden = strarray[0];
		orderid = strarray[1];
		taskId = strarray[2];
		businesskey = strarray[3];
		activityId = strarray[4];
		//if(activityId == 'advancedRepaymented'){
		//	activityId = 'repaymented';
		//}
		repaymentUuid = strarray[5];
		customerId = strarray[6];
		assignee = strarray[7]*/
		var loanDetailsAll = map.get(uuid);
		orderid = loanDetailsAll.orderId;
		taskId = loanDetailsAll.taskId;
		businesskey = loanDetailsAll.repId;
		activityId = loanDetailsAll.activityId;
		repaymentUuid = loanDetailsAll.repId;
		customerId = loanDetailsAll.customerId;
		assignee = loanDetailsAll.assignee;
		channel = loanDetailsAll.channel;
		//设置订单号
		$("#orderid").html("订单号:"+orderid);
		//流程画面控制
		if("null" != assignee && "" != assignee){
			if("yes"==channel){
				$("#submitA").show();
				loanController(activityId);
			}else{
				$("#submitA").hide();
			}
        }else{
             $("#submitA").hide();
        }
		//初始化还款凭证图片地址
		$("#repaymentUploadProof").attr("data-url","/admin/file/upload/"+repaymentUuid+"/repaymentUploadProof.html");;
		$('#repaymentUploadProof').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_WU_FILE_0'));
			}
		});
		//初始化还款凭证图片地址(简易还款流程)
		$("#repaymentUploadProof_revmoney").attr("data-url","/admin/file/upload/"+repaymentUuid+"/repaymentUploadProof_revmoney.html");;
		$('#repaymentUploadProof_revmoney').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_WU_FILE_5'));
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
		//初始评审图片地址
		$("#reviewUpload").attr("data-url","/admin/file/upload/"+repaymentUuid+"/reviewUpload.html");;
		$('#reviewUpload').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_WU_FILE_4'));
			}
		});
		//简单贷后部分还款
		$("#reviewUpload_simple").attr("data-url","/admin/file/upload/"+repaymentUuid+"/reviewUpload.html");;
		$("#reviewUpload_simple").fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#img_reviewUpload_simple'));
			}
		});
		//初始续借还款审核图片地址
		$("#reloanUpload").attr("data-url","/admin/file/upload/"+repaymentUuid+"/reloanUpload.html");;
		$('#reloanUpload').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_WU_FILE_6'));
			}
		});
		
		
		$("#renewcontract_simple").attr("data-url","/admin/file/upload/"+repaymentUuid+"/continueUpload.html");;
		$('#renewcontract_simple').fileupload({
			dataType: 'json',
			done: function (e, data) {
				doneProcess(data,$('#imgShow_renewcontract'));
			}
		});
		var doneProcess = function (data,obj) {
			$.each(data.result, function (index, file) {
				if (file.code == "0000") {
					layer.msg("上传成功！");
					$(obj).attr("src",file.showSmallFilePath);
					$(obj).next().attr("value",file.showFilePath);
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
				
				if(data.repayPlanDetail == null){
					return;
				}
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
					var context="";
					if("0" != value.repayPlanDetail.repayPeriod){
						context+="<div id='"+listn1+"' class='collapse'>"
							+"<table class='table'><thead><tr><th>#</th><th>还款时间</th><th>还款金额</th><th>剩余金额</th></tr></thead><tbody>" + addUpPaymentInfoHtml 
							+"</tbody></table></div>"
					leiji_repayment_html += 
					"<tr>" +
					"<td>"+value.repayPlanDetail.repayPeriod+"</td>" +
					"<td style='width:30%;'>"+value.repayPlanDetail.repayTotal+"</td>" +
					"<td><a class='collapsed list_btn' role='button' data-toggle='collapse' href='"+listn+"' aria-expanded='false' aria-controls='"+listn1+"'>"+value.repaymentTransactions[0].actualRepaymentSum+"</a>"
					+context
					+"</td>"
					+"<td>"+(parseFloat(value.repayPlanDetail.repayTotal) - parseFloat(value.repaymentTransactions[0].actualRepaymentSum))+"</td>"
					+"<td>"+value.updateDay+"</td>"
					+"</tr>";
					}
                    //取得已经还款去期数的总和
                    currentperiod ++;
				});
				$("#leiji_repayment").html(leiji_repayment_html);
				//贷后简易还款流程修正，更新还款确认中，第几期的还款确认
				$("#review_name_revmoney").html("第"+currentperiod+"期还款确认");

                //如果是最后一期,并且是先息后本的方式才有续借button设置成可见的
                //if((parseInt(currentperiod) == parseInt(totalperiods))&&
	            if((parseInt(currentperiod) == parseInt(data.reloanPeriod))&&
					((repayWay_continueloan == "InterestRatesBefore")||
					(repayWay_continueloan == "intrestbeforePrincipaltransfer")||
					(repayWay_continueloan == "intrestbeforePrincipalrent"))){
                   	$("#inlineRadio4").show();
                	$("#inlineRadio5").show();
                    $("#inlineRadio4_label").show();
                    $("#inlineRadio5_label").show();
	                $("#inlineRadio5").attr("checked","checked");
		            var v = $('input:radio[name=repaymentingRadio]:checked').val();
		            if ("repaymenting" == activityId){
			            $("#submitA").attr("onclick","repaymenting('"+v+"')");
		            }
		            $("#inlineRadio_receivemoney_label").show();
					$("#inlineRadio_receivemoney3").show();
                }else {
                    $("#inlineRadio4").hide();
                    $("#inlineRadio5").hide();
                    $("#inlineRadio4_label").hide();
                    $("#inlineRadio5_label").hide();
					$("#inlineRadio_receivemoney_label").hide();
					$("#inlineRadio_receivemoney3").hide();
                }
				//Bug:397 start by wangyj  2016-07-12
				//更新还款评审的标题
				var repayTitle = "第"+currentperiod+"期还款评审";
				var repaymentName="第"+currentperiod+"期还款";
				$("#repayment_name").html(repaymentName);
				$("#review_name").html(repayTitle);
				//Bug:397 end by wangyj  2016-07-12
				//更新拖车标题
				var detainCarTitle = "第"+currentperiod+"期逾期处理";
				$("#review_detaincar").html(detainCarTitle);
				$("#review_lateprocessing").html(detainCarTitle);
				//本期还款信息
				$("#repaymentName").html(data.repayPlanDetail.remark);
				$("#repayTotal").html(data.repayPlanDetail.repayTotal);
				$("#repayDate").html(data.repayPlanDetail.repayDate.substring(0,10));
				//首先判断日期的大小
				var now = new Date();
				var repaydatetime = Date.parse(data.repayPlanDetail.repayDate);
				var date;
				if(now > repaydatetime){
					//存在延期的情况
					date = (now - repaydatetime)/(24*60*60*1000);
					$("#overdueDay").html(parseInt(date));
				}else {
					//当前没有处于逾期的情况
					$("#overdueDay").html("0");
				}
				if("continueRepayment" != activityId){
					$("#rpd_money").html(data.repayPlanDetail.repayTotal); //本期还款计划金额
					//更新简易贷后流程中 ，本期需要还款金额 add by
					$("#rpd_money_receivemoney").html(data.repayPlanDetail.repayTotal); //本期还款计划金额
				}else if("continueRepayment" == activityId){
					$("#repayMoney").html(data.loanReviewInfo.reviewAmount); //本期还款计划金额
				}else{
					$("#repayMoney").html(data.repayPlanDetail.repayTotal); //本期还款计划金额
				}
				//记录本期还款总额
				totalrepayAmount = data.repayPlanDetail.repayTotal;
				//记录本期还款利息总和

				totalInterest = parseInt(data.repayPlanDetail.repayInterest);
				totalInterest +=parseInt( data.repayPlanDetail.manageFee);
				totalInterest +=parseInt( data.repayPlanDetail.gpsCost);
				//totalInterest += data.repayPlanDetail.checkCost;
				totalInterest +=parseInt( data.repayPlanDetail.parkCost);
				totalInterest +=parseInt( data.repayPlanDetail.depreciationFee);
				totalInterest +=parseInt( data.repayPlanDetail.checkCost);
				totalInterest +=parseInt( data.repayPlanDetail.cashdepositFee);
				//totalInterest +=parseInt( data.repayPlanDetail.penaltyFee);
				//totalInterest +=parseInt( data.renzhengfei);
				$("#repayPlanDetailId").val(data.repayPlanDetail.id);
				if(activityId != "continueRepayment"){
					$("#surplus_rpd_money").html(data.repayPlanDetail.surplusRepayTotal);  //本期剩余应还金额
					//简易贷后流程中，更新剩余还款金额
					$("#surplus_rpd_money_revmoney").html(data.repayPlanDetail.surplusRepayTotal);  //本期剩余应还金额
				}else{
					$("#surplus_repayMoney").html(data.repayPlanDetail.surplusRepayTotal - data.loanReviewInfo.reviewAmount);  //本期剩余应还金额
				}
				$("#surplus_rpd_money").html(data.repayPlanDetail.surplusRepayTotal);  //本期剩余应还金额
				//记录本期还款剩余金额
				surplus_rpd_money = data.repayPlanDetail.surplusRepayTotal;
				var actualmoney = parseFloat(data.repayPlanDetail.repayTotal)-parseFloat(data.repayPlanDetail.surplusRepayTotal);
				var float_actualmoney = actualmoney.toFixed(2);
				if(activityId == "renewapplyment"||activityId == "renewReview"){
					float_actualmoney = (0.00).toFixed(2);
				}
				if(activityId != "continueRepayment"){
					$("#repaymentAmount").val(float_actualmoney); //还款实际金额
					$("#actualMoeny").html(float_actualmoney);
					//更新简易贷后流程中的实际还款金额
					$("#repaymentAmount_revmoney").val(float_actualmoney); //还款实际金额
				}else{
					$("#reloanAmountActual").val(float_actualmoney); //还款实际金额
				}
				$("#smsContent").html("您本月有还款未还截止日" + data.repayPlanDetail.repayDate + ",为免逾期罚息,请及时还款,如已还款请忽略.");
				$("#smsContentSimple").html("您本月有还款未还截止日" + data.repayPlanDetail.repayDate + ",为免逾期罚息,请及时还款,如已还款请忽略.");
				var moneyDetailHtml = "<tr>" +
					"<td>金额明细</td>" +
					"<td>"+data.repayPlanDetail.repayCapital+"</td>" +
					"<td>"+data.repayPlanDetail.repayInterest+"</td>" +
					"<td>"+data.repayPlanDetail.depreciationFee+"</td>" +
					"<td>"+data.repayPlanDetail.gpsCost+"</td>" +
					"<td>"+data.repayPlanDetail.drunkDrive+"</td>" +
					"<td>"+data.repayPlanDetail.parkCost+"</td>" +
					"<td>"+data.repayPlanDetail.cashdepositFee+"</td>" +
					"<td>"+data.repayPlanDetail.overdueFee+"</td>" +
					"<td>"+data.repayPlanDetail.checkCost+"</td>" +
					"<td>"+data.repayPlanDetail.repayTotal+"</td>" +
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

				if(activityId=="advancedRepaymented")
				{
					//更新还款评审的标题
					var repayTitle = "提前还款评审";
					$("#review_name").html(repayTitle);
					$("#repaymentAmount").val(advanceRepaySum);
					$("#multiRepay").css("display","none");
					$("#overdue").css("display","block");
					//便宜流程提前还款中，其中关于违约金需要设置为可见
					//$("#overdue_revmoney").css("display","block");						 
				}		
				//简易贷后提前还款
				//提前还款按钮处理
				$("input[name='repaymentingRadio_revmoney']").click(function(){
					debugger;
					$("#repayAmountDiv").hide();
					$("#img_div_receivemoney").show();
					$("#radioAmount").val("还款全部");
					 $("[name='refundFee']").attr("readonly",true);
					var v = $(this).attr("value");
					if(v == "advancedRepayment"){
						$.ajax({
							type :"GET",
							url : "/admin/loan/calculateFee",
							dataType : "json",
							data : {
								"loanId" : customer_id_hidden,
								"taskId" : taskId
							},
							async:false,
							success:function(data){
								advance_surplusmoney=data.advance_surplusmoney;
								advance_Interest=data.advance_Interest;
								advance_depreciationFee=data.advance_depreciationFee;
								advance_data=data.advance_data;
								advance_drunkDrive = data.advance_drunkDrive;
								TotalMoney = data.TotalMoney;
							},error : function(){
								 layer.msg("系统错误!");
				                    return false;
							} 
						});
						 $("[name='refundFee']").val(parseInt(advance_surplusmoney));//还款本金
						 $("[name='refundService']").val(parseInt(advance_depreciationFee)); //综合服务费
						 $("[name='refundRate']").val(parseInt(advance_Interest));//还款利息
						 $("[name='refundManage']").val(parseInt(data.repayPlanDetail.gpsCost));//办理费
						 $("[name='refundGps']").val(parseInt(advance_drunkDrive));//GPS流量费
						 $("[name='refundPark']").val(parseInt(data.repayPlanDetail.parkCost));//停车费
						 $("[name='refundRisk']").val(parseInt(data.repayPlanDetail.cashdepositFee));//风险保障金
						 $("[name='refundPenalty']").val(parseInt(data.repayPlanDetail.overdueFee));//违约金
						 $("[name='refundUrgent']").val(parseInt(data.repayPlanDetail.checkCost));//催收费
						 $("[name='refundOverdueFee']").val(parseInt(data.repayPlanDetail.overdueFee));//罚息
						 $("[name='advanceRefundDate']").val(advance_data);	//还款时间
						 $("[name='advanceRefundFee']").val(Math.round(TotalMoney));//提前还款金额	
						 $(".advance_info").css("display","block");
						//还款全部、还款部分的下拉框处理
						 $("#radioAmount").change(function(){
							 var radioAmount = $("#radioAmount").val();
							 $("[name='refundFee']").removeAttr("readonly");
							 if(radioAmount == "还款部分"){
								 debugger;
								//取得本期还款时间
					    		var onlyrepaymenttime = "";
								$.each(data.repayPlan.planList,function(key,value){
									if(key == data.repayPlanDetail.repayPeriod){
										onlyrepaymenttime = (value.repayDate).substring(0,10);
										CurrentPeriodData = onlyrepaymenttime;
											    return ;
									}
								});	 
								 $(".advance_info").css("display","block");
								 $("[name='refundFee']").val(parseInt(data.repayPlanDetail.repayCapital));//还款本金
								 $("[name='refundService']").val(parseInt(data.repayPlanDetail.depreciationFee)); //综合服务费
								 $("[name='refundRate']").val(parseInt(data.repayPlanDetail.repayInterest));//还款利息
								 $("[name='refundManage']").val(parseInt(data.repayPlanDetail.gpsCost));//办理费
								 $("[name='refundGps']").val(parseInt(data.repayPlanDetail.drunkDrive));//GPS流量费
								 $("[name='refundPark']").val(parseInt(data.repayPlanDetail.parkCost));//停车费
								 $("[name='refundRisk']").val(parseInt(data.repayPlanDetail.cashdepositFee));//风险保障金
								 $("[name='refundPenalty']").val(parseInt(data.repayPlanDetail.overdueFee));//违约金
								 $("[name='refundUrgent']").val(parseInt(data.repayPlanDetail.checkCost));//催收费
								 $("[name='refundOverdueFee']").val(parseInt(data.repayPlanDetail.overdueFee));//罚息
								 $("[name='advanceRefundFee']").val(Math.round(totalrepayAmount));//提前还款金额
							 }else{
								 $("[name='refundFee']").attr("readonly",true);
								 $("[name='refundFee']").val(parseInt(advance_surplusmoney));//还款本金
								 $("[name='refundService']").val(parseInt(advance_depreciationFee)); //综合服务费
								 $("[name='refundRate']").val(parseInt(advance_Interest));//还款利息
								 $("[name='refundManage']").val(parseInt(data.repayPlanDetail.gpsCost));//办理费
								 $("[name='refundGps']").val(parseInt(advance_drunkDrive));//GPS流量费
								 $("[name='refundPark']").val(parseInt(data.repayPlanDetail.parkCost));//停车费
								 $("[name='refundRisk']").val(parseInt(data.repayPlanDetail.cashdepositFee));//风险保障金
								 $("[name='refundPenalty']").val(parseInt(data.repayPlanDetail.overdueFee));//违约金
								 $("[name='refundUrgent']").val(parseInt(data.repayPlanDetail.checkCost));//催收费
								 $("[name='refundOverdueFee']").val(parseInt(data.repayPlanDetail.overdueFee));//罚息
								 $("[name='advanceRefundFee']").val(Math.round(TotalMoney));//提前还款金额				 							 
							 }
						 });
					}else{
						if($("input[name='repaymentingRadio_revmoney'][checked]").val()=='continueRepayment'){
							$("#repayAmountDiv").hide();
							$("#img_div_receivemoney").hide();
						}else{
							$("#repayAmountDiv").show();
							$("#img_div_receivemoney").show();
						}
						$(".advance_info").css("display","none");
						var repaymentAmount_revmoney = $("#repaymentAmount_revmoney").val();
						var sub = accAdd(data.repayPlanDetail.repayTotal,-repaymentAmount_revmoney);
						$("#advance_money").html('本期还款计划金额 <span class="text-danger" id="rpd_money_receivemoney">'+data.repayPlanDetail.repayTotal+'</span> 元'
					             +'&nbsp;&nbsp;&nbsp;本期还款计划剩余金额 <span class="text-danger" id="surplus_rpd_money_revmoney">'+sub.toFixed(2)+'</span> 元 ');
					}
				});
				//提前还款时间的处理
				 $("[name='advanceRefundDate']").change(function(){ 
					 $.ajax({
							type :"GET",
							url : "/admin/loan/calculateFee",
							dataType : "json",
							data : {
								"loanId" : customer_id_hidden,
								"taskId" : taskId,
								"repaymentData" :  $("[name='advanceRefundDate']").val() 
							},
							async:false,
							success:function(data){
								debugger;
								advance_surplusmoney = data.advance_surplusmoney;
								advance_Interest = data.advance_Interest;
								advance_depreciationFee = data.advance_depreciationFee;
								advance_drunkDrive = data.advance_drunkDrive;
								TotalMoney = data.TotalMoney;
								if($("#radioAmount").val() == "还款全部"){
								$("[name='refundFee']").val(parseInt(advance_surplusmoney));//还款本金
								$("[name='refundService']").val(parseInt(advance_depreciationFee)); //综合服务费
								$("[name='refundRate']").val(parseInt(advance_Interest));//还款利息
								$("[name='refundManage']").val(parseInt(data.repayPlanDetail.gpsCost));//办理费
								$("[name='refundGps']").val(parseInt(advance_drunkDrive));//GPS流量费
								$("[name='refundPark']").val(parseInt(data.repayPlanDetail.parkCost));//停车费
								$("[name='refundRisk']").val(parseInt(data.repayPlanDetail.cashdepositFee));//风险保障金
							    $("[name='refundPenalty']").val(parseInt(data.repayPlanDetail.overdueFee));//违约金
								$("[name='refundUrgent']").val(parseInt(data.repayPlanDetail.checkCost));//催收费
								$("[name='refundOverdueFee']").val(parseInt(data.repayPlanDetail.overdueFee));//罚息
								$("[name='advanceRefundFee']").val(Math.round(TotalMoney));//提前还款金额	
								}
							},error : function(){
								 layer.msg("系统错误!");
				                    return false;
							} 
						});
				 });
					//在收款确认时，对逾期罚息是否表示进行判断。判断条件是：
					// ①在逾期天数为0的情况下，不进行表示。
					// ②逾期天数不为0，并且罚息调整后，则还款计划已更新，要求客户按照还款计划还款即可，因而不进行表示。
					// ③逾期天数不为0，并且还款计划未更新的情况下，显示逾期罚息金额，该金额用户可以设置为0
					if(activityId == 'receivemoney'){
						if((data.repayPlanDetail.overdueDay==0)||
							(data.repayPlanDetail.overdueDay==null)||
							(data.repayPlanDetail.overdueDay=='')){
							$("#overdue_revmoney").css("display","none");
						}else if((data.repayPlanDetail.overdueDay>0)&&(data.repayPlanDetail.overdueFee>0)){
							$("#overdue_revmoney").css("display","none");
						}else if((data.repayPlanDetail.overdueDay>0)&&
							((data.repayPlanDetail.overdueFee==0)||
							(data.repayPlanDetail.overdueFee==null)||
							(data.repayPlanDetail.overdueFee==''))){
							$("#overdue_revmoney").css("display","block");
							//更新逾期天数
							$("#overdueday_receivemoney").html(data.repayPlanDetail.overdueDay);
							//更新预计逾期金额
							$("#overduefee_money_revmoney").html(data.overdueFee);
						}
					}else if(activityId == 'fineSet'){
						//更新逾期天数
						$("#overdueday_receivemoney_fineset").html(data.repayPlanDetail.overdueDay);
						//更新预计逾期金额
						$("#overduefee_money_revmoney_fineset").html(data.overdueFee);
						//更新input中的金额，用户可以进行修改
						$("#updatefinFee").val(data.overdueFee);
					}
			}//end for sucess.
		});
		
		//还款方式
		$("input[name='repaymentingRadio']").click(function(){
			var v = $(this).attr("value");
			$("#submitA").attr("onclick","repaymenting('"+v+"')");

			if(v == "commonRepayment" || v == "advancedRepayment" || v == "continueRepayment"){
				$("#repaymenting_photoDiv").show();
				$("#reloan_photoDiv").show();
			}else{
				$("#repaymenting_photoDiv").hide();
				$("#reloan_photoDiv").show();
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
			url : "/admin/loan/loanreqinfo?uuid=" + uuid,
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

				
				//数据显示更新 by why 20160918
				$("#loanPurpose").html(data.loanInfo.loanPurpose);
				$("#hostOpinion").html(data.loanInfo.hostOpinion);
				$("#loan_remark").html(data.loanInfo.remark);
				var loan_product="";
				switch(data.loanInfo.loan_product)
				{
				case "0":
					loan_product="车抵贷";
					break;
				case "1":
					loan_product="押车贷";
					break;
				case "2":
					loan_product="车主贷";
					break;
				case "3":
					loan_product="车商贷";
					break;
				case "4":
					loan_product="首付贷";
					break;
				case "5":
					loan_product="二手车分期";
					break;
				case "6":
					loan_product="以租代购";
					break;
				}
				$("#loan_product").html(loan_product);
				
				$("#buy_car_method").html(data.loanInfo.buy_car_method=="0"?"全款":"按揭");


				$("#plantype").html(data.loanInfo.plantype=="0"?"综合服务按月收取":"综合服务费一次性收取");
				
				$("#drunkDrive").html(data.loanInfo.drunkDrive+"%");
				
				$("#depreciationFee").html(data.loanInfo.depreciationFee+"%");
							
				$("#parkCost").html((data.loanInfo.parkCost==""?"0":data.loanInfo.parkCost)+"元");
				//数据显示更新 by why 20160918
				
				

			}
		});
		function getRoundDigital(digit, length) {
			length = length ? parseInt(length) : 0;
			if (length <= 0) return Math.round(digit);
			digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
			return digit;
		}
		$.ajax({
					url : "/admin/customer/loanerDetailInfo?uuid=" + customerId,
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
						$("#customerId").val(data.customerAdditionalInfo.customerId);
						
						//数据显示更新 by why 20160918

						$("#sex").html(data.customerRegisterInfo.sex=='M'?'男':'女');
						$("#age").html(data.customerRegisterInfo.age);
						var customer_from;
						switch(data.customerAdditionalInfo.customer_from)
						{
						case 0:
							customer_from="中  介";
							break;
						case 1:
							customer_from="客户推荐";
							break;
						case 2:
							customer_from="宣传单/卡";
							break;
						case 3:
							customer_from="小区推广";
							break;
						case 4:
							customer_from="短  信";
							break;
						case 5:
							customer_from="网络营销";
							break;
						case 6:
							customer_from="电  销";
							break;
						case 7:
							customer_from="其  他";
							break;
						}
						$("#customerFrom").html(customer_from);
						$("#homeTel").html(data.customerRegisterInfo.home_tel);
						$("#kosekiAddress").html(data.customerRegisterInfo.kosekiAddress);
						
						$("#residence_period").html(data.customerRegisterInfo.residence_period+"年");
						
						$("#number_of_children").html(data.customerRegisterInfo.number_of_children);
						
						var cohabitant="";
						switch(data.customerRegisterInfo.cohabitant)
						{
						case 0:
							cohabitant="父母";
							break;
						case 1:
							cohabitant="子女";
							break;
						case 2:
							cohabitant="配偶";
							break;
						case 3:
							cohabitant="其他";
							break;
						}
						$("#cohabitant").html("与"+cohabitant+"共住");
						
						var house = "";
						switch(data.customerRegisterInfo.house)
						{
						case "commodity":
							house="自建";
							break;
						case "commodity_mortgage":
							house="自购";
							break;
						case "kinsfolk":
							house="亲属住房";
							break;
						case "dormitory":
							house="单位住房";
							break;
						case "rent":
							house="租用"+"（月租金"+data.customerRegisterInfo.room_charge +"元）";
							break;							
						}
						
						$("#house").html(house);
						
						$("#status_of_children").html(data.customerRegisterInfo.status_of_children);
						
						$("#residence_period_current").html(data.customerRegisterInfo.residence_period_current+"年");
						
						
						var enterpriseIndustry="";
						switch(data.customerAdditionalInfo.enterpriseIndustry)
						{
						case "1":
							enterpriseIndustry="个体";
							break;
						case "2":
							enterpriseIndustry="个人独资/合伙企业";
							break;
						case "3":
							enterpriseIndustry="有限责任公司";
							break;
						case "4":
							enterpriseIndustry="国企、事业单位";
							break;
						case "5":
							enterpriseIndustry="法人";
							break;
						}
						if(data.customerAdditionalInfo.shareholding_ratio!="")
						{
							enterpriseIndustry+="(持股"+data.customerAdditionalInfo.shareholding_ratio+"%)";
						}
												
						$("#enterpriseIndustry").html(enterpriseIndustry);
										
						$("#deptName").html(data.customerAdditionalInfo.deptName);
						
						$("#has_social_security_cards").html(data.customerAdditionalInfo.has_social_security_cards==1?"有":"无");
						
						$("#dateJoined").html(data.customerAdditionalInfo.dateJoined.substring(0,10));
						
						$("#ismanufacturing").html(data.customerAdditionalInfo.ismanufacturing==1?"是":"否");
						
						var companyType="";
						switch(data.customerAdditionalInfo.companyType)
						{
						case "no":
							companyType="无";
							break;
						case "individual_businesses":
							companyType="个体商户";
							break;
						case "ltd":
							companyType="有限公司";
							break;
						}
						
						$("#companyType").html(companyType);
						
						$("#companyRegisterAt").html(data.customerAdditionalInfo.companyRegisterAt.substring(0,10));
						
						$("#has_businesslicence").html(data.customerAdditionalInfo.has_businesslicence==1?"有":"无");
						
						$("#employees_number").html(data.customerAdditionalInfo.employees_number);
						
						$("#business_hours").html(data.customerAdditionalInfo.business_hours.substring(0,10));
						
						$("#business").html(data.customerAdditionalInfo.business);
						
						$("#incomeStatement").html(data.customerAdditionalInfo.incomeStatement);
						
						$("#house_number").html(data.customerAdditionalInfo.house_number);
						
						$("#house_buy_date").html(data.customerAdditionalInfo.house_buy_date.substring(0,10));
						
						$("#house_addr").html(data.customerAdditionalInfo.house_addr);
						
						$("#car_license_plate").html(data.customerAdditionalInfo.car_license_plate);
						
						$("#car_brand").html(data.customerAdditionalInfo.car_brand);
						
						$("#house_buy_price").html(data.customerAdditionalInfo.house_buy_price+"万元");
						
						$("#car_buy_date").html(data.customerAdditionalInfo.car_buy_date.substring(0,10));
						
						$("#bare_car_price").html(data.customerAdditionalInfo.bare_car_price);
						
						$("#family_car_number").html(data.customerAdditionalInfo.family_car_number);
						
						var house_ownership="";
						switch(data.customerAdditionalInfo.house_ownership)
						{
						case 0:
							house_ownership="本人名下";
							break;
						case 1:
							house_ownership="配偶或父母名下";
							break;
						case 2:
							house_ownership="自建房";
							break;
						case 3:
							house_ownership="其他";
							break;
						}
						$("#house_ownership").html(house_ownership);
						
						$("#house_buy_way").html(data.customerAdditionalInfo.house_buy_way=="0"?"一次性":"按揭(月供"+data.customerAdditionalInfo.house_monthly_mortgage_payment+"元)");
						
						$("#car_buy_way").html(data.customerAdditionalInfo.car_buy_way=="0"?"一次性":"按揭(月供"+data.customerAdditionalInfo.car_monthly_mortgage_payment+"元)");
						
						$("#insurance_type").html(data.customerAdditionalInfo.insurance_type);
						//数据显示更新 by why 20160918
						
						

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
													$("#spouse_ck").attr("checked",result[i].know);
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
													$("#immediate_ck1").attr("checked",result[i].know);
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
													$("#immediate_ck2").attr("checked",result[i].know);
												}
												if (result[i].contactsTel == "其他联系人1") {
													$("#other_id1").val(result[i].id);
													$("#other_name1").html(
															result[i].contactsName);
													$("#other_relation1").html(
															result[i].relation);
													$("#other_mobile1").html(
															result[i].contactsMobile);
													$("#other_ck1").attr("checked",result[i].know);
												}
												if (result[i].contactsTel == "其他联系人2") {
													$("#other_id2").val(result[i].id);
													$("#other_name2").html(
															result[i].contactsName);
													$("#other_relation2").html(
															result[i].relation);
													$("#other_mobile2").html(
															result[i].contactsMobile);
													$("#other_ck2").attr("checked",result[i].know);
												}
											});
								})
					}
				});
		$.ajax({
			url : "/admin/customer/getCarInfo?uuid=" + uuid,
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
				var vehicleBrand=data.guaranteeEvaluateInfo.vehicleBrand;
				$("#vehicleBrand").html(vehicleBrand);
				var vehicleModels=data.guaranteeEvaluateInfo.vehicleModels;
				$("#vehicleModels").html(vehicleModels);
				var vehicleNo=data.guaranteeEvaluateInfo.vehicleNo;
				$("#vehicleNo").html(vehicleNo);
				$("#mileaged").html(data.guaranteeEvaluateInfo.mileaged+"km");
				$("#purchaseDate").html(data.guaranteeEvaluateInfo.purchaseDate);
				$("#vehicleIdentification").html(data.guaranteeEvaluateInfo.vehicleIdentification);
				var engineNo=data.guaranteeEvaluateInfo.engineNo;
				$("#engineNo").html(engineNo);
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
				//机动车登记号码
				$("#vehicleRegisterCode").html(data.guaranteeEvaluateInfo.vehicleRegisterCode);

				$("#evaluateConclusion").html(data.guaranteeEvaluateInfo.evaluateConclusion);
				//坏账处理添加信息
				$("#op_box_badLoanApplication tr:last").after("<tr id=badLoanApplicationInfo><td>"+vehicleBrand+"</td><td>"+vehicleModels+"</td><td>"+vehicleNo+"</td><td>"+engineNo+"</td><td id=badLoanApplicationInfo_td5></td></tr>")
			}})
				$.ajax({
					url : "/admin/loan/getcollectionRecord/" + uuid + ".html",
					type : "get",
					dataType : "json",
					success : function(data) {
					
						var collection = "";
						for(var i=0;i<data.loanReviewRecord.length;i++){
							var details =data.loanReviewRecord[i];
							var status=details.reviewStatus;
							var type=data.urgeType[status];
							if(type==null){
								type="电话催收";
							}
						
							var str="<tr>"
								   +"<td>"+(i+1)+"</td>"
							       +"<td>"+details.name+"</td>"
                                   +"<td>"+type+"</td>"
							       +"<td>"+details.createdAt+"</td>"
							       +"<td>"+details.reviewConclusion+"</td>"
							       +"</tr>"
                        collection=collection+str;
						}
//                        $("#collection tr:last").after(collection);
						$("#collection_tbody").append(collection);
						}});
		$.ajax({
			url : "/admin/loan/getLoanAfterReviewRecord/" + uuid + ".html",
			type : "get",
			dataType : "json",
			success : function(data) {
				var count=data.loanReviewRecordSize;
				var collection1 = "";
				var truckStatus="";
				for(var i=0;i<count;i++){
					var details =data.loanReviewRecord[i];
					var reviewstatusstr;
					if(details.reviewLevel=="detainCar"){
						truckStatus=data.nameEnums[details.reviewStatus];
					}
					reviewstatusstr=data.nameEnums[details.reviewStatus];
					if(reviewstatusstr==null||reviewstatusstr==''){
					reviewstatusstr="通过";
					}
					
					//进行还款：repayment  申请续借：renew  完成本次催收：continueRepaymenting 申请逾期处理：overdueHandle
					//正常还款：commonRepayment  续借还款：continueRepayment  提前还款：advancedRepayment 放弃还款：abandonRepayment
					var realname=details.user;
					if(realname!=null){
						realname=realname.realname;
					}
					else{
						realname="-";
					}
					var str="<tr>"
						+"<td>"+details.reviewname+":"+data.loanStatus[details.reviewLevel]+"</td>"
						+"<td>"+realname+"</td>"
						+"<td>"+reviewstatusstr+"</td>"
						+"<td>"+details.reviewConclusion+"</td>"
						+"<td>"+details.createdAt+"</td>"
						+"</tr>"
					collection1=collection1+str;
				}
//              $("#collection tr:last").after(collection);
				$("#reviewresult").append(collection1);
				$("#badLoanApplicationInfo_td5").text(truckStatus);
			}});
				$.ajax({
					url : "/admin/loan/review/recordnew/" + uuid + ".html",
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
						var personalInformation="";
						var title="";
						var vehicleInformation="";
						var contractInformation="";
						var otherInformation="";
						var recordingInformation="";
						for(var q=0;q<data.loanInfoAttachmentssize;q++){
							path=data.loanInfoAttachments[q];
							type=path.attachmentType;
							title=path.attachmentTitle.split("-")[0];
							if(type=="idCardType"||type=="idCardBack"||type=="Illegal"||type=="litigation"||type=="trialPhaseReview"
							   ||type=="businessInformation"||type=="heWarrants"||type=="visiteCheckReview"){
							 var ul='<li> <div class="file_img"> <p class="tools">'
							        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
							        +'<h4>'+title+'</h4>'
							        +'</li>';
							   personalInformation=personalInformation+ul;    
							}
							$("#personalInformation").html(personalInformation);
							if(type=="oneCarPhoto"||type=="vehiclStatusOne"||type=="vehicleLicense"||type=="registrationCertificateOne"||type=="businessInsurancePolicy"||type=="vehiclStatusThree"||type=="vehiclStatusFour"
							   ||type=="spareKey"||type=="vehiclStatusTwo"||type=="gpsInstall"||type=="locationSuccess"||type=="vehicleDriveCard"||type=="registrationCertificateTwo"||type=="insurancePolicy"||type=="falseKey"
							   ||type=="pledgeVehicleConsultArchives"){
							 var ul='<li> <div class="file_img"> <p class="tools">'
							        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
							        +'<h4>'+title+'</h4>'
							        +'</li>';
							   vehicleInformation=vehicleInformation+ul;    
							}
							$("#vehicleInformation").html(vehicleInformation);
							if(type=="loanContractOne"||type=="mortgageContractOne"||type=="pledgeContract"||type=="loanReceipt"||type=="signTheContract"||type=="loanContractTwo"||type=="mortgageContractTwo"
							   ||type=="pledgeContractTwo"||type=="lendedReview"||type=="signContractReview"||type=="continueUpload"){
							 var ul='<li> <div class="file_img"> <p class="tools">'
							        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
							        +'<h4>'+title+'</h4>'
							        +'</li>';
							   contractInformation=contractInformation+ul;    
							}
							$("#contractInformation").html(contractInformation);
							if(type=="other"){
							 var ul='<li> <div class="file_img"> <p class="tools">'
							        +'<a href="javascript:void(0);" onclick="pictureDownload('+path.id+')" title="保存"><i class="fa  fa-save"></i></a>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="example-set" data-title="'+title+'" title="放大"><i class="fa  fa-search-plus"></i></a></p>'
							        +'<a href="'+path.attachmentPath+'" data-lightbox="set_img" data-title="'+title+'" title="放大"><img class="example-image" src="'+path.attachmentPath+'"  id="idCardType" /></a> </div>'
							        +'<h4>'+title+'</h4>'
							        +'</li>';
							   otherInformation=otherInformation+ul;    
							}
							$("#otherInformation").html(otherInformation);
							if(type=="telephoneRecordings"){
							var ul='<li> <div class="file_img"> <p class="tools">'
							       +'<a  href="#" title="下载"  onclick="pictureDownload('+path.id+')"><i class="fa fa-cloud-download" >'
							       +'</i></a></p><img class="example-image" src="/img/luyin.jpg" alt="录音"/></div>'
							       +'<h4>电话回访录音</h4></li>';
							   recordingInformation=recordingInformation+ul;    
							}
							$("#recordingInformation").html(recordingInformation);
						}
                        for(var j=0;j<repayPlanVocount;j++){
							var	record=data.repayPlanVo.planList[j];
							var date = new Date(record.repayDate.replace(/-/g, "/")).Format("yyyy-MM-dd");
							var html = "";
							html += "<tr>";
							html += "<td align='center'>" + record.repayPeriod + "</td>";
							html += "<td align='center'>" + record.repayCapital + "</td>";
							html += "<td align='center'>" + record.repayInterest + "</td>";
							html += "<td align='center'>" + record.depreciationFee + "</td>";
							html += "<td align='center'>" + record.gpsCost + "</td>";
							html += "<td align='center'>" + record.drunkDrive + "</td>";
							html += "<td align='center'>" + record.parkCost + "</td>";
							html += "<td align='center'>" + record.cashdepositFee + "</td>";
							html += "<td align='center'>" + record.overdueFee + "</td>";
							html += "<td align='center'>" + record.penaltyFee + "</td>";
							html += "<td align='center'>" + record.checkCost + "</td>";
	                        html += "<td align='center'>" + record.towCost + "</td>";
							html += "<td align='center'>" + record.repayTotal + "</td>";
							html += "<td align='center'>" + date + "</td>";
							html += "</tr>";
							repayPlanVo=repayPlanVo+html;
						}
                        debugger;
						//计算合计金额
						var sum = accAdd(data.repayPlanVo.sumInvest, data.repayPlanVo.sumCaptial);
						//sum = accAdd(sum,data.repayPlanVo.sumManageFee);
						sum = accAdd(sum,data.repayPlanVo.sumGpsFee);
						sum = accAdd(sum,data.repayPlanVo.sumCheckFee);
						sum = accAdd(sum,data.repayPlanVo.sumParkFee);
						sum = accAdd(sum,data.repayPlanVo.sumDepreciationFee);
						sum = accAdd(sum,data.repayPlanVo.sumdrunkDrugDrive);
						sum = accAdd(sum,data.repayPlanVo.sumcashdepositFee);
						sum = accAdd(sum,data.repayPlanVo.sumPenaltyFee);
						sum = accAdd(sum,data.repayPlanVo.sumOverdueFee);
						sum = accAdd(sum,data.repayPlanVo.sumTowCost);
						repayPlanVo=repayPlanVo+
							"<tr>" + "<td align='center'>合计：</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumCaptial + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumInvest + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumDepreciationFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumGpsFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumdrunkDrugDrive + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumParkFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumcashdepositFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumOverdueFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumPenaltyFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumCheckFee + "</td>"
							+ "<td align='center'>" + data.repayPlanVo.sumTowCost + "</td>"
							+ "<td align='center'>" + sum.toFixed(2) + "</td>"
							+ "<td align='center'>----</td>"
							+"</tr>";
						$("#repayPlanVo tr:last").after(repayPlanVo);
						var restSum=sum.toFixed(2)-data.repaySum;
						var sumCaptialInvest=accAdd(data.repayPlanVo.sumCaptial,data.repayPlanVo.sumInvest);
						$("#badLoanApplicationInfo").append("<td>"+data.repayPlanVo.sumOverdueFee+"</td><td>"+data.repayPlanVo.sumGpsFee+"</td><td>"+data.repayPlanVo.sumDepreciationFee+"</td><td>"+sumCaptialInvest.toFixed(2)+"</td><td>"+restSum.toFixed(2)+"</td>");
                        
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
						&&window.location.href.indexOf("newtask")==-1&& window.location.href.indexOf("repaymentList") == -1)
				{
					$("#submitA").css("display","none");
				}
				/*BUG323*/


	})
	function pictureDownload(oid){
       $("#downloadIframe").attr("src","/admin/loan/getroute?id=" + oid);
    }
